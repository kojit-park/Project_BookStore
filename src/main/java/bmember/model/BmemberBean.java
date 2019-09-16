package bmember.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.NotEmpty;

@Alias("MyBmember")
public class BmemberBean {
	
	
	private int num;
	
	@NotEmpty(message="아이디를 입력 해주세요")
	private String id;	 
	
	@Pattern(regexp="[A-Za-z0-9$@$!%*?&]{4,13}", message="비밀번호는 숫자와 영문 특수문자 조합 4~12자")
	private String pw;
	
	@NotEmpty(message="비밀번호 일치 확인 해주세요")
	private String pwc;
	
	@NotEmpty(message="이름 누락")
	private String name;
	
	@NotEmpty(message="생년월일 누락")
	private String birth;
	
	@NotNull(message="핸드폰번호 선택 해주세요")
	private String pn1;
	
	@NotEmpty(message="핸드폰번호 앞자리 입력해주세요")
	private String pn2;
	
	@NotEmpty(message="핸드폰번호 뒷자리 입력해주세요")
	private String pn3;
	
	@NotEmpty(message="이메일 입력해주세요")
	private String email1;
	
	@NotNull(message="이메일 선택 해주세요")
	private String email2;
	
	@NotNull(message="성별 선택 해주세요")
	private String gender;
	
	@NotNull(message="관심장르 선택 해주세요")
	private String genre;
	
	
	public BmemberBean() {
		super();
	}


	public BmemberBean(int num, String id, String pw, String pwc, String name, String birth, String pn1, String pn2,
			String pn3, String email1, String email2, String gender, String genre) {
		super();
		this.num = num;
		this.id = id;
		this.pw = pw;
		this.pwc = pwc;
		this.name = name;
		this.birth = birth;
		this.pn1 = pn1;
		this.pn2 = pn2;
		this.pn3 = pn3;
		this.email1 = email1;
		this.email2 = email2;
		this.gender = gender;
		this.genre = genre;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
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


	public String getPwc() {
		return pwc;
	}


	public void setPwc(String pwc) {
		this.pwc = pwc;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getPn1() {
		return pn1;
	}


	public void setPn1(String pn1) {
		this.pn1 = pn1;
	}


	public String getPn2() {
		return pn2;
	}


	public void setPn2(String pn2) {
		this.pn2 = pn2;
	}


	public String getPn3() {
		return pn3;
	}


	public void setPn3(String pn3) {
		this.pn3 = pn3;
	}


	public String getEmail1() {
		return email1;
	}


	public void setEmail1(String email1) {
		this.email1 = email1;
	}


	public String getEmail2() {
		return email2;
	}


	public void setEmail2(String email2) {
		this.email2 = email2;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}
	
}
