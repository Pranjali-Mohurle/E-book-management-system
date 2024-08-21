package com.DAO;

import java.util.List;

import com.entity.Book_dtls;
import com.entity.cart;

public interface cartDAO 
{
     public boolean addCart(cart c);
     
     public List<cart>getBookbyuser(int userId);
     
     public boolean deletebook(int bid,int uid,int cid);
     
}
