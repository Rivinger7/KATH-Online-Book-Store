/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Implement;

import DAO.OrderBookDAO;
import DBUtils.DBUtils;
import Model.OrderBookDTO;
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
public class OrderBookDAOImp implements OrderBookDAO {

    @Override
    public List<OrderBookDTO> getAll(int orderID) {
        
        List<OrderBookDTO> orderBookList = new ArrayList<>();
        
        try(Connection con = DBUtils.getConnection()) {
            String sql = "SELECT *\n"
                    + "FROM Order_Book\n"
                    + "WHERE Order_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, orderID);
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()) {
                OrderBookDTO orderBook = new OrderBookDTO();
                
                orderBook.setBookID(rs.getInt("Book_ID"));
                orderBook.setTitle(rs.getString("Title"));
                orderBook.setAmount(rs.getInt("Amount"));
                orderBook.setImage(rs.getString("Image"));
                orderBook.setPrice(rs.getDouble("Price"));
                
                orderBookList.add(orderBook);
            }
            
            con.close();
        } catch(SQLException ex) {
            System.err.println(ex.getMessage());
        }
        
        return orderBookList;
    }

    @Override
    public boolean insertToOrder(OrderBookDTO orderBook) {
        
        try(Connection con = DBUtils.getConnection()) {
            String sql = "INSERT INTO Order_Book"
                    + "(Order_ID,Book_ID,Title,Amount,Image,Price)\n"
                    + "VALUES(?,?,?,?,?,?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, orderBook.getOrderID());
            stmt.setInt(2, orderBook.getBookID());
            stmt.setString(3, orderBook.getTitle());
            stmt.setInt(4, orderBook.getAmount());
            stmt.setString(5, orderBook.getImage());
            stmt.setDouble(6, orderBook.getPrice());
            
            stmt.executeUpdate();
        } catch(SQLException ex) {
            System.err.println(ex.getMessage());
            return false;
        }
        
        return true;
    }
    
}
