package com.nts.cozy.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nts.cozy.common.MemberAuthority;
import com.nts.cozy.dao.MemberDao;
import com.nts.cozy.vo.Member;

/**
 * @author 박정재_신창환
 *
 */
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;

	/**
	 * @author 신창환
	 * (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetailsService#loadUserByUsername(java.lang.String)
	 * @return 패스워드를 포함하는 Member
	 */
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Member member = memberDao.selectMemberUsedLogin(email);
		Collection<GrantedAuthority> authorities = memberDao.selectMemberAuthority(email);
		member.setAuthorities(authorities);

		return member;
	}

	/**
	 * @author 신창환
	 * @param email
	 * @return 패스워드를 포함하지 않는 Member
	 */
	@Override
	public Member getMember(String email) {
		Member member = memberDao.selectMember(email);

		if (member == null) {
			return member;
		}

		Collection<GrantedAuthority> authorities = memberDao.selectMemberAuthority(email);
		member.setAuthorities(authorities);

		return member;
	}

	/**
	 * @author 박정재_신창환
	 */
	@Override
	@Transactional
	public boolean registerMember(Member member) {
		String memberAuthority = MemberAuthority.MEMBER.name();
		List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList(memberAuthority);

		String rawPassword = member.getPassword();
		String encodedPassword = new BCryptPasswordEncoder().encode(rawPassword);

		member.setAuthorities(authorities);
		member.setPassword(encodedPassword);
		member.setAccountNonExpired(true);
		member.setAccountNonLocked(true);
		member.setCredentialsNonExpired(true);
		member.setEnabled(true);

		memberDao.insertMemberAuthority(member);
		return memberDao.insertMember(member);
	}

	/**
	 * @author 박정재
	 */
	@Transactional
	public boolean modifyPassword(String email, String password) {
		Member member = new Member();
		member.setEmail(email);
		member.setPassword(new BCryptPasswordEncoder().encode(password));

		return memberDao.updatePassword(member);
	}

	/**
	 * @author 박정재
	 */
	public boolean modifyMember(Member member) {
		return memberDao.updateMember(member);
	}

	/**
	 * @author 신창환
	 */
	@Override
	@Transactional
	public boolean addAuthorityByEmail(String email, String authority) {
		if(memberDao.deleteMemberAuthority(email)) {;
			List<GrantedAuthority> authorities = MemberAuthority.valueOf(authority).getAuthorities();
			
			Member member = new Member();
			member.setEmail(email);
			member.setAuthorities(authorities);
	
			return memberDao.insertMemberAuthority(member);
			
		} else {
			return false;
		}
	}

	/**
	 * @author 신창환
	 */
	@Override
	public boolean addAuthorityByNickname(String nickname, String authority) {
		String email = memberDao.selectMemberEmail(nickname);
		
		return addAuthorityByEmail(email, authority);
	}

	/**
	 * @author 박정재
	 */
	@Override
	public boolean unregisterMember(String nickname) {
		memberDao.deleteMember(nickname);
		return true;
	}

	/**
	 * @author 신창환
	 */
	@Override
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
