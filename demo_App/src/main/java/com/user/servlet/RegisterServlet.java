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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try
		{ 
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			//System.out.println(name+" "+email+" "+phone+" "+password+" "+check+" ");
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);
			
			HttpSession session=req.getSession();
			
			if(check!=null)
			{
				UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
				boolean f2=dao.checkuser(email);
				if(f2)
				{
					boolean f=dao.userRegister(us);
					if(f)
					{
						//System.out.println("User Register Success..");
						session.setAttribute("succmsg", "Registration Successfully..");
						resp.sendRedirect("register.jsp");
					}
					
					else
					{
						//System.out.println("Something went Wrong..");
						session.setAttribute("failedmsg", "Something wrong on server..");
						resp.sendRedirect("register.jsp");
					}
				}
				else
				{
					session.setAttribute("failedmsg", "Already Exist..");
					resp.sendRedirect("register.jsp");
				}
				
			}else
			{
				//System.out.println("please check Agree & Term condition");
				session.setAttribute("failedmsg", "Please check agree and terms condition");
				resp.sendRedirect("register.jsp");
			}
		   	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
