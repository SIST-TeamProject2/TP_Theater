package theater;

public class nowDTO {

	String name;
	String room;
	String date;
	@Override
	public String toString() {
		return "nowDTO [name=" + name + ", room=" + room + ", date=" + date + "]";
	}
	public nowDTO(String name, String room, String date) {
		super();
		this.name = name;
		this.room = room;
		this.date = date;
	}
	public nowDTO() {
		super();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	

	
	
	
}
