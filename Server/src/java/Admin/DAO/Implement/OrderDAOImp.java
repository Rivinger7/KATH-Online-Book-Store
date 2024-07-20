/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin.DAO.Implement;

import Admin.DAO.OrderDAO;
import Admin.Model.OrderDTO;
import DBUtils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author satori
 */
public class OrderDAOImp implements OrderDAO {

    private OrderDTO getResultSet(ResultSet resultSet) throws SQLException {
        OrderDTO order = new OrderDTO();

        order.setOrderID(resultSet.getInt("Order_ID"));
        order.setUserID(resultSet.getInt("User_ID"));
        order.setUnitQuantity(resultSet.getInt("Unit_Quantity"));
        order.setTotalPrice(resultSet.getDouble("Total_Price"));
        order.setStatus(resultSet.getString("Status"));
        order.setPayment(resultSet.getString("Payment"));
        order.setShippingAddress(resultSet.getString("Shipping_Address"));
        order.setDate(resultSet.getDate("Date"));

        return order;
    }

    @Override
    public List<OrderDTO> getOrderByStatus(String status) {
        List<OrderDTO> orderList = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM [Order] WHERE status = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, status);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                orderList.add(getResultSet(rs));
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return orderList;
    }

    @Override
    public void deleteOrderByUserID(int userID) {
        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM [Order] WHERE User_ID = ?";
            PreparedStatement prStm = con.prepareStatement(sql);
            prStm.setInt(1, userID);
            ResultSet rs = prStm.executeQuery();
            sql = "DELETE from [Order_Book] WHERE Order_ID = ? ";
            PreparedStatement stm;
            while (rs.next()) {
                stm = con.prepareStatement(sql);
                stm.setInt(1, rs.getInt("Order_ID"));
                stm.executeUpdate();
            }
            sql = "DELETE FROM [Order] WHERE User_ID = ?";
            PreparedStatement preStm = con.prepareStatement(sql);
            preStm.setInt(1, userID);
            preStm.executeUpdate();

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();
        }
    }

    @Override
    public void changeStatusOrder(int orderID, String status) {
        try (Connection con = DBUtils.getConnection()) {
            String sql = "UPDATE [Order] SET Status = ? WHERE Order_ID = ?";
            PreparedStatement prStm = con.prepareStatement(sql);
            prStm.setString(1, status);
            prStm.setInt(2, orderID);
            prStm.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    public OrderDTO getOrderByOrderID(int orderID){
        OrderDTO order = new OrderDTO();
        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT *\n"
                    + "FROM [Order]\n"
                    + "WHERE Order_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, orderID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                order =getResultSet(rs);
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return order;
    }

}
