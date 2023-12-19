package ch04;

public class MemberBean {
	// 사용자에게서 받은 걸 다 Bean으로 만들어야함
	// Bean파일에는 최소 2글자 이상. 필드이름은 되도록 소문자로 사용하고 이어지는 경우 언더바 사용
	// 데이터베이스와 연결되기 때문에 문제가 발생할 수 있음 - 추후에 추가 설명
	private String id;
	private String pw;
	private String repw;
	private String name;
	private String birthday;
	
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
	public String getRepw() {
		return repw;
	}
	public void setRepw(String repw) {
		this.repw = repw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	private String email;
}
