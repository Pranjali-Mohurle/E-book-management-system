package com.entity;

public class Book_dtls {
         
	private int bookId;
	private String bookname;
	private String author;
	private String price;
	private String bookcategory;
	private String status;
	private String photoname;
	private String useremail;
	
	
	public Book_dtls() {
		super();
		
	}
	
	
	

	public Book_dtls(String bookname, String author, String price, String bookcategory, String status, String photoname,
			String useremail) {
		super();
		this.bookname = bookname;
		this.author = author;
		this.price = price;
		this.bookcategory = bookcategory;
		this.status = status;
		this.photoname = photoname;
		this.useremail = useremail;
	}
	

	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBookcategory() {
		return bookcategory;
	}
	public void setBookcategory(String bookcategory) {
		this.bookcategory = bookcategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoname() {
		return photoname;
	}
	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}





	public String toString() {
		return "Book_dtls [bookId=" + bookId + ", bookname=" + bookname + ", author=" + author + ", price=" + price
				+ ", bookcategory=" + bookcategory + ", status=" + status + ", photoname=" + photoname + ", useremail="
				+ useremail + "]";
	}
	
	
	
}
