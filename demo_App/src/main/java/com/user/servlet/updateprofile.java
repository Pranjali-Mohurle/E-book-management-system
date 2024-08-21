package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
@WebServlet("/updateprofile")
public class updateprofile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String password=req.getParameter("password");
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			HttpSession session=req.getSession();
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			boolean f=dao.checkpassword(password, id);
			
			if(f)
			{
				
				boolean f2=dao.updateprofile(us);
				if(f2)
				{
					session.setAttribute("succmsg", "User profile successfully..");
					resp.sendRedirect("editprofile.jsp");
				}
				else
				{
					session.setAttribute("failedmsg", "Something went wrong..");
					resp.sendRedirect("editprofile.jsp");
					
				}
			}
			else
			{
				session.setAttribute("failedmsg", "Your password is incorrect..");
				resp.sendRedirect("editprofile.jsp");
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	

}
