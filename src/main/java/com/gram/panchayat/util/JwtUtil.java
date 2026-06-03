package com.gram.panchayat.util;

import com.gram.panchayat.model.User;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

import org.springframework.stereotype.Component;

import java.security.Key;
import java.util.Date;

@Component
public class JwtUtil {

	private final String SECRET = "mysecretkeymysecretkeymysecretkey12345";

	private Key getKey() {
		return Keys.hmacShaKeyFor(SECRET.getBytes());
	}

	// ✅ Generate token
	public String generateToken(User user) {
		return Jwts.builder().setSubject(user.getMobileNo()).claim("role", user.getUserRole()).setIssuedAt(new Date())
				.setExpiration(new Date(System.currentTimeMillis() + 86400000)).signWith(getKey()).compact();
	}

	// ✅ FIXED method
	public Claims extractClaims(String token) {
		return Jwts.parserBuilder().setSigningKey(getKey()).build().parseClaimsJws(token).getBody();
	}
}