package movie;

import java.util.Date;

public class TicketDTO {

	private int seq;
	private String id;
	private int pay;
	private int paytype;
	private Date payDate;
	private String seeDate;
	private String movieName;
	private String theaterName;
	private int theaterRoomNum;
	private String theaterRoomTime;
	private String seatNum;
	private int peopleCount;
	
	public TicketDTO(int seq, String id, int pay, int paytype, Date payDate, String seeDate, String movieName,
			String theaterName, int theaterRoomNum, String theaterRoomTime, String seatNum, int peopleCount) {
		
		super();
		this.seq = seq;
		this.id = id;
		this.pay = pay;
		this.paytype = paytype;
		this.payDate = payDate;
		this.seeDate = seeDate;
		this.movieName = movieName;
		this.theaterName = theaterName;
		this.theaterRoomNum = theaterRoomNum;
		this.theaterRoomTime = theaterRoomTime;
		this.seatNum = seatNum;
		this.peopleCount = peopleCount;
		
	}

	@Override
	public String toString() {
		return "TicketDTO [seq=" + seq + ", id=" + id + ", pay=" + pay + ", paytype=" + paytype + ", payDate=" + payDate
				+ ", seeDate=" + seeDate + ", movieName=" + movieName + ", theaterName=" + theaterName
				+ ", theaterRoomNum=" + theaterRoomNum + ", theaterRoomTime=" + theaterRoomTime + ", seatNum=" + seatNum
				+ ", peopleCount=" + peopleCount + "]";
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

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getPaytype() {
		return paytype;
	}

	public void setPaytype(int paytype) {
		this.paytype = paytype;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getSeeDate() {
		return seeDate;
	}

	public void setSeeDate(String seeDate) {
		this.seeDate = seeDate;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	public int getTheaterRoomNum() {
		return theaterRoomNum;
	}

	public void setTheaterRoomNum(int theaterRoomNum) {
		this.theaterRoomNum = theaterRoomNum;
	}

	public String getTheaterRoomTime() {
		return theaterRoomTime;
	}

	public void setTheaterRoomTime(String theaterRoomTime) {
		this.theaterRoomTime = theaterRoomTime;
	}

	public String getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}

	public int getPeopleCount() {
		return peopleCount;
	}

	public void setPeopleCount(int peopleCount) {
		this.peopleCount = peopleCount;
	}
}
