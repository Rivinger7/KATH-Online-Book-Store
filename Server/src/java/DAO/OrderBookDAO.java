/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.OrderBookDTO;
import java.util.List;

/**
 *
 * @author Admins
 */
public interface OrderBookDAO {
    
    public List<OrderBookDTO> getAll(int orderID);
    
    public boolean insertToOrder(OrderBookDTO orderBook);
    
}
