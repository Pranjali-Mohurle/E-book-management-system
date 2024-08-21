package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.cartDAOImp;
import com.DB.DBConnect;
import com.entity.Book_dtls;
import com.entity.cart;

@WebServlet("/cart")
public class cartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			Book_dtls b=dao.getBookById(bid);
			
			cart c=new cart();
			c.setBid(bid);
			c.setUserid(uid);
			c.setAuthor(b.getAuthor());
			c.setBookName(b.getBookname());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalprice(Double.parseDouble(b.getPrice()));
			
			cartDAOImp dao2=new cartDAOImp(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
	
			
			if(f)
			{
				session.setAttribute("addcart", "Book Added to cart");
				resp.sendRedirect("all_new_book.jsp");
			
			}
			else
			{
				session.setAttribute("failed", "Something went Wrong");
				resp.sendRedirect("all_new_book.jsp");
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	

}
