package com.ir.form;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.validator.constraints.NotEmpty;

import java.sql.Date;

import javax.validation.constraints.NotNull;


public class TrainerRequestForm {


	

		@NotEmpty(message="Plz select trainingType")
		private String trainingType;
		@NotEmpty(message="Plz select userType")
		private String userType;
		@NotEmpty(message="Plz select Status")
		private String status;
		private String trainingStartDate;
		private String module;
		private String unit;
		private String trainingCenter;
		private String trainingEndDate;
		private String nop;
		private String updateHistory;
		private String accUpd;
		private String canRej;
		private int id;

		

		public String getTrainingStartDate() {
			return trainingStartDate;
		}

		public void setTrainingStartDate(String trainingStartDate) {
			this.trainingStartDate = trainingStartDate;
		}

		public String getTrainingEndDate() {
			return trainingEndDate;
		}

		public void setTrainingEndDate(String trainingEndDate) {
			this.trainingEndDate = trainingEndDate;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getModule() {
			return module;
		}

		public void setModule(String module) {
			this.module = module;
		}

		public String getUnit() {
			return unit;
		}

		public void setUnit(String unit) {
			this.unit = unit;
		}

		public String getTrainingCenter() {
			return trainingCenter;
		}

		public void setTrainingCenter(String trainingCenter) {
			this.trainingCenter = trainingCenter;
		}

		public String getNop() {
			return nop;
		}

		public void setNop(String nop) {
			this.nop = nop;
		}

		public String getUpdateHistory() {
			return updateHistory;
		}

		public void setUpdateHistory(String updateHistory) {
			this.updateHistory = updateHistory;
		}

		public String getAccUpd() {
			return accUpd;
		}

		public void setAccUpd(String accUpd) {
			this.accUpd = accUpd;
		}

		public String getCanRej() {
			return canRej;
		}

		public void setCanRej(String canRej) {
			this.canRej = canRej;
		}

		public String getTrainingType() {
			return trainingType;
		}

		public void setTrainingType(String trainingType) {
			this.trainingType = trainingType;
		}

		public String getUserType() {
			return userType;
		}

		public void setUserType(String userType) {
			this.userType = userType;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

	}


