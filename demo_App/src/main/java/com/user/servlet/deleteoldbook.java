package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete_oldbook")
public class deleteoldbook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String em=req.getParameter("em");
			int id=Integer.parseInt(req.getParameter("id"));
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			boolean f=dao.oldbookdelete(em, "old",id);
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("succmsg", "old Book removed");
				resp.sendRedirect("oldbook.jsp");
			}
			else
			{
				session.setAttribute("succmsg", "something went wrong");
				resp.sendRedirect("oldbook.jsp");
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	

}
