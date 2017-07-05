package com.ir.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;



public class TraineeAttendanceForm {


private String traineeUniqueCode;
private String batchCode;

public String getTraineeUniqueCode() {
	return traineeUniqueCode;
}

public void setTraineeUniqueCode(String traineeUniqueCode) {
	this.traineeUniqueCode = traineeUniqueCode;
}



public String getBatchCode() {
	return batchCode;
}

public void setBatchCode(String batchCode) {
	this.batchCode = batchCode;
}

	
}
