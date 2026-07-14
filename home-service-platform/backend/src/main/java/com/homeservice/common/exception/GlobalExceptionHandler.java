package com.homeservice.common.exception;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.LinkedHashMap;
import java.util.Map;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(EmailAlreadyInUseException.class)
    public ProblemDetail handleEmailInUse(EmailAlreadyInUseException ex, HttpServletRequest req) {
        return problem(HttpStatus.CONFLICT, ex.getMessage(), req);
    }

    @ExceptionHandler(InvalidRefreshTokenException.class)
    public ProblemDetail handleInvalidRefresh(InvalidRefreshTokenException ex, HttpServletRequest req) {
        return problem(HttpStatus.UNAUTHORIZED, ex.getMessage(), req);
    }

    @ExceptionHandler(BadCredentialsException.class)
    public ProblemDetail handleBadCredentials(BadCredentialsException ex, HttpServletRequest req) {
        return problem(HttpStatus.UNAUTHORIZED, "Invalid email or password", req);
    }

    @ExceptionHandler(ResourceNotFoundException.class)
    public ProblemDetail handleNotFound(ResourceNotFoundException ex, HttpServletRequest req) {
        return problem(HttpStatus.NOT_FOUND, ex.getMessage(), req);
    }

    @ExceptionHandler(ForbiddenActionException.class)
    public ProblemDetail handleForbidden(ForbiddenActionException ex, HttpServletRequest req) {
        return problem(HttpStatus.FORBIDDEN, ex.getMessage(), req);
    }

    // Invalid booking state-machine transitions surface as 409 Conflict.
    @ExceptionHandler(IllegalStateException.class)
    public ProblemDetail handleIllegalState(IllegalStateException ex, HttpServletRequest req) {
        return problem(HttpStatus.CONFLICT, ex.getMessage(), req);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ProblemDetail handleValidation(MethodArgumentNotValidException ex, HttpServletRequest req) {
        Map<String, String> fieldErrors = new LinkedHashMap<>();
        ex.getBindingResult().getFieldErrors().forEach(fe ->
                fieldErrors.put(fe.getField(), fe.getDefaultMessage()));
        ProblemDetail pd = problem(HttpStatus.BAD_REQUEST, "Validation failed", req);
        pd.setProperty("fieldErrors", fieldErrors);
        return pd;
    }

    @ExceptionHandler(Exception.class)
    public ProblemDetail handleGeneric(Exception ex, HttpServletRequest req) {
        return problem(HttpStatus.INTERNAL_SERVER_ERROR, "An unexpected error occurred", req);
    }

    private ProblemDetail problem(HttpStatus status, String detail, HttpServletRequest req) {
        ProblemDetail pd = ProblemDetail.forStatusAndDetail(status, detail);
        pd.setProperty("path", req.getRequestURI());
        pd.setProperty("timestamp", java.time.Instant.now().toString());
        return pd;
    }
}
