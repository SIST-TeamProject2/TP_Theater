package movie;

import javax.print.DocFlavor.STRING;

public class moviereviewDTO {
/*	DROP TABLE TP2_MOVIE_REVIEW

	CREATE TABLE TP2_MOVIE_REVIEW(
	MVR_SEQ NUMBER,
	MVR_ID NVARCHAR2(50),
	MVR_MOVIE_SEQ NUMBER,
	MVR_CONTENT NVARCHAR2(100),
	MVR_LIKE_SCORE NUMBER,
	MVR_LIKE_COUNT NUMBER,
	MVR_DATE DATE
	
	);


	CREATE SEQUENCE REVIEW_SEQUENCE START WITH 1 INCREMENT BY 1

	SELECT MVR_SEQ,MVR_ID,MVR_MOVIE_SEQ,MVR_CONTENT,MVR_LIKE_SCORE,MVR_LIKE_COUNT FROM TP2_MOVIE_REVIEW WHERE MVR_ID=1 AND MVR_MOVIE_SEQ=1;

*/
	
	
	private int mvr_seq;
	private String mvr_id;
	private int mvr_movie_seq;
	private String  mvr_content;
	private int mvr_like_score;
	private int mvr_like_count;
	private String mvr_date;
	public moviereviewDTO(){
		
	}

	public moviereviewDTO(int mvr_seq, String mvr_id, int mvr_movie_seq, String mvr_content, int mvr_like_score,
			int mvr_like_count, String mvr_date) {
		super();
		this.mvr_seq = mvr_seq;
		this.mvr_id = mvr_id;
		this.mvr_movie_seq = mvr_movie_seq;
		this.mvr_content = mvr_content;
		this.mvr_like_score = mvr_like_score;
		this.mvr_like_count = mvr_like_count;
		this.mvr_date = mvr_date;
	}

	
	@Override
	public String toString() {
		return "moviereviewDTO [mvr_seq=" + mvr_seq + ", mvr_id=" + mvr_id + ", mvr_movie_seq=" + mvr_movie_seq
				+ ", mvr_content=" + mvr_content + ", mvr_like_score=" + mvr_like_score + ", mvr_like_count="
				+ mvr_like_count + ", mvr_date=" + mvr_date + "]";
	}

	public String getMvr_date() {
		return mvr_date;
	}

	public void setMvr_date(String mvr_date) {
		this.mvr_date = mvr_date;
	}


	public int getMvr_seq() {
		return mvr_seq;
	}

	public void setMvr_seq(int mvr_seq) {
		this.mvr_seq = mvr_seq;
	}

	public String getMvr_id() {
		return mvr_id;
	}

	public void setMvr_id(String mvr_id) {
		this.mvr_id = mvr_id;
	}

	public int getMvr_movie_seq() {
		return mvr_movie_seq;
	}

	public void setMvr_movie_seq(int mvr_movie_seq) {
		this.mvr_movie_seq = mvr_movie_seq;
	}

	public String getMvr_content() {
		return mvr_content;
	}

	public void setMvr_content(String mvr_content) {
		this.mvr_content = mvr_content;
	}

	public int getMvr_like_score() {
		return mvr_like_score;
	}

	public void setMvr_like_score(int mvr_like_score) {
		this.mvr_like_score = mvr_like_score;
	}

	public int getMvr_like_count() {
		return mvr_like_count;
	}

	public void setMvr_like_count(int mvr_like_count) {
		this.mvr_like_count = mvr_like_count;
	}
	
	
	
	
}
