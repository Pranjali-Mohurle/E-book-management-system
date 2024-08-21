package com.DAO;

import com.entity.Book_dtls;
import java.util.List;

public interface BookDAO {
     
	public boolean addBooks(Book_dtls b);
	
	public List<Book_dtls> getAllBooks();
	
	public Book_dtls getBookById(int id);
	
	public boolean updateeditbooks(Book_dtls b);
	
	public boolean deletebooks(int id);
	
	public List<Book_dtls> getNewBook();
	
	public List<Book_dtls> getRecentBooks();
	
	public List<Book_dtls> getOldBooks();
	
	public  List<Book_dtls> getAllrecentBook();
	
	public  List<Book_dtls> getAllnewBook();
	
	public  List<Book_dtls> getAlloldBook();
	
	public List<Book_dtls> getbookbyold(String email,String category);
	
	public boolean oldbookdelete(String email,String category,int id);
	 
	public List<Book_dtls> getbooksearch(String ch);
}
