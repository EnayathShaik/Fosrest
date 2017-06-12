package com.ir.model;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.transaction.Transactional;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.NotEmpty;
@Entity
@Table(name="languages")
@Transactional
public class Languages {
	@Id
	@Column(name="languageId")
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int languageId;
	
	@Column(name="languageName")
	@NotEmpty(message="Please selct your business type !")
	private String languageName;

	public int getLanguageId() {
		return languageId;
	}

	public void setLanguageId(int languageId) {
		this.languageId = languageId;
	}

	public String getLanguageName() {
		return languageName;
	}

	public void setLanguageName(String languageName) {
		this.languageName = languageName;
	}


	public Languages() {
		
	}

	public Languages(int languageId, String languageName) {
		super();
		this.languageId = languageId;
		this.languageName = languageName;
	}


	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date")
	private Date createDate;

	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "modify_date")
	private Date modifyDate;

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	
}
