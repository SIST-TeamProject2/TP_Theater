package theater;

public class theaterscheduleDTO {
	/*
	 CREATE TABLE TP2_THEATER_ROOM(
	TR_CODE NUMBER,
	TR_TIME NVARCHAR2(100),
	TR_MOVIE_NAME NVARCHAR2(100),
	TR_START_DATE NVARCHAR2(100),
	TR_END_DATE NVARCHAR2(100),
	TR_OUT_SEAT NUMBER
	);

	CREATE TABLE TP2_THEATER(
	T_CODE NUMBER,
	T_FIELD NVARCHAR2(50),
	T_NAME NVARCHAR2(50),
	T_ROOM_NUM NVARCHAR2(50),
	T_TOTAL_SEAT NUMBER
	);
	 
	SELECT T_CODE, T_FIELD, T_NAME, T_ROOM_NUM, T_TOTAL_SEAT, TR_TIME, TR_MOVIE_NAME, TR_START_DATE, TR_END_DATE, TR_OUT_SEAT
	FROM TP2_THEATER
	INNER JOIN TP2_THEATER_ROOM
	ON T_CODE=TR_CODE 
	 */

	private int t_code;
	private String t_field;
	private String t_name;
	private int t_room_num;
	private int t_total_seat;
	private String tr_time;
	private String tr_movie_name;
	private String tr_start_date;
	private String tr_end_date;
	private int tr_out_seat;
	
	public theaterscheduleDTO(){
		
	}

	public theaterscheduleDTO(int t_code, String t_field, String t_name, int t_room_num, int t_total_seat,
			String tr_time, String tr_movie_name, String tr_start_date, String tr_end_date, int tr_out_seat) {
		super();
		this.t_code = t_code;
		this.t_field = t_field;
		this.t_name = t_name;
		this.t_room_num = t_room_num;
		this.t_total_seat = t_total_seat;
		this.tr_time = tr_time;
		this.tr_movie_name = tr_movie_name;
		this.tr_start_date = tr_start_date;
		this.tr_end_date = tr_end_date;
		this.tr_out_seat = tr_out_seat;
	}

	@Override
	public String toString() {
		return "theaterscheduleDTO [t_code=" + t_code + ", t_field=" + t_field + ", t_name=" + t_name + ", t_room_num="
				+ t_room_num + ", t_total_seat=" + t_total_seat + ", tr_time=" + tr_time + ", tr_movie_name="
				+ tr_movie_name + ", tr_start_date=" + tr_start_date + ", tr_end_date=" + tr_end_date + ", tr_out_seat="
				+ tr_out_seat + "]";
	}

	public int getT_code() {
		return t_code;
	}

	public void setT_code(int t_code) {
		this.t_code = t_code;
	}

	public String getT_field() {
		return t_field;
	}

	public void setT_field(String t_field) {
		this.t_field = t_field;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public int getT_room_num() {
		return t_room_num;
	}

	public void setT_room_num(int t_room_num) {
		this.t_room_num = t_room_num;
	}

	public int getT_total_seat() {
		return t_total_seat;
	}

	public void setT_total_seat(int t_total_seat) {
		this.t_total_seat = t_total_seat;
	}

	public String getTr_time() {
		return tr_time;
	}

	public void setTr_time(String tr_time) {
		this.tr_time = tr_time;
	}

	public String getTr_movie_name() {
		return tr_movie_name;
	}

	public void setTr_movie_name(String tr_movie_name) {
		this.tr_movie_name = tr_movie_name;
	}

	public String getTr_start_date() {
		return tr_start_date;
	}

	public void setTr_start_date(String tr_start_date) {
		this.tr_start_date = tr_start_date;
	}

	public String getTr_end_date() {
		return tr_end_date;
	}

	public void setTr_end_date(String tr_end_date) {
		this.tr_end_date = tr_end_date;
	}

	public int getTr_out_seat() {
		return tr_out_seat;
	}

	public void setTr_out_seat(int tr_out_seat) {
		this.tr_out_seat = tr_out_seat;
	}
	
}
