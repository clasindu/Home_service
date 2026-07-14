package com.homeservice.common.security;

import com.homeservice.user.entity.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

/**
 * Resolves the currently authenticated {@link User} from the security context.
 * The JWT filter places the User (which implements UserDetails) as the principal,
 * so this returns it directly.
 */
@Component
public class CurrentUserProvider {

    public User require() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !(auth.getPrincipal() instanceof User user)) {
            throw new IllegalStateException("No authenticated user in context");
        }
        return user;
    }
}
