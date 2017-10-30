package com.nts.cozy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.nts.cozy.service.MemberService;

/**
 * @author project_신창환
 * 
 * spring security 설정
 * 1. 접근권한 설정
 * 2. 로그인 설정
 * 3. 로그아웃 설정
 * 
 * 본 프로젝트에서 csrf 공격은 고려하지 않기로 결정. <sec:csrfInput />
 */
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	@Autowired
	MemberService memberService;

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();

		http 
			.authorizeRequests() // access
			.antMatchers("/javascript/**").permitAll()
			.antMatchers("/css/**").permitAll()
			.antMatchers("/img/**").permitAll()
			.antMatchers("/upload/**").permitAll()
			.antMatchers("/error/**").permitAll()
			.antMatchers("/").permitAll()
			.antMatchers("/index").permitAll()
			.antMatchers("/review").permitAll()
			.antMatchers("/review/detail/**").permitAll()
			.antMatchers("/store").permitAll()
			.antMatchers("/store/detail/**").permitAll()
			.antMatchers("/reply/json/**").permitAll()
			.antMatchers("/reply/all/**").permitAll()
			.antMatchers("/member/login").anonymous()
			.antMatchers("/member/register").anonymous()
			.antMatchers("/member/mail").anonymous()
			.antMatchers("/member/find").anonymous()
			.antMatchers("/upload/**").permitAll()
			.antMatchers("/review").permitAll()
			.antMatchers("/**/list/**").permitAll()
			.antMatchers("/report/register/**").hasAuthority("MEMBER")
			.antMatchers("/report/popup/**").hasAuthority("MEMBER")
			.antMatchers("/report/**").hasAuthority("ADMIN")
			.anyRequest().authenticated()
			.and() // login
			.formLogin()
			.loginPage("/member/login")
			.loginProcessingUrl("/loginProcessing")
			.usernameParameter("email")
			.passwordParameter("password")
			.successForwardUrl("/index")
			.failureUrl("/member/login?error=yes")
			.permitAll()
			.and() // logout
			.logout()
			.logoutUrl("/member/logout")
			.deleteCookies("JSESSIONID")
			.logoutSuccessUrl("/index");
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(memberService).passwordEncoder(memberService.passwordEncoder());
	}

}
