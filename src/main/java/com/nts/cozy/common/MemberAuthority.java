package com.nts.cozy.common;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;

/**
 * @author 신창환
 *
 */
public enum MemberAuthority {
	MEMBER{
		@Override
		public List<GrantedAuthority> getAuthorities() {
			return AuthorityUtils.createAuthorityList("MEMBER");
		}
		
	}
	, HOST{
		@Override
		public List<GrantedAuthority> getAuthorities() {
			return AuthorityUtils.createAuthorityList("MEMBER", "HOST");
		}
		
	}
	, ADMIN{
		@Override
		public List<GrantedAuthority> getAuthorities() {
			return AuthorityUtils.createAuthorityList("MEMBER", "HOST", "ADMIN");
		}
		
	};
	
	abstract public List<GrantedAuthority> getAuthorities();
}
