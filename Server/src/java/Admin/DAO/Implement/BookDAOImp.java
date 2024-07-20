/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin.DAO.Implement;

import Admin.DAO.BookDAO;
import Admin.Model.BookDTO;
import DBUtils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author satori
 */
public class BookDAOImp implements BookDAO {

    private BookDTO getResultSet(ResultSet rs) throws SQLException {
        BookDTO book = new BookDTO();

        int bookID = rs.getInt("Book_ID");
        float price = rs.getFloat("Price");
        String title = rs.getString("Title");
        int categoryID = rs.getInt("Category_ID");
        int authorID = rs.getInt("Author_ID");
        int publisherID = rs.getInt("Publisher_ID");
        int yearPublic = rs.getInt("Year_of_Publication");
        int quantity = rs.getInt("Quantity");
        String description = rs.getString("Description");
        float rate = rs.getFloat("Rate");
        int rateCount = rs.getInt("Rate_Count");
        int sold = rs.getInt("Sold");
        String image = rs.getString("Image");

        book.setBookID(bookID);
        book.setBookPrice(price);
        book.setBookTitle(title);
        book.setCategoryID(categoryID);
        book.setAuthorID(authorID);
        book.setPublisherID(publisherID);
        book.setYearPublic(yearPublic);
        book.setQuantity(quantity);
        book.setDescription(description);
        book.setRate(rate);
        book.setRateCount(rateCount);
        book.setSold(sold);
        book.setImage(image);

        return book;
    }

    @Override
    public List<BookDTO> getBookByCategory(int categoryID) {
        List<BookDTO> bookList = new ArrayList<>();
        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM [Book] "
                    + "WHERE Category_ID = ?";
            PreparedStatement prStm = con.prepareStatement(sql);
            prStm.setInt(1, categoryID);
            ResultSet rs = prStm.executeQuery();
            while (rs.next()) {
                BookDTO book = getResultSet(rs);
                bookList.add(book);
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Query error occrue. Detail: " + ex.getMessage());
            ex.printStackTrace();
        }
        return bookList;
    }

    @Override
    public void updateBook(int bookId, float price, String title, int year, int quantity, String description) {
        try (Connection con = DBUtils.getConnection()) {
            String sql = "UPDATE [Book] "
                    + " SET Price = ?, Title = ?, Year_of_Publication = ?, Quantity = ?, Description = ?"
                    + " WHERE Book_ID = ?";
            PreparedStatement prStm = con.prepareStatement(sql);
            prStm.setFloat(1, price);
            prStm.setString(2, title);
            prStm.setInt(3, year);
            prStm.setInt(4, quantity);
            prStm.setString(5, description);
            prStm.setInt(6, bookId);
            prStm.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.out.println("Query error occrue. Detail: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    @Override
    public void insertBookToCategory(BookDTO book) {
        try (Connection con = DBUtils.getConnection()) {
            String sql = "INSERT INTO [Book] (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold,Image) "
                    + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement prStm = con.prepareStatement(sql);
            prStm.setFloat(1, book.getBookPrice());
            prStm.setString(2, book.getBookTitle());
            prStm.setInt(3, book.getCategoryID());
            prStm.setInt(4, book.getAuthorID());
            prStm.setInt(5, book.getPublisherID());
            prStm.setInt(6, book.getYearPublic());
            prStm.setInt(7, book.getQuantity());
            prStm.setString(8, book.getDescription());
            prStm.setFloat(9, book.getRate());
            prStm.setInt(10, book.getRateCount());
            prStm.setInt(11, book.getSold());
            prStm.setString(12, book.getImage());
            
            prStm.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.out.println("Query error occrue. Detail: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    @Override
    public void deleteBook(int bookId) {
        try (Connection con = DBUtils.getConnection()) {
            String sql = "DELETE FROM [Book] WHERE Book_ID = ?";
            PreparedStatement prStm = con.prepareStatement(sql);
            prStm.setInt(1, bookId);
            prStm.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.out.println("Query error occrue. Detail: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    @Override
    public List<BookDTO> searchBook(String keyword) {
        List<BookDTO> bookList = new ArrayList<>();
        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM [Book] WHERE Title LIKE ?";
            PreparedStatement prStm = con.prepareStatement(sql);
            prStm.setString(1, "%" + keyword + "%");
            ResultSet rs = prStm.executeQuery();
            while (rs.next()) {
                BookDTO book = getResultSet(rs);
                bookList.add(book);
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Query error occrue. Detail: " + ex.getMessage());
            ex.printStackTrace();
        }
        return bookList;
    }

    @Override
    public BookDTO getBookByID(int bookId) {
        BookDTO book = new BookDTO();
        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM [Book] WHERE Book_ID = ?";
            PreparedStatement prStm = con.prepareStatement(sql);
            prStm.setInt(1, bookId);
            ResultSet rs = prStm.executeQuery();
            if (rs.next()) {
                book = getResultSet(rs);
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Query error occrue. Detail: " + ex.getMessage());
            ex.printStackTrace();
        }
        return book;
    }

}