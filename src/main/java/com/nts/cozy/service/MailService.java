package com.nts.cozy.service;

import java.util.UUID;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

/**
 * @author 박정재
 *
 */
@Service
public class MailService {
	@Autowired
	private JavaMailSender mailSender;

	public void sendMail(String to, String subject, String content) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper;
			messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(to);
			messageHelper.setText(content);
			messageHelper.setFrom("cozy@gmail.com");
			messageHelper.setSubject(subject);

			mailSender.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public String getAuthCode() {
		return UUID.randomUUID().toString().substring(0, 5);
	}

	public String getRandomPassword() {
		return UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);
	}
}
