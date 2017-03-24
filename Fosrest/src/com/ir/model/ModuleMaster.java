package com.ir.model;


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
import org.hibernate.annotations.ColumnDefault;



/**
 * @author Jyoti Mekal
 *
 * New Table for Unit Master
 */
@Entity
@Table(name="ModuleMaster")
public class ModuleMaster {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name= "moduleId")
	private int moduleId;
	private String moduleName;
	private String status;
	
	
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



	



	
 
}
