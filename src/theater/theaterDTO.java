package theater;

public class theaterDTO {
	String field;
	String name;
	int rnum;
	int tseat;
	
	public theaterDTO() {
		super();
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getTseat() {
		return tseat;
	}

	public void setTseat(int tseat) {
		this.tseat = tseat;
	}

	@Override
	public String toString() {
		return "theaterDTO [field=" + field + ", name=" + name + ", rnum=" + rnum + ", tseat=" + tseat + "]";
	}

	public theaterDTO(String field, String name, int rnum, int tseat) {
		super();
		this.field = field;
		this.name = name;
		this.rnum = rnum;
		this.tseat = tseat;
	}

	
	
	
}
