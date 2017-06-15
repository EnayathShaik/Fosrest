package com.ir.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="SubjectMapping")
public class SubjectMapping {

		@Id
	 	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	 	@Column(name= "subjectMappingId")
	 	private int subjectMappingId;
	 	
		private String scheduleCode;
	 	private String subject;
	 	private String duration;

	 	
	 	
		public int getSubjectMappingId() {
			return subjectMappingId;
		}
		public void setSubjectMappingId(int subjectMappingId) {
			this.subjectMappingId = subjectMappingId;
		}
		
		public String getScheduleCode() {
			return scheduleCode;
		}
		public void setScheduleCode(String scheduleCode) {
			this.scheduleCode = scheduleCode;
		}
		public String getDuration() {
			return duration;
		}
		public void setDuration(String duration) {
			this.duration = duration;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
	


	
	
}
