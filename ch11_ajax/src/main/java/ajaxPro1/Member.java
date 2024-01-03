package ajaxPro1;

import java.util.Arrays;

public class Member {
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String birthday;
	private String email;
	private String zipcode;
	private String address;
	private String detailAddress;
	private String[] hobby; // 중복선택 가능이라 배열로
	private String job;
	
	// 비어있는 생성자 - constructors from superclass
	public Member() {} 

	// 필드 생성자 - constructor using field
	public Member(String id, String pwd, String name, String gender, String birthday, String email, String zipcode,
			String address, String detailAddress, String[] hobby, String job) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
		this.zipcode = zipcode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.hobby = hobby;
		this.job = job;
	}
	
	// getter/setter 생성
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	
	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", gender=" + gender + ", email=" + email + "]";
	}

	
	
}
