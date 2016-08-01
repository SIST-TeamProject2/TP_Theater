package coupon;

public class couponDTO {
	int serial;
	int discount_price;
	
	public couponDTO(int serial, int discount_price) {
		super();
		this.serial = serial;
		this.discount_price = discount_price;
	}

	public couponDTO() {
		super();
	}

	public int getSerial() {
		return serial;
	}

	public void setSerial(int serial) {
		this.serial = serial;
	}

	public int getDiscount_price() {
		return discount_price;
	}

	public void setDiscount_price(int discount_price) {
		this.discount_price = discount_price;
	}

	@Override
	public String toString() {
		return "couponDTO [serial=" + serial + ", discount_price=" + discount_price + "]";
	}
	
	
	}
