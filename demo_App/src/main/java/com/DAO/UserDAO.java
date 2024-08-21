package com.DAO;
import com.entity.User;
public interface UserDAO {
	public boolean userRegister(User us);
	
	public User login(String email,String password);
	
	public boolean checkpassword(String ps,int id);
	
	public boolean updateprofile(User us);
	
	public boolean checkuser(String em);

}
