/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.OrderDTO;
import java.util.List;

/**
 *
 * @author Admins
 */
public interface OrderDAO {

    public List<OrderDTO> getAll();

    public boolean createOrder(OrderDTO order);
    
    public List<OrderDTO> getOrderListByUserID(int id);

}
