package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.bookorderDAOImpl;
import com.DAO.cartDAOImp;
import com.DB.DBConnect;
import com.entity.book_order;
import com.entity.cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
	try {
		HttpSession session=req.getSession();
		int id=Integer.parseInt(req.getParameter("id"));
		
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String address=req.getParameter("address");
		String landmark=req.getParameter("landmark");
		String city=req.getParameter("city");
		String state=req.getParameter("state");
		String pincode=req.getParameter("pincode");
		String payment=req.getParameter("payment");
		String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
		
		
		cartDAOImp dao=new cartDAOImp(DBConnect.getConn());
		List<cart> blist=dao.getBookbyuser(id);
		if(blist.isEmpty())
		{
			session.setAttribute("failedmsg", "Add Item");
			resp.sendRedirect("cart.jsp");
			
		}
		else
		{
			bookorderDAOImpl dao2=new bookorderDAOImpl(DBConnect.getConn());
			
			
			book_order o=null;
			ArrayList<book_order> orderlist=new ArrayList<book_order>();
			Random r=new Random();
			for(cart c:blist)
			{
				o=new book_order();
			o.setOrderid("BOOK-ORD-OO"+r.nextInt(1000));
			o.setName(name);
			o.setEmail(email);
			o.setPhone(phone);
			o.setFullAdd(fullAdd);
			o.setBookname(c.getBookName());
			o.setAuthor(c.getAuthor());
			o.setPrice(c.getPrice()+" ");
			o.setPayment(payment);
			orderlist.add(o);
			
			}
			
			
			
			if("noselect".equals(payment))
			{
				session.setAttribute("failedmsg", "choose payment method");
				resp.sendRedirect("cart.jsp");
			}
			else {
			boolean	f=dao2.saveorder(orderlist);
			if(f)
			{
				resp.sendRedirect("order_success.jsp");
				
			}
			else {
				session.setAttribute("failedmsg", "choose payment method");
				resp.sendRedirect("cart.jsp");
			}
			}
		}
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	}
}
