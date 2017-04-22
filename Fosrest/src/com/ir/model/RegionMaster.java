package com.ir.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name="RegionMaster")
public class RegionMaster {
	
	@Id @GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int id;

	@NotNull
	private String regionName;
	private String status;
	
	@OneToOne   @JoinColumn(name="cityId")
	private CityMaster cityMaster;
	
	@Column(name="isActive", columnDefinition="character varying(10) default 'A'")
	private String isActive;
	
	
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	public CityMaster getCityMaster() {
		return cityMaster;
	}
	public void setCityMaster(CityMaster cityMaster) {
		this.cityMaster = cityMaster;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	@Override
	public String toString() {
		return "Region [id=" + id  + ", regionName=" + regionName + "]";
	}
	public RegionMaster() {
		super();
		// TODO Auto-generated constructor stub
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
