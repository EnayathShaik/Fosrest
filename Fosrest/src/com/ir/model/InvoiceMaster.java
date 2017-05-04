package com.ir.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;




@Entity
@Table(name="InvoiceMaster")
public class InvoiceMaster {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name= "id")
	private int id;
	private String description;
	private String invoiceDate;
	@Column(columnDefinition="int default 0")
	private int seqNo;
	
	private String invoiceNumber;

	public InvoiceMaster() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}

	@OneToOne (cascade=CascadeType.ALL)  @JoinColumn(name="customerid")
	private CustomerMaster customer;


	public CustomerMaster getCustomer() {
		return customer;
	}


	public void setCustomer(CustomerMaster customer) {
		this.customer = customer;
	}


	public String getInvoiceDate() {
		return invoiceDate;
	}


	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}


	public String getInvoiceNumber() {
		return invoiceNumber;
	}


	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}


	public int getSeqNo() {
		return seqNo;
	}


	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}
	
 
	
	
	
}
