package dto;

import java.io.Serializable;
import java.sql.Date;

public class UserDto implements Serializable {
	private String id;
	private String pwd;
	private String name;
	private int age;
	private String birthday;
	private String address;
	private int height;

	public UserDto(String id, String pwd, String name, int age, String date, String address, int height) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.age = age;
		this.birthday = date;
		this.address = address;
		this.height = height;
	}

	@Override
	public String toString() {
		return "UserDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", age=" + age + ", birthday=" + birthday
				+ ", address=" + address + ", height=" + height + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public UserDto() {
		// TODO Auto-generated constructor stub
	}

}
