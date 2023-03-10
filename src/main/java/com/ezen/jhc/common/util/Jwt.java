package com.ezen.jhc.common.util;

import java.util.Date;

import javax.crypto.SecretKey;

import com.ezen.jhc.web.user.dto.member.MemberDTO;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

/**
 * @author SUJEONG
 * @param user 사용자 객체
 * 비밀번호 변경 링크에 들어가는 토큰
 * 사용자 객체로 토큰 생성
 * 
 */

public class Jwt {

    // JWT 만료 시간(30분)
    private static final long EXPIRATION_TIME = 30 * 60 * 1000L;

    // JWT 시크릿 키
    private static final SecretKey SECRET_KEY = Keys.secretKeyFor(io.jsonwebtoken.SignatureAlgorithm.HS256);
    public static String generateToken(MemberDTO member) {
        Date now = new Date();
        Date expiration = new Date(now.getTime() + EXPIRATION_TIME);

        Claims claims = Jwts.claims().setSubject(member.getMem_email());
        claims.put("mem_Email", member.getMem_email());
        

        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(now)
                .setExpiration(expiration)
                .signWith(SECRET_KEY)
                .compact();
    }
    
    
    public static boolean verifyToken(String token, String mem_email) {
    	
    	 try {
             Jws<Claims> claims = Jwts.parser()
                     .setSigningKey(SECRET_KEY)
                     .parseClaimsJws(token);

             String subject = claims.getBody().getSubject();
             return mem_email.equals(subject);

         } catch (JwtException | IllegalArgumentException e) {
             return false;
         }
    	
    	
    }

}