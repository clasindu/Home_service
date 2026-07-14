package com.homeservice.auth.service;

import com.homeservice.auth.dto.AuthResponse;
import com.homeservice.auth.dto.LoginRequest;
import com.homeservice.auth.dto.RefreshRequest;
import com.homeservice.auth.dto.RegisterRequest;
import com.homeservice.auth.jwt.JwtService;
import com.homeservice.auth.jwt.RefreshToken;
import com.homeservice.auth.repository.RefreshTokenRepository;
import com.homeservice.common.exception.EmailAlreadyInUseException;
import com.homeservice.common.exception.InvalidRefreshTokenException;
import com.homeservice.user.entity.Role;
import com.homeservice.user.entity.User;
import com.homeservice.user.repository.UserRepository;
import com.homeservice.worker.entity.Worker;
import com.homeservice.worker.repository.WorkerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.Instant;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UserRepository userRepository;
    private final WorkerRepository workerRepository;
    private final RefreshTokenRepository refreshTokenRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;

    @Transactional
    public AuthResponse register(RegisterRequest req) {
        if (userRepository.existsByEmail(req.email())) {
            throw new EmailAlreadyInUseException(req.email());
        }

        User user = User.builder()
                .email(req.email())
                .passwordHash(passwordEncoder.encode(req.password()))
                .fullName(req.fullName())
                .phone(req.phone())
                .role(req.role())
                .build();
        user = userRepository.save(user);

        // If registering as a WORKER, create the role-specific extension row.
        if (req.role() == Role.WORKER) {
            Worker worker = Worker.builder()
                    .user(user)
                    .verified(false)
                    .available(true)
                    .avgRating(BigDecimal.ZERO)
                    .ratingCount(0)
                    .build();
            workerRepository.save(worker);
        }

        return issueTokens(user);
    }

    @Transactional
    public AuthResponse login(LoginRequest req) {
        // Throws BadCredentialsException (handled globally) if credentials are wrong.
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(req.email(), req.password()));

        User user = userRepository.findByEmail(req.email()).orElseThrow();
        return issueTokens(user);
    }

    @Transactional
    public AuthResponse refresh(RefreshRequest req) {
        String hash = jwtService.hash(req.refreshToken());
        RefreshToken stored = refreshTokenRepository.findByTokenHashAndRevokedFalse(hash)
                .orElseThrow(InvalidRefreshTokenException::new);

        if (stored.getExpiresAt().isBefore(Instant.now())) {
            throw new InvalidRefreshTokenException();
        }

        // Rotate: revoke the used token and issue a fresh pair.
        stored.setRevoked(true);
        refreshTokenRepository.save(stored);

        return issueTokens(stored.getUser());
    }

    @Transactional
    public void logout(String rawRefreshToken) {
        String hash = jwtService.hash(rawRefreshToken);
        refreshTokenRepository.findByTokenHashAndRevokedFalse(hash)
                .ifPresent(t -> {
                    t.setRevoked(true);
                    refreshTokenRepository.save(t);
                });
    }

    private AuthResponse issueTokens(User user) {
        String accessToken = jwtService.generateAccessToken(user);
        String rawRefresh = jwtService.generateRawRefreshToken();

        RefreshToken refreshToken = RefreshToken.builder()
                .user(user)
                .tokenHash(jwtService.hash(rawRefresh))
                .expiresAt(Instant.now().plusMillis(jwtService.getRefreshTokenExpiryMs()))
                .revoked(false)
                .createdAt(Instant.now())
                .build();
        refreshTokenRepository.save(refreshToken);

        return new AuthResponse(
                accessToken, rawRefresh, user.getId(), user.getFullName(), user.getRole());
    }
}
