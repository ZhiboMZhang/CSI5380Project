package org.carleton.comp.model;
public class Data {
	
		private String cdid;
		private String title;
		private int price;
		private String category;	
		
		//Auto Generating Getters/Setters	
		public String getCdid() {
			return cdid;
		}
		public void setCdid(String cdid) {
			this.cdid = cdid;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
		}
	//for output usage	
		@Override
		public String toString(){
			return "Data [cdid="+cdid+",title="+title+",price"+price+",category"+category+"]";
		}
}
