package com.victory;

public class victory {
	private int vlid;
	private String cname;
	private String program;
	private String city;
	private String location;
	private String date;
	private double budget;

	
	public victory(int vlid,String cname, String program, String city, String location, String date,
			double budget) {
		
		this.vlid = vlid;
		this.cname = cname;
		this.program = program;
		this.city = city;
		this.location = location;
		this.date = date;
		this.budget = budget;
		
	}

	public int getVlid() {
		return vlid;
	}

	
	public String getCname() {
		return cname;
	}

	
	public String getStype() {
		return program;
	}

	
	public String getDivision() {
		return city;
	}

	
	public String getLocation() {
		return location;
	}

	
	public String getDate() {
		return date;
	}

	
	public double getCost() {
		return budget;
	}



	
}
