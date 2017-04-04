package com.ir.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;




@Entity
@Table(name="TaxMaster")
public class TaxMaster {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name= "taxId")
	private int taxId;
	
	
	private String serviceTaxRate;
	
	
	private String swacchaBharatCess;
	
	private String krishiKalyanCess;
	

	public TaxMaster() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getTaxId() {
		return taxId;
	}


	public void setTaxId(int taxId) {
		this.taxId = taxId;
	}


	public String getServiceTaxRate() {
		return serviceTaxRate;
	}


	public void setServiceTaxRate(String serviceTaxRate) {
		this.serviceTaxRate = serviceTaxRate;
	}


	public String getSwacchaBharatCess() {
		return swacchaBharatCess;
	}


	public void setSwacchaBharatCess(String swacchaBharatCess) {
		this.swacchaBharatCess = swacchaBharatCess;
	}


	public String getKrishiKalyanCess() {
		return krishiKalyanCess;
	}


	public void setKrishiKalyanCess(String krishiKalyanCess) {
		this.krishiKalyanCess = krishiKalyanCess;
	}


	
	
	
 
}
