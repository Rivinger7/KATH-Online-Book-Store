/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Implement;

import DAO.OrderDAO;
import DBUtils.DBUtils;
import Model.OrderDTO;
import Utility.MyTools;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admins
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
    public List<OrderDTO> getAll() {
        List<OrderDTO> orderList = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM [Order]";
            PreparedStatement stmt = con.prepareStatement(sql);
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
    public boolean createOrder(OrderDTO order) {

        int generatedOrderId = 0;

        try (Connection con = DBUtils.getConnection()) {
            String sql = "INSERT INTO [Order]"
                    + "(User_ID,Unit_Quantity,Total_Price,Status,Payment,Shipping_Address,Date)\n"
                    + "VALUES(?,?,?,?,?,?,?)";

            java.sql.Date qlDate = null;
            java.util.Date utilDate = (Date) MyTools.parseDate(MyTools.toString(order.getDate(), "yyyy-MM-dd"), "yyyy-MM-dd");
            if (utilDate != null) {
                qlDate = new java.sql.Date(utilDate.getTime());
            }

            PreparedStatement stmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, order.getUserID());
            stmt.setInt(2, order.getUnitQuantity());
            stmt.setDouble(3, order.getTotalPrice());
            stmt.setString(4, order.getStatus());
            stmt.setString(5, order.getPayment());
            stmt.setString(6, order.getShippingAddress());
            stmt.setDate(7, qlDate);

            int affectedRows = stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                generatedOrderId = rs.getInt(1);
                order.setOrderID(generatedOrderId);
            }

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            return false;
        }

        return true;
    }

    @Override
    public List<OrderDTO> getOrderListByUserID(int id) {

        List<OrderDTO> orderList = new ArrayList<>();

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT *\n"
                    + "FROM [Order]\n"
                    + "WHERE User_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
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

}
