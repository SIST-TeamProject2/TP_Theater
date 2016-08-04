package NOTICE_BOARD;

public class Notice_Board_Dto {
	
	private int seq;
	private String id;
	private String category;
	private String title;
	private String content;
	private int read_count;
	private String date;
	private int del;
	
	public Notice_Board_Dto() {
		// TODO Auto-generated constructor stub
	}
	public Notice_Board_Dto(int seq, String id,String category, String title, 
			String content, int read_count, String date, int del) {
		this.seq = seq;
		this.id = id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.read_count = read_count;
		this.date = date;
		this.del = del;
	}
	public Notice_Board_Dto(String id, String category, String title, String content) {
		this.id = id;
		this.category = category;
		this.title = title;
		this.content = content;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
	
}

