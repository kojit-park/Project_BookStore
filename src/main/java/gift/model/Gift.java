package gift.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Gift {
	private int gnum;
	
	@NotEmpty(message="물건의 이름을 입력하세요.")
	private String gname;
	
	@NotEmpty(message="이미지를 등록해주세요")
	private String gimage;
	
	@NotEmpty(message="선택해주세요~")
	private String gcategory; 
	@Length(min=5, max=15 , message="설명은 최소5자부터 15자까지 입력하세요.")
	private String gcontents; 
	
	private int gpoint;
	
	private String day;
	////
	private MultipartFile upload;
	private String upload2; 
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		System.out.println("upload : " + upload);
		if(upload != null) {
			System.out.println("upload.getName() : " + upload.getName());
			System.out.println("upload.getOriginalFilename() : " + upload.getOriginalFilename());
			this.gimage = upload.getOriginalFilename();
			System.out.println("this.gimage : " + this.gimage);
		}
	}
	public String getUpload2() {
		return upload2;
	}
	public void setUpload2(String upload2) {
		this.upload2 = upload2;
	}
	////////
	
	
	public int getGnum() {
		return gnum;
	}
	public int getGpoint() {
		return gpoint;
	}
	public void setGpoint(int gpoint) {
		this.gpoint = gpoint;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public void setGnum(int gnum) {
		this.gnum = gnum;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGimage() {
		return gimage;
	}
	public void setGimage(String gimage) {
		this.gimage = gimage;
	}
	public String getGcategory() {
		return gcategory;
	}
	public void setGcategory(String gcategory) {
		this.gcategory = gcategory;
	}
	public String getGcontents() {
		return gcontents;
	}
	public void setGcontents(String gcontents) {
		this.gcontents = gcontents;
	}
	
}
