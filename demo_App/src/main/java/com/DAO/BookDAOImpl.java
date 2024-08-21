package com.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_dtls;

public class BookDAOImpl implements BookDAO{
       private Connection conn;
       
	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	
	public boolean addBooks(Book_dtls b) {
		boolean f=false;
		try
		{
		  String sql="insert into book_details(bookname,author,price,Bookcategory,status,photo,useremail) values(?,?,?,?,?,?,?)";
		  PreparedStatement ps=conn.prepareStatement(sql);
		  ps.setString(1, b.getBookname());
		  ps.setString(2, b.getAuthor());
		  ps.setString(3, b.getPrice());
		  ps.setString(4, b.getBookcategory());
		  ps.setString(5, b.getStatus());
		  ps.setString(6, b.getPhotoname());
		  ps.setString(7, b.getUseremail());
		  
		  int i=ps.executeUpdate();
		  if(i==1)
		  {
			  f=true;
		  }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}


	
	public List<Book_dtls> getAllBooks() {

		List<Book_dtls> list=new ArrayList<Book_dtls>();
		Book_dtls b=null;
		try
		{
			String sql="select * from book_details";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new Book_dtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));
				
				list.add(b);
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		 
		return list;
	}



	public Book_dtls getBookById(int id) {
		Book_dtls b=null;
		try
		{
			String sql="select * from book_details where bookId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new Book_dtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return b;
	}


	
	public boolean updateeditbooks(Book_dtls b) {
		boolean f=false;
		
		try
		{
			String sql="update book_details set bookname=?, author=?, price=?,status=? where bookId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}


	
	public boolean deletebooks(int id) {
		boolean f=false;
		try
		{
			String sql="delete from book_details where bookId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			}catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}


	
	public List<Book_dtls> getNewBook() {
		List<Book_dtls> list=new ArrayList<Book_dtls>();
		Book_dtls b=null;
		try {
			String sql="select * from book_details  where Bookcategory=? and status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "new");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new Book_dtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	
	public List<Book_dtls> getRecentBooks() {
		List<Book_dtls> list=new ArrayList<Book_dtls>();
		Book_dtls b=null;
		try {
			String sql="select * from book_details  where status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new Book_dtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<Book_dtls> getOldBooks() {
		List<Book_dtls> list=new ArrayList<Book_dtls>();
		Book_dtls b=null;
		try {
			String sql="select * from book_details  where Bookcategory=? and status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new Book_dtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<Book_dtls> getAllrecentBook() {
		List<Book_dtls> list=new ArrayList<Book_dtls>();
		Book_dtls b=null;
		try {
			String sql="select * from book_details  where status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				b=new Book_dtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Book_dtls> getAllnewBook() {
		List<Book_dtls> list=new ArrayList<Book_dtls>();
		Book_dtls b=null;
		try {
			String sql="select * from book_details  where Bookcategory=? and status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "new");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				b=new Book_dtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<Book_dtls> getAlloldBook() {
		List<Book_dtls> list=new ArrayList<Book_dtls>();
		Book_dtls b=null;
		try {
			String sql="select * from book_details  where Bookcategory=? and status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next() ) {
				b=new Book_dtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<Book_dtls> getbookbyold(String email, String category) {
		
		List<Book_dtls> list=new ArrayList<Book_dtls>();
		Book_dtls b=null;
		
		try {
			
			String sql="select * from book_details where Bookcategory=? and useremail=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, email);
			ResultSet rs=ps.executeQuery();	
			
			while(rs.next())
			{
				b=new Book_dtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public boolean oldbookdelete(String email, String category,int id) {
		boolean f=false;
		
		try {
			String sql="delete from book_details where Bookcategory=? and useremail=? and bookId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, email);
			ps.setInt(3, id);
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<Book_dtls> getbooksearch(String ch) {
		List<Book_dtls> list=new ArrayList<Book_dtls>();
		Book_dtls b=null;
		
		try {
			
			String sql="select * from book_details where bookname like ? or author like ? or Bookcategory like ? and status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			ResultSet rs=ps.executeQuery();	
			
			while(rs.next())
			{
				b=new Book_dtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	
	

}
