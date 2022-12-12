package com.spring.muknolja.mail;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public interface MailServiceInter {
	

	// ���� ���� �ۼ�
	MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException;
	

	// ���� ���� �ڵ� ����
	String createKey();

	// ���� �߼�
	String sendSimpleMessage(String to) throws Exception;
}
