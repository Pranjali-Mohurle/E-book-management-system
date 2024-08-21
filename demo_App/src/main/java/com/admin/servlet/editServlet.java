package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_dtls;

@WebServlet("/editbooks")
public class editServlet extends HttpServlet{

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try
		{
		int id=Integer.parseInt(req.getParameter("id"));
		String bookname=req.getParameter("bname");
		String author=req.getParameter("author");
		String price=req.getParameter("price");
		String status=req.getParameter("status");
		
		Book_dtls b=new Book_dtls();
		b.setBookId(id);
		b.setBookname(bookname);
		b.setAuthor(author);
		b.setPrice(price);
		b.setStatus(status);
		
		BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
		boolean f=dao.updateeditbooks(b);
		HttpSession session=req.getSession();
		if(f)
		{
			session.setAttribute("succmsg", "Book Update Successfully..");
			resp.sendRedirect("admin/all_books.jsp");
		}
		else
		{
			session.setAttribute("failedmsg", "Something went Wrong");
			resp.sendRedirect("admin/all_books.jsp");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	

}
