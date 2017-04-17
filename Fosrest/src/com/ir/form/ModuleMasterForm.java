package com.ir.form;



import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class ModuleMasterForm {
	
	private int moduleId;
	
	private String moduleName;
	private String status;
	private int unitId;
	private String contentType;
	private String contentName;
	private String contentLink;
	
	
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getUnitId() {
		return unitId;
	}
	public void setUnitId(int unitId) {
		this.unitId = unitId;
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
	

}
