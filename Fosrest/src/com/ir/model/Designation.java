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
@Table(name="designation")
@Transactional
public class Designation {
	@Id
	@Column(name="designationId")
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int designationId;
	
	@Column(name="designationName")
	@NotEmpty(message="Please select your business type !")
	private String designationName;
	
	/*@Column(name="designationCode")
	@NotEmpty(message="Please select your business type !")
	private String designationCode;*/

	public int getDesignationId() {
		return designationId;
	}

	public void setDesignationId(int designationId) {
		this.designationId = designationId;
	}

	public String getDesignationName() {
		return designationName;
	}

	public void setDesignationName(String designationName) {
		this.designationName = designationName;
	}

	/*public String getDesignationCode() {
		return designationCode;
	}

	public void setDesignationCode(String designationCode) {
		this.designationCode = designationCode;
	}*/

	public Designation() {
		
	}

	public Designation(int designationId, String designationName) {
		super();
		this.designationId = designationId;
		this.designationName = designationName;
	}

	@Override
	public String toString() {
		return "designationId=" + designationId + ", designationName=" + designationName ;
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
