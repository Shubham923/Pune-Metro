package registration;

import java.util.Scanner;

public class UserRegDao {
	
	private int Usrid,usertype;
	private String name ,emailId,passType,password;
	private long mobileNo,dob,validity;
	

	public void setUsrid(int Usrid)
	{
		this.Usrid=Usrid;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}


	public void setPassType(String passType) {
		this.passType = passType;
	}


	public void setMobileNo(long mobileNo) {
		this.mobileNo = mobileNo;
	}

	public int getUserType()
	{
		return usertype;
	}
	public void setDob(long dob) {
		this.dob = dob;
	}

	public void setUsertype(int type)
	{
		this.usertype=type;
	}
	public void setValidity(long validity) {
		this.validity = validity;
	}


	public String getName() {
		return name;
	}
	

	public String getEmailId() {
		return emailId;
	}

	public String getPassType() {
		return passType;
	}



	public long getMobileNo() {
		return mobileNo;
	}

	public long getDob() {
		return dob;
	}

	public long getValidity() {
		return validity;
	}
	public String getPassord() {
		return password;
	}

	public int getUsrid() {
		return Usrid;
	}
	public void getInfo()
	{
		System.out.println("Enter the Name of User");
		
		Scanner sc=new Scanner(System.in);
		
		name=sc.next();
		
		
	System.out.println("Enter the Email-ID of User");
		
		//Scanner sc=new Scanner(System.in);
		
		emailId=sc.next();
		
	System.out.println("Enter the PassType");
		
		//Scanner sc=new Scanner(System.in);
		
		passType=sc.next();
		
		
	System.out.println("Enter the Phone");
		
		//Scanner sc=new Scanner(System.in);
		
		mobileNo=sc.nextLong();
		
System.out.println("Enter the DOB");
		
	//	Scanner sc=new Scanner(System.in);
		
		dob=sc.nextLong();
		
		
System.out.println("Enter the Validity");
		
		//Scanner sc=new Scanner(System.in);
		
		validity=sc.nextLong();
		
System.out.println("Enter the Password");
		
		//Scanner sc=new Scanner(System.in);
		
		password=sc.next();
		
	}
	

}
