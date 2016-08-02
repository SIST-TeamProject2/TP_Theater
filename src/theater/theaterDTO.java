package theater;

public class theaterDTO {
	/*
	CREATE TABLE TP2_THEATER(
	T_CODE NUMBER,
	T_FIELD NVARCHAR2(50),
	T_NAME NVARCHAR2(50),
	T_ROOM_NUM NVARCHAR2(50),
	T_TOTAL_SEAT NUMBER
	);
	*/
	
	private int t_code;
	private String t_field;
	private String t_name;
	private String t_room_num;
	private int t_toral_seat;

	public theaterDTO(){
		
	}
	
	public theaterDTO(int t_code, String t_field, String t_name, String t_room_num, int t_toral_seat) {
		super();
		this.t_code = t_code;
		this.t_field = t_field;
		this.t_name = t_name;
		this.t_room_num = t_room_num;
		this.t_toral_seat = t_toral_seat;
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

	public String getT_room_num() {
		return t_room_num;
	}

	public void setT_room_num(String t_room_num) {
		this.t_room_num = t_room_num;
	}

	public int getT_toral_seat() {
		return t_toral_seat;
	}

	public void setT_toral_seat(int t_toral_seat) {
		this.t_toral_seat = t_toral_seat;
	}

	@Override
	public String toString() {
		return "theaterDTO [t_code=" + t_code + ", t_field=" + t_field + ", t_name=" + t_name + ", t_room_num="
				+ t_room_num + ", t_toral_seat=" + t_toral_seat + "]";
	}

}
