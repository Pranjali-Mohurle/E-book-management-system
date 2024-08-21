package com.DAO;

import java.util.List;

import com.entity.book_order;

public interface bookorderDAO {
	
	
	
	public boolean saveorder(List<book_order> blist);
	
	public List<book_order> getbook(String email);
	
	public List<book_order> getallorder();
	

}
