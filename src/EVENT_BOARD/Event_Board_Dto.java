package EVENT_BOARD;

public class Event_Board_Dto {
	
	private int seq;
	private String id;
	private int ref;
	private int step;
	private int depth;
	private int parent;
	private String category;
	private String title;
	private String content;
	private String file_name;
	private int like;
	private int read_count;
	private String date;
	private int del;
	
	public Event_Board_Dto() {
		// TODO Auto-generated constructor stub
	}
	public Event_Board_Dto(int seq, String id, int ref, int step, int depth, int parent
			,String category, String title, String content, String file_name, int like,
			int read_count, String date, int del) {
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.parent = parent;
		this.category = category;
		this.title = title;
		this.content = content;
		this.file_name = file_name;
		this.like = like;
		this.read_count = read_count;
		this.date = date;
		this.del = del;
		
	}
	
	public Event_Board_Dto(String id, String category, String title, String content, String file_name) {
		this.id = id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.file_name = file_name;
	}
	
	public  Event_Board_Dto(int seq, String id, int ref, int step, int depth, int parent, 
			String content, String date, int del){
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.parent = parent;
		this.content = content;
		this.date = date;
		this.del = del;
		
	}

	public Event_Board_Dto(String id, String content) {
		this.id = id;
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
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
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
