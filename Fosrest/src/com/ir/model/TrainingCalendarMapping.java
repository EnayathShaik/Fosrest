package com.ir.model;

	import javax.persistence.Column;
	import javax.persistence.Entity;
	import javax.persistence.GeneratedValue;
	import javax.persistence.GenerationType;
	import javax.persistence.Id;
	import javax.persistence.Table;


	@Entity
	@Table(name="TrainingCalendarMapping")
	public class TrainingCalendarMapping {

			@Id
		 	@GeneratedValue(strategy=GenerationType.SEQUENCE)
		 	@Column(name= "TCMappingId")
		 	private int TCMappingId;
			
			private int subjectId;
			private String batchCode;
			private int trainerId;
			private String subjectDate;
			private int day;
			
			
			public String getSubjectDate() {
				return subjectDate;
			}
			public void setSubjectDate(String subjectDate) {
				this.subjectDate = subjectDate;
			}
			public int getDay() {
				return day;
			}
			public void setDay(int day) {
				this.day = day;
			}
			public int getTCMappingId() {
				return TCMappingId;
			}
			public void setTCMappingId(int tCMappingId) {
				TCMappingId = tCMappingId;
			}
			public int getSubjectId() {
				return subjectId;
			}
			public void setSubjectId(int subjectId) {
				this.subjectId = subjectId;
			}
			public String getBatchCode() {
				return batchCode;
			}
			public void setBatchCode(String batchCode) {
				this.batchCode = batchCode;
			}
			public int getTrainerId() {
				return trainerId;
			}
			public void setTrainerId(int trainerId) {
				this.trainerId = trainerId;
			}
		
	}