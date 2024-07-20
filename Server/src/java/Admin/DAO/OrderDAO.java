/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin.DAO;

import Admin.Model.OrderDTO;
import java.util.List;

/**
 *
 * @author satori
 */
public interface OrderDAO {
    public void deleteOrderByUserID(int userID);
    public void changeStatusOrder(int orderID, String status);
    public List<OrderDTO> getOrderByStatus(String status);
    public OrderDTO getOrderByOrderID(int orderID);
}
