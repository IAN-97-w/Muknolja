package com.spring.muknolja.common.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class QA {
	private int qaId;
	private String qaWriter;
	private String qaTitle, qaContent, qaYn, qaReplyContent;
	private Date qaCreateDate;
	private String qaStatus;
	
}