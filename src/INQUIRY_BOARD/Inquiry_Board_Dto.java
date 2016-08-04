package INQUIRY_BOARD;

public class Inquiry_Board_Dto {

	private int seq;
	private String id;
	private int ref;
	private int step;
	private int depth;
	private int parent;
	private String title;
	private String content;
	private int read_count;
	private String date;
	private int star_count;
	private int del;

	
	public Inquiry_Board_Dto() {
		// TODO Auto-generated constructor stub
	}
	public Inquiry_Board_Dto(int seq, String id, int ref, int step, int depth, int parent
			, String title, String content, int read_count, String date ,int star_count , int del) {
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.parent = parent;
		this.title = title;
		this.content = content;
		this.read_count = read_count;
		this.date = date;
		this.star_count=star_count;
		this.del = del;
	}
	public Inquiry_Board_Dto(String id, String title, String content) {
		this.id = id;
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
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
	public int getStar_count() {
		return star_count;
	}
	public void setStar_count(int star_count) {
		this.star_count = star_count;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
}
