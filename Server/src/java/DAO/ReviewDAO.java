/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.ReviewDTO;
import java.util.List;

/**
 *
 * @author Admins
 */
public interface ReviewDAO {
    
    public void insert(int bookID, int userID, String comment, String image, String fullName);
    
    public List<ReviewDTO> getCommentListByBookID(int id); 
}
