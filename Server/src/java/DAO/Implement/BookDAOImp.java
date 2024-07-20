/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Implement;

import DAO.BookDAO;
import DBUtils.DBUtils;
import Model.AuthorDTO;
import Model.BookDTO;
import Model.CategoryDTO;
import Model.PublisherDTO;
import Model.ShoppingCartDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admins
 */
public class BookDAOImp implements BookDAO {

    private BookDTO getResultSet(ResultSet resultSet) throws SQLException {
        BookDTO book = new BookDTO();

        book.setBookID(resultSet.getInt("Book_ID"));
        book.setPrice(resultSet.getDouble("Price"));
        book.setTitle(resultSet.getString("Title"));
        book.setYearOfPublication(resultSet.getInt("Year_of_Publication"));
        book.setQuantity(resultSet.getInt("Quantity"));
        book.setDescription(resultSet.getString("Description"));
        book.setRate(resultSet.getDouble("Rate"));
        book.setRateCount(resultSet.getInt("Rate_Count"));
        book.setSold(resultSet.getInt("Sold"));
        book.setImage(resultSet.getString("Image"));

        return book;
    }

    @Override
    public List<BookDTO> getAllBook() {
        List<BookDTO> bookList = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM Book";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                bookList.add(getResultSet(rs));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return bookList;
    }

    @Override
    public List<CategoryDTO> getAllCategory() {
        List<CategoryDTO> categoryList = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM Category";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                CategoryDTO category = new CategoryDTO();
                category.setCategoryID(rs.getInt("Category_ID"));
                category.setCategoryName(rs.getString("Name"));
                categoryList.add(category);
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return categoryList;
    }

    @Override
    public List<PublisherDTO> getAllPublisher() {
        List<PublisherDTO> publisherList = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM Publisher";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                PublisherDTO publisher = new PublisherDTO();
                publisher.setPublisherID(rs.getInt("Publisher_ID"));
                publisher.setPublisherName(rs.getString("Name"));
                publisherList.add(publisher);
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return publisherList;
    }

    @Override
    public List<BookDTO> getBookListByCategoryID(int id) {
        List<BookDTO> bookList = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM Book\n"
                    + "WHERE Category_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                bookList.add(getResultSet(rs));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return bookList;
    }

    @Override
    public BookDTO getBookByID(int id) {
        BookDTO book = new BookDTO();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM Book\n"
                    + "WHERE Book_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                book = getResultSet(rs);
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return book;
    }

    @Override
    public CategoryDTO getCategoryByBookID(int id) {
        CategoryDTO category = new CategoryDTO();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT c.Category_ID AS Category_ID_ALIAS, c.Name AS Category_Name_ALIAS\n"
                    + "FROM Book b\n"
                    + "JOIN Category c ON b.Category_ID = c.Category_ID\n"
                    + "WHERE b.Book_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                category.setCategoryID(rs.getInt("Category_ID_ALIAS"));
                category.setCategoryName(rs.getString("Category_Name_ALIAS"));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return category;
    }

    @Override
    public PublisherDTO getPublisherByBookID(int id) {
        PublisherDTO publisher = new PublisherDTO();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT p.Publisher_ID AS Publisher_ID_ALIAS, p.Name AS Publisher_NAME_ALIAS\n"
                    + "FROM Book b\n"
                    + "JOIN Publisher p ON b.Publisher_ID = p.Publisher_ID\n"
                    + "WHERE b.Book_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                publisher.setPublisherID(rs.getInt("Publisher_ID_ALIAS"));
                publisher.setPublisherName(rs.getString("Publisher_NAME_ALIAS"));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return publisher;
    }

    @Override
    public AuthorDTO getAuthorByBookID(int id) {
        AuthorDTO author = new AuthorDTO();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT a.Author_ID AS Author_ID_ALIAS, a.Name AS Author_NAME_ALIAS\n"
                    + "FROM Book b\n"
                    + "JOIN Author a ON b.Author_ID = a.Author_ID\n"
                    + "WHERE b.Book_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                author.setAuthorID(rs.getInt("Author_ID_ALIAS"));
                author.setAuthorName(rs.getString("Author_NAME_ALIAS"));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return author;
    }

