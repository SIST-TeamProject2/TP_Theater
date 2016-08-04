package theater2;

public class roomDTO {

	
	int room_num;

	String start_time;
	String movie_name;
	String sdate;
	String edate;
	
	
	public roomDTO() {
		super();
	}
	public roomDTO(int room_num, String start_time, String movie_name, String sdate, String edate) {
		super();
		this.room_num = room_num;
		this.start_time = start_time;
		this.movie_name = movie_name;
		this.sdate = sdate;
		this.edate = edate;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	@Override
	public String toString() {
		return "roomDTO [room_num=" + room_num + ", start_time=" + start_time + ", movie_name=" + movie_name
				+ ", sdate=" + sdate + ", edate=" + edate + "]";
	}
	
	
	
}
