package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_dtls;

@WebServlet("/addoldbook")
@MultipartConfig
public class addoldbook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try
		{
		 
			String bookname=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String categories="old";
			String status="Active";
			Part part=req.getPart("bimg");
			String filename=part.getSubmittedFileName();
			
			String useremail=req.getParameter("user");
			
			Book_dtls b=new Book_dtls(bookname,author,price,categories,status,filename,useremail);
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			
		     
			boolean f=dao.addBooks(b);
			HttpSession session=req.getSession();
			
			if(f)
			{
				String path=getServletContext().getRealPath("")+"book";
			     File file=new File(path);
			     
			     part.write(path + File.separator + filename);
				
				
				session.setAttribute("succmsg", "Book add successfully");
				resp.sendRedirect("sell.jsp");
			}
			else
			{
				session.setAttribute("failedmsg", "Something went wrong");
				resp.sendRedirect("sell.jsp");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

