/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.AuthorDTO;
import Model.BookDTO;
import Model.CategoryDTO;
import Model.PublisherDTO;
import Model.ShoppingCartDTO;
import java.util.List;

/**
 *
 * @author Admins
 */
public interface BookDAO {

    public List<BookDTO> getAllBook();
    
    public int countTotalBookByCategoryID(int id);
    
    public int countTotalBookByPublisherID(int id);
    
    public int countTotalBookByPrice(double price);
    
    public BookDTO getBookByID(int id);

    public CategoryDTO getCategoryByBookID(int id);
    
    public PublisherDTO getPublisherByBookID(int id);

    public AuthorDTO getAuthorByBookID(int id);
    
    public boolean updateQuantityByBookID(int id, int quantity);

    public List<CategoryDTO> getAllCategory();

    public List<PublisherDTO> getAllPublisher();

    public List<BookDTO> getBookListByCategoryID(int id);
    
    public List<BookDTO> getBookListByPublisherID(int id);

    public List<BookDTO> getBookListByTitle(String title);
    
    public List<BookDTO> getRelatedBook(int bookID, int categoryID);

    public double getRatingByBookID(int id);

    public void updateRatingByBookID(double rating, int id);

    public List<BookDTO> pagingBookList(int page);
    
    public List<BookDTO> pagingBookListByCategoryID(int page, int id);
    
    public List<BookDTO> pagingBookListByPublisherID(int page, int id);
    
    public List<BookDTO> pagingBookListByPrice(int page, double price);
    
    public List<ShoppingCartDTO> getCartBook(List<ShoppingCartDTO> cartList);
    
    public double getTotalCartPrice(List<ShoppingCartDTO> cartList);
    
    public List<BookDTO> getBestSeller(String categoryName);
    
    public List<BookDTO> getNewBook(String categoryName);
    
    public List<BookDTO> getBookListByPrice(double price);

}
