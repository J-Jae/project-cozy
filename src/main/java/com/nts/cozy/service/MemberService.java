package com.nts.cozy.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.nts.cozy.vo.Member;

/**
 * @author 신창환
 *
 */
public interface MemberService extends UserDetailsService {

	Member getMember(String email);

	boolean unregisterMember(String email);

	boolean registerMember(Member member);
	
	boolean modifyPassword(String email, String password);

	boolean modifyMember(Member member);

	boolean addAuthorityByEmail(String email, String authority);
	
	boolean addAuthorityByNickname(String nickname, String authority);

	PasswordEncoder passwordEncoder();

}
