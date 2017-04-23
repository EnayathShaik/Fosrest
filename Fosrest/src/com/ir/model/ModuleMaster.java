
package com.ir.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.CascadeType;
import javax.persistence.CascadeType;
import javax.validation.constraints.*;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.validator.constraints.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;



/**
 * @author Jyoti Mekal
 *
 * New Table for Unit Master
 */
@Entity
@Table(name="ModuleMaster")
public class ModuleMaster {
	
/*	@Override
	public String toString() {
		return "ModuleMaster [moduleId=" + moduleId + ", moduleName="
				+ moduleName + ", status=" + status + ", unitMaster="
				+ unitMaster + "]";
	}


	@Override
	public String toString() {
		return moduleName ;
	}*/
	

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name= "moduleId")
	private int moduleId;
	
	private String moduleName;
	private String status;
	private String contentType;
	private String contentName;
	private String contentLink;
	private String moduleCode;
	@Column(columnDefinition="int default 0")
	private int seqNo;
	
	@Column(name="isActive", columnDefinition="character varying(10) default 'Y'")
	private String isActive;
	
	
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	
	
	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	@OneToOne   @JoinColumn(name="unitId")
	private UnitMaster unitMaster;
	
	

	public UnitMaster getUnitMaster() {
		return unitMaster;
	}



	public void setUnitMaster(UnitMaster unitMaster) {
		this.unitMaster = unitMaster;
	}



	public ModuleMaster() {
		super();
		// TODO Auto-generated constructor stub
	}



	public int getModuleId() {
		return moduleId;
	}



	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}



	public String getModuleName() {
		return moduleName;
	}



	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	
	@Override
	public String toString() {
		return  moduleName ;
	}



	public String getContentType() {
		return contentType;
	}



	public void setContentType(String contentType) {
		this.contentType = contentType;
	}



	public String getContentName() {
		return contentName;
	}



	public void setContentName(String contentName) {
		this.contentName = contentName;
	}



	public String getContentLink() {
		return contentLink;
	}



	public void setContentLink(String contentLink) {
		this.contentLink = contentLink;
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



	public String getModuleCode() {
		return moduleCode;
	}



	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}



	public int getSeqNo() {
		return seqNo;
	}



	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}




	
 
}
