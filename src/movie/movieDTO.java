package movie;

public class movieDTO {
/*	drop table TP2_MOVIE

	CREATE TABLE TP2_MOVIE(
	   MV_SEQ            NUMBER,
	   MV_NAME            NVARCHAR2(50),
	   MV_VIEW_COUNT      NUMBER,
	   MV_GENRE         NVARCHAR2(50),
	   MV_FORMAT         NVARCHAR2(20),
	   MV_GRADE         NVARCHAR2(20),
	   MV_DIRETOR         NVARCHAR2(40),
	   MV_ACTOR         NVARCHAR2(100),
	   MV_RUNNING_TIME     NVARCHAR2(100),
	   MV_START_DATE    NVARCHAR2(100),
	   MV_POSTER         NVARCHAR2(800),
	   MV_VIDEO         NVARCHAR2(800),
	   MV_HEART         NUMBER,
	   MV_STORY			 NVARCHAR2(800)
	);

	select * from TP2_MOVIE*/
	
	private int seq;
	private String name;
	private int view_count;
	private String genre;
	private String format;
	private String grade;
	private String diretor;
	private String actor;
	private String running_time;
	private String start_time;
	private String poster;
	private String video;
	private int heart;
	private String story;
	
	public movieDTO(){
		
	}

	public movieDTO(int seq, String name, int view_count, String genre, String format, String grade, String diretor,
			String actor, String running_time, String start_time, String poster, String video, int heart,String story) {
		super();
		this.seq = seq;
		this.name = name;
		this.view_count = view_count;
		this.genre = genre;
		this.format = format;
		this.grade = grade;
		this.diretor = diretor;
		this.actor = actor;
		this.running_time = running_time;
		this.start_time = start_time;
		this.poster = poster;
		this.video = video;
		this.heart = heart;
		this.story = story;
	}


	@Override
	public String toString() {
		return "movieDTO [seq=" + seq + ", name=" + name + ", view_count=" + view_count + ", genre=" + genre
				+ ", format=" + format + ", grade=" + grade + ", diretor=" + diretor + ", actor=" + actor
				+ ", running_time=" + running_time + ", start_time=" + start_time + ", poster=" + poster + ", video="
				+ video + ", heart=" + heart + ", story=" + story + "]";
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getDiretor() {
		return diretor;
	}

	public void setDiretor(String diretor) {
		this.diretor = diretor;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getRunning_time() {
		return running_time;
	}

	public void setRunning_time(String running_time) {
		this.running_time = running_time;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}
	

}
