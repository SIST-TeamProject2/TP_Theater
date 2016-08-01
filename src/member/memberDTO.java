package member;

import java.util.Date;

public class memberDTO {

	private int seq;
	private String id;
	private String pw;
	private String name;
	private String facename;
	private String birthday;
	private String email;
	private String phone;
	private int point;
	private int grade;
	private int viewcount;
	private Date joindate;
	
	public memberDTO() {}
	
	public memberDTO(int seq, String id, String pw, String name, String facename, String birthday,
					String email, String phone, int point, int grade, int viewcount, Date joindate) {
		
		super();
		this.seq = seq;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.facename = facename;
		this.birthday = birthday;
		this.email = email;
		this.phone = phone;
		this.point = point;
		this.grade = grade;
		this.viewcount = viewcount;
		this.joindate = joindate;
		
	}


	@Override
	public String toString() {
		return "memberDTO [seq=" + seq + ", id=" + id + ", pw=" + pw + ", name=" + name + ", facename=" + facename
				+ ", birthday=" + birthday + ", email=" + email + ", phone=" + phone + ", point=" + point + ", grade="
				+ grade + ", viewcount=" + viewcount + ", joindate=" + joindate + "]";
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFacename() {
		return facename;
	}

	public void setFacename(String facename) {
		this.facename = facename;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
}