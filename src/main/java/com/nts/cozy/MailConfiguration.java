package com.nts.cozy;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSenderImpl;

/**
 * @author 박정재
 *
 */
@Configuration
public class MailConfiguration {

	@Bean
	public JavaMailSenderImpl mailSender() {
		JavaMailSenderImpl mail = new JavaMailSenderImpl();
		mail.setHost("smtp.gmail.com");
		mail.setUsername("cozyauthenticator");
		mail.setPassword("cozycozy");

		Properties javaMailProperties = new Properties();
		javaMailProperties.setProperty("mail.smtp.auth", "true");
		javaMailProperties.setProperty("mail.smtp.starttls.enable", "true");

		mail.setJavaMailProperties(javaMailProperties);

		return mail;
	}

}
