/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin.DAO;

import Admin.Model.BookDTO;
import java.util.List;

/**
 *
 * @author satori
 */
public interface BookDAO {
    public List<BookDTO> getBookByCategory(int categoryID);
    public void updateBook(int bookId, float price, String title, int year, int quantity, String description);
    public void insertBookToCategory(BookDTO book);
    public void deleteBook(int bookId);
    public BookDTO getBookByID(int bookId);
    public List<BookDTO> searchBook(String keyword);
}
