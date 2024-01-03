package ajaxReply;

public class Reply {
	private int no;
	private String content;
	private int ref;
	private String name;
	private String regdate;
	
	
	public Reply() {}


	public Reply(int no, String content, int ref, String name, String regdate) {
		this.no = no;
		this.content = content;
		this.ref = ref;
		this.name = name;
		this.regdate = regdate;
	}
	
	// ref가 없는 생성자 만듦
	public Reply(int no, String content, String name, String regdate) {
		this.no = no;
		this.content = content;
		this.name = name;
		this.regdate = regdate;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getRef() {
		return ref;
	}


	public void setRef(int ref) {
		this.ref = ref;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "Reply [no=" + no + ", content=" + content + ", ref=" + ref + ", name=" + name + ", regdate=" + regdate
				+ "]";
	}
	
	
	
	
}