    @Override
    public void updateRatingByBookID(double rating, int id) {

        double newRate;
        double currentRate;
        int currentRateCount;
        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT Rate, Rate_Count\n"
                    + "FROM Book\n"
                    + "WHERE Book_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                currentRate = rs.getDouble("Rate");
                currentRateCount = rs.getInt("Rate_Count");
                if (currentRateCount != 0) {
                    newRate = ((currentRate * currentRateCount) + rating) / (currentRateCount + 1);
                    ++currentRateCount;
                } else {
                    newRate = rating;
                    ++currentRateCount;
                }

                int newRateCount = currentRateCount;

                sql = "UPDATE Book\n"
                        + "SET Rate = ?,\n"
                        + "Rate_Count = ?\n"
                        + "WHERE Book_ID = ?";
                PreparedStatement updateStmt = con.prepareStatement(sql);
                updateStmt.setDouble(1, newRate);
                updateStmt.setInt(2, newRateCount);
                updateStmt.setInt(3, id);

                updateStmt.executeUpdate();
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public double getRatingByBookID(int id) {

        double rating = 0;

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT Rate\n"
                    + "FROM Book\n"
                    + "WHERE Book_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                rating = rs.getDouble("Rate");
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return rating;
    }

    @Override
    public List<BookDTO> getBookListByTitle(String title) {
        List<BookDTO> bookList = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT *\n"
                    + "FROM Book\n"
                    + "WHERE Title LIKE ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, "%" + title + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                bookList.add(getResultSet(rs));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return bookList;
    }

    @Override
    public int countTotalBookByCategoryID(int id) {
        String sql;

        try (Connection con = DBUtils.getConnection()) {
            PreparedStatement stmt = null;
            if (id == 0) {
                sql = "SELECT COUNT(*)\n"
                        + "FROM Book";
                stmt = con.prepareStatement(sql);
            } else {
                sql = "SELECT COUNT(*)\n"
                        + "FROM Book\n"
                        + "WHERE Category_ID = ?";
                stmt = con.prepareStatement(sql);
                stmt.setInt(1, id);
            }
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return 0;
    }

    @Override
    public int countTotalBookByPublisherID(int id) {
        String sql;
        if (id == 0) {
            sql = "SELECT COUNT(*)\n"
                    + "FROM Book";
        } else {
            sql = "SELECT COUNT(*)\n"
                    + "FROM Book\n"
                    + "WHERE Publisher_ID = ?";
        }

        try (Connection con = DBUtils.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return 0;
    }

    @Override
    public int countTotalBookByPrice(double price) {
        String sql;

        if (price > 0 && price <= 6) {
            sql = "SELECT COUNT(*)\n"
                    + "FROM Book\n"
                    + "WHERE Price BETWEEN 0 AND 6";
        } else if (price > 6 && price <= 12) {
            sql = "SELECT COUNT(*)\n"
                    + "FROM Book\n"
                    + "WHERE Price BETWEEN 6 AND 12";
        } else if (price > 12 && price <= 20) {
            sql = "SELECT COUNT(*)\n"
                    + "FROM Book\n"
                    + "WHERE Price BETWEEN 12 AND 20";
        } else {
            sql = "SELECT COUNT(*)\n"
                    + "FROM Book\n"
                    + "WHERE Price > 20";
        }

        try (Connection con = DBUtils.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return 0;
    }

    @Override
    public List<BookDTO> pagingBookList(int page) {
        List<BookDTO> bookList = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT *\n"
                    + "FROM Book\n"
                    + "ORDER BY Book_ID\n"
                    + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, (page - 1) * 9);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                bookList.add(getResultSet(rs));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return bookList;
    }

    @Override
    public List<BookDTO> pagingBookListByCategoryID(int page, int id) {
        List<BookDTO> bookList = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT *\n"
                    + "FROM Book\n"
                    + "WHERE Category_ID = ?\n"
                    + "ORDER BY Book_ID\n"
                    + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.setInt(2, (page - 1) * 9);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                bookList.add(getResultSet(rs));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return bookList;
    }

    @Override
    public List<BookDTO> pagingBookListByPublisherID(int page, int id) {
        List<BookDTO> bookList = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT *\n"
                    + "FROM Book\n"
                    + "WHERE Publisher_ID = ?\n"
                    + "ORDER BY Book_ID\n"
                    + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.setInt(2, (page - 1) * 9);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                bookList.add(getResultSet(rs));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return bookList;
    }

    @Override
    public List<BookDTO> pagingBookListByPrice(int page, double price) {

        List<BookDTO> bookList = new ArrayList<>();
        String sql;
        if (price > 0 && price <= 6) {
            sql = "SELECT *\n"
                    + "FROM Book\n"
                    + "WHERE Price BETWEEN 0 AND 6"
                    + "ORDER BY Price\n"
                    + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
        } else if (price > 6 && price <= 12) {
            sql = "SELECT *\n"
                    + "FROM Book\n"
                    + "WHERE Price BETWEEN 6 AND 12"
                    + "ORDER BY Price\n"
                    + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
        } else if (price > 12 && price <= 20) {
            sql = "SELECT *\n"
                    + "FROM Book\n"
                    + "WHERE Price BETWEEN 12 AND 20"
                    + "ORDER BY Price\n"
                    + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
        } else {
            sql = "SELECT *\n"
                    + "FROM Book\n"
                    + "WHERE Price > 20"
                    + "ORDER BY Price\n"
                    + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
        }

        try (Connection con = DBUtils.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, (page - 1) * 9);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                bookList.add(getResultSet(rs));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return bookList;
    }

    @Override
    public List<ShoppingCartDTO> getCartBook(List<ShoppingCartDTO> cartList) {
        List<ShoppingCartDTO> bookList = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            if (cartList.size() > 0) {
                for (ShoppingCartDTO item : cartList) {
                    String sql = "SELECT *\n"
                            + "FROM Book\n"
                            + "WHERE Book_ID = ?";
                    PreparedStatement stmt = con.prepareStatement(sql);
                    stmt.setInt(1, item.getBookID());
                    ResultSet rs = stmt.executeQuery();

                    if (rs.next()) {
                        ShoppingCartDTO row = new ShoppingCartDTO();
                        row.setBookID(rs.getInt("Book_ID"));
                        row.setTitle(rs.getString("Title"));
                        row.setCategory((getCategoryByBookID(row.getBookID()).getCategoryName()));
                        row.setImage(rs.getString("Image"));
                        row.setPrice(rs.getDouble("Price"));
                        row.setAmount(item.getAmount());
                        bookList.add(row);
                    }
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return bookList;
    }

    @Override
    public double getTotalCartPrice(List<ShoppingCartDTO> cartList) {

        double totalCartPrice = 0;

        try (Connection con = DBUtils.getConnection()) {
            if (cartList.size() > 0) {
                for (ShoppingCartDTO item : cartList) {
                    String sql = "SELECT Price\n"
                            + "FROM Book\n"
                            + "WHERE Book_ID = ?";
                    PreparedStatement stmt = con.prepareStatement(sql);
                    stmt.setInt(1, item.getBookID());
                    ResultSet rs = stmt.executeQuery();

                    if (rs.next()) {
                        totalCartPrice += rs.getDouble("Price") * item.getAmount();
                    }
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return Math.round(totalCartPrice * 100.0) / 100.0;
    }

    @Override
    public boolean updateQuantityByBookID(int id, int quantity) {

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT Quantity, Sold\n"
                    + "FROM Book\n"
                    + "WHERE Book_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int currentQuantity = rs.getInt("Quantity");
                int currentSold = rs.getInt("Sold");
                sql = "UPDATE Book\n"
                        + "SET Quantity = ?,"
                        + "Sold = ?\n"
                        + "WHERE Book_ID = ?";
                PreparedStatement updateStmt = con.prepareStatement(sql);
                updateStmt.setInt(1, currentQuantity - quantity);
                updateStmt.setInt(2, currentSold + quantity);
                updateStmt.setInt(3, id);
                updateStmt.executeUpdate();
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            return false;
        }

        return true;
    }

    @Override
    public List<BookDTO> getBestSeller(String categoryName) {
        List<BookDTO> list = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT TOP 5 b.*, c.Category_ID AS Category_ID_ALIAS, c.Name AS Category_Name_ALIAS\n"
                    + "FROM Book b\n"
                    + "JOIN Category c ON b.Category_ID = c.Category_ID\n"
                    + "WHERE c.Name LIKE ?\n"
                    + "ORDER BY Sold DESC";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, categoryName);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(getResultSet(rs));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return list;
    }

    @Override
    public List<BookDTO> getNewBook(String categoryName) {
        List<BookDTO> list = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT TOP 8 b.*, c.Category_ID AS Category_ID_ALIAS, c.Name AS Category_Name_ALIAS\n"
                    + "FROM Book b\n"
                    + "JOIN Category c ON b.Category_ID = c.Category_ID\n"
                    + "WHERE c.Name LIKE ?\n"
                    + "ORDER BY Book_ID DESC";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, categoryName);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(getResultSet(rs));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return list;
    }

    @Override
    public List<BookDTO> getBookListByPublisherID(int id) {
        List<BookDTO> bookList = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM Book\n"
                    + "WHERE Publisher_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                bookList.add(getResultSet(rs));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return bookList;
    }

    @Override
    public List<BookDTO> getBookListByPrice(double price) {
        List<BookDTO> bookList = new ArrayList<>();

        String sql;
        if (price > 0 && price <= 6) {
            sql = "SELECT *\n"
                    + "FROM Book\n"
                    + "WHERE Price BETWEEN 0 AND 6";
        } else if (price > 6 && price <= 12) {
            sql = "SELECT *\n"
                    + "FROM Book\n"
                    + "WHERE Price BETWEEN 6 AND 12";
        } else if (price > 12 && price <= 20) {
            sql = "SELECT *\n"
                    + "FROM Book\n"
                    + "WHERE Price BETWEEN 12 AND 20";
        } else {
            sql = "SELECT *\n"
                    + "FROM Book\n"
                    + "WHERE Price > 20";
        }

        try (Connection con = DBUtils.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                bookList.add(getResultSet(rs));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return bookList;
    }

    @Override
    public List<BookDTO> getRelatedBook(int bookID, int categoryID) {
        List<BookDTO> bookList = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM Book\n"
                    + "WHERE Category_ID = ? AND Book_ID != ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, categoryID);
            stmt.setInt(2, bookID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                bookList.add(getResultSet(rs));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return bookList;
    }

}
