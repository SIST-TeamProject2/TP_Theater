package BOARD_COMMENT;

public class Board_Comment_Dto {

	private int seq;
	private String id;
	private int ref;
	private int step;
	private int depth;
	private int parent;
	private String content;
	private String date;
	private int del;
	private int eb_seq;
	
	public Board_Comment_Dto() {
		
	}
	public Board_Comment_Dto(int seq, String id, int ref, int step, int depth, int parent
			, String content,String date, int del, int eb_seq) {
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.parent = parent;
		this.content = content;
		this.date = date;
		this.del = del;
		this.eb_seq=eb_seq;
	}
	public Board_Comment_Dto(String id, String content) {
		this.id = id;
		this.content = content;
	}
	
	public int getEb_seq() {
		return eb_seq;
	}
	public void setEb_seq(int eb_seq) {
		this.eb_seq = eb_seq;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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

