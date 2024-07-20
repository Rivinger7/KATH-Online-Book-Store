/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Implement;

import DAO.ReviewDAO;
import DBUtils.DBUtils;
import Model.ReviewDTO;
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
public class ReviewDAOImp implements ReviewDAO {
    
    private ReviewDTO getResultSet(ResultSet resultSet) throws SQLException {
        
        ReviewDTO review = new ReviewDTO();
        
        review.setBookID(resultSet.getInt("Book_ID"));
        review.setComment(resultSet.getString("Comment"));
        review.setDate(resultSet.getDate("Date"));
        review.setReviewID(resultSet.getInt("Review_ID"));
        review.setUserID(resultSet.getInt("User_ID"));
        review.setImage(resultSet.getString("Image"));
        review.setFullName(resultSet.getString("Name"));
        
        return review;
    }

    @Override
    public void insert(int bookID, int userID, String comment, String image, String fullName) {
        
        try(Connection con = DBUtils.getConnection()) {
            String sql = "INSERT INTO Review (Book_ID, User_ID, Comment, Date, Image, Name)\n"
                    + "VALUES(?, ?, ?, ?, ?, ?)";
            
            java.sql.Date qlDate = null;
            java.util.Date utilDate = (Date) MyTools.parseDate(MyTools.toString(new Date(), "yyyy-MM-dd"), "yyyy-MM-dd");
            if(utilDate != null) {
                qlDate = new java.sql.Date(utilDate.getTime());
            }
            
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, bookID);
            stmt.setInt(2, userID);
            stmt.setString(3, comment);
            stmt.setDate(4, qlDate);
            stmt.setString(5, image);
            stmt.setString(6, fullName);
            
            stmt.executeUpdate();
            
            con.close();
        } catch(SQLException ex) {
            System.err.println(ex.getMessage() + " insert");
        }
    }

    @Override
    public List<ReviewDTO> getCommentListByBookID(int id) {
        List<ReviewDTO> list = new ArrayList<>();
        
        try(Connection con = DBUtils.getConnection()) {
            String sql = "SELECT *\n"
                    + "FROM Review\n"
                    + "WHERE Book_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()) {
                list.add(getResultSet(rs));
            }
            
            con.close();
        } catch(SQLException ex) {
            System.err.println(ex.getMessage());
        }
        
        return list;
    }
    
}
