package com.nts.cozy.dao;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Repository;

import com.nts.cozy.vo.Member;

/**
 * @author 박정재_신창환
 *
 */
@Repository
public interface MemberDao {

	Member selectMember(String email);
	
	Member selectMemberUsedLogin(String email);

	String selectMemberTag(String nickname);
	
	String selectMemberEmail(String nickname);
	
	List<GrantedAuthority> selectMemberAuthority(String email);

	boolean deleteMemberAuthority(String email);
	
	boolean insertMember(Member member);

	boolean insertMemberAuthority(Member member);

	boolean deleteMember(String nickname);

	boolean updatePassword(Member member);

	boolean updateMember(Member member);

}
