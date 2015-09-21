package org.carleton.comp.model;

public class User {
   private int userid;
   private String iname;
   private String fname;
   private String status;
 
private int address;
public int getUserid() {
	return userid;
}
public void setUserid(int userid) {
	this.userid = userid;
}
public String getIname() {
	return iname;
}
public void setIname(String iname) {
	this.iname = iname;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}

public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public int getAddress() {
	return address;
}
public void setAddress(int address) {
	this.address = address;
}
@Override
public String toString(){
	return "User [Userid="+userid+",iname="+iname+",fname"+fname+",status"+status+",address"+address+"]";
}
}
