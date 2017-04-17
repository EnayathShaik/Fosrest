package com.zentect.list.constant;




public class DropDownListConstants {

	//State
	public static String stateId = "id";
	public static String stateName = "name";
	public static String stateTable = "state";
	
	
	//Ditrict
	public static String districtId = "id";
	public static String districtName = "name";
	public static String districtTable = "district";
	
	//Ditrict
		public static String cityid = "cityid";
		public static String cityName = "name";
		public static String cityTable = "city";
	
	
	
	
	
/*	public static void main(String[] args) {
		getDropDownList(stateId, stateName, stateTable," where CITYNAME='MH'");
		getDropDownList(cityid, cityName, cityTable," where CITYNAME='MH'");
		getDropDownList(districtId, districtName, districtTable," where CITYNAME='MH'");
		getDropDownList(districtId, districtName, districtTable,"");
	}
*/
		
		//returns a sql query 
	public   String getDropDownList(String id,String name, String tableName, String whereCon) {
		// TODO Auto-generated method stub
		String sql = "Select "+id+","+name+","+" from "+tableName+" "+whereCon;
		System.out.println(sql);
		
		return sql;
		
	}

}
