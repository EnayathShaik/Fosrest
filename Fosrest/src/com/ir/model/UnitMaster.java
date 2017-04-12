package com.ir.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;



/**
 * @author Jyoti Mekal
 *
 * New Table for Unit Master
 */
@Entity
@Table(name="UnitMaster")
public class UnitMaster {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name= "unitId")
	private int unitId;
	private String userType;
	private String trainingType;
	private String trainingPhase;
	private String unitName;
	private String unitCode;
	private String status;
	@Column(columnDefinition="int default 0")
	private int seqNo;
	

	public UnitMaster() {
		super();
		// TODO Auto-generated constructor stub
	}



	public int getUnitId() {
		return unitId;
	}



	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}



	public String getUserType() {
		return userType;
	}



	public void setUserType(String userType) {
		this.userType = userType;
	}



	public String getTrainingType() {
		return trainingType;
	}



	public void setTrainingType(String trainingType) {
		this.trainingType = trainingType;
	}



	public String getTrainingPhase() {
		return trainingPhase;
	}



	public void setTrainingPhase(String trainingPhase) {
		this.trainingPhase = trainingPhase;
	}



	public String getUnitName() {
		return unitName;
	}



	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return    unitName;
	}

	



	





	public String getUnitCode() {
		return unitCode;
	}



	public void setUnitCode(String unitCode) {
		this.unitCode = unitCode;
	}



	public int getSeqNo() {
		return seqNo;
	}



	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}


	
 
}
