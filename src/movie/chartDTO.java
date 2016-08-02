package movie;

public class chartDTO {

	private String age;
	
	public chartDTO(){
	}
	public chartDTO(String age) {
		super();
		this.age = age;
	}

	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "chartDTO [age=" + age + "]";
	}
	
}
