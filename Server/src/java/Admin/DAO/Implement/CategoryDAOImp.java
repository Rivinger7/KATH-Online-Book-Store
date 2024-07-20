/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin.DAO.Implement;

import Admin.DAO.CategoryDAO;
import Admin.DBUtils.DBUtils;
import Admin.Model.CategoryDTO;
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
public class CategoryDAOImp implements CategoryDAO {

    @Override
    public List<CategoryDTO> getAllCategory() {
        List<CategoryDTO> categoryList = new ArrayList<>();
        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT Category_ID, Name FROM [Category]";
            PreparedStatement prStm = con.prepareStatement(sql);
            ResultSet rs = prStm.executeQuery();
            while (rs.next()) {
                CategoryDTO category = new CategoryDTO();
                int id = rs.getInt("Category_ID");
                String name = rs.getString("Name");
                category.setCategoryID(id);
                category.setCategoryName(name);
                categoryList.add(category);
            }
            con.close();

        } catch (SQLException ex) {
            System.out.println("SQL error! Detail: " + ex.getMessage());
            ex.printStackTrace();
        }
        return categoryList;
    }

    @Override
    public void insertCategory(String categoryName) {
        try (Connection con = DBUtils.getConnection()) {
            String sql = "INSERT INTO [Category](Name) "
                       + "VALUES(?)";
            PreparedStatement prStm = con.prepareStatement(sql);
            prStm.setString(1, categoryName);
            prStm.executeUpdate();
            con.close();
            
        }catch (SQLException ex) {
            System.out.println("SQL error! Detail: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    @Override
    public void deleteCategory() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public CategoryDTO getCategoryByID(int categoryID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateCategory(int categoryID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
