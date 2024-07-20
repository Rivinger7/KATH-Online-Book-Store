/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Implement;

import DBUtils.DBUtils;
import DAO.UserDAO;
import Model.UserDTO;
import Utility.MyTools;
import java.sql.Connection;
//import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admins
 */
public class UserDAOImp implements UserDAO {

    private UserDTO getResultSet(ResultSet resultSet) throws SQLException {

        UserDTO user = new UserDTO();

        user.setId(resultSet.getInt("User_ID"));
        user.setFirstName(resultSet.getString("First_Name"));
        user.setLastName(resultSet.getString("Last_Name"));
        user.setUsername(resultSet.getString("username"));
        user.setPasswordHashed(resultSet.getString("passwordHash"));
        user.setCity(resultSet.getString("City"));
        user.setDistrict(resultSet.getString("District"));
        user.setWard(resultSet.getString("Ward"));
        user.setPhoneNumber(resultSet.getString("Phone_Number"));
        user.setEmail(resultSet.getString("Email"));
        user.setBirthday(resultSet.getDate("Birthday"));
        user.setRole(resultSet.getString("Role"));
        user.setGender(resultSet.getString("Gender"));
        user.setAvatarPath(resultSet.getString("Avatar"));
        user.setAddress(resultSet.getString("Address"));

        return user;
    }

    @Override
    public void register(UserDTO user) {
        try (Connection con = DBUtils.getConnection()) {
            String sql = "INSERT INTO [User] \n"
                    + "(First_Name, Last_Name, username, passwordHash, Phone_Number, Email, Role) \n"
                    + "VALUES \n"
                    + "(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getUsername());
            stmt.setString(4, user.getPasswordHashed());
            stmt.setString(5, user.getPhoneNumber());
            stmt.setString(6, user.getEmail());
            stmt.setString(7, user.getRole());

            stmt.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void updateProfile(UserDTO user) {
        try (Connection con = DBUtils.getConnection()) {
            String sql = "UPDATE [User]\n"
                    + "SET First_Name = ?, \n"
                    + "    Last_Name = ?, \n"
                    + "    Phone_Number = ?, \n"
                    + "    Email = ?, \n"
                    + "    Birthday = ?, \n"
                    + "    [Gender] = ?, \n"
                    + "    Avatar = ? \n"
                    + " WHERE User_ID = ?";
            
            java.sql.Date qlDate = null;
            java.util.Date utilDate = (Date) MyTools.parseDate(MyTools.toString(user.getBirthday(), "yyyy-MM-dd"), "yyyy-MM-dd");
            if(utilDate != null) {
                qlDate = new java.sql.Date(utilDate.getTime());
            }

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getPhoneNumber());
            stmt.setString(4, user.getEmail());
            stmt.setDate(5, qlDate);
            stmt.setString(6, user.getGender());
            stmt.setString(7, user.getAvatarPath());
            stmt.setInt(8, user.getId());

            stmt.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void updateShippingAddress(UserDTO user) {
        try (Connection con = DBUtils.getConnection()) {
            String sql = "UPDATE [User]\n"
                    + "SET Address = ?, \n"
                    + "    City = ?, \n"
                    + "    District = ?, \n"
                    + "    Ward = ?\n"
                    + "WHERE User_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, user.getAddress());
            stmt.setString(2, user.getCity());
            stmt.setString(3, user.getDistrict());
            stmt.setString(4, user.getWard());
            stmt.setInt(5, user.getId());

            stmt.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void uploadImage(UserDTO user) {
        try (Connection con = DBUtils.getConnection()) {
            String sql = "UPDATE [User]\n"
                    + "SET Avatar = ?\n"
                    + "WHERE User_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, user.getAvatarPath());
            stmt.setInt(2, user.getId());

            stmt.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void changePassword(UserDTO user) {
        try (Connection con = DBUtils.getConnection()) {
            String sql = "UPDATE [User]\n"
                    + "SET passwordHash = ?\n"
                    + "WHERE User_ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, user.getPasswordHashed());
            stmt.setInt(2, user.getId());

            stmt.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public boolean resetPassword(String email, String newPassword) {
        try (Connection con = DBUtils.getConnection()) {
            String sql = "UPDATE [User]\n"
                    + "SET passwordHash = ?\n"
                    + "WHERE Email = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, newPassword);
            stmt.setString(2, email);

            stmt.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            return false;
        }
        return true;
    }

    @Override
    public void deleteUser(UserDTO user) {
        try (Connection con = DBUtils.getConnection()) {
            String sql = "DELETE FROM [User]\n"
                    + "WHERE User_ID = ?";

            PreparedStatement stmt = con.prepareStatement(sql);
            System.out.println("id: " + user.getId() + " at UserDAOImp");
            stmt.setInt(1, user.getId());
            stmt.executeUpdate();

//            String sqlRestID = "DBCC CHECKIDENT ('User', RESEED, ?)";
//            stmt.executeQuery(sqlRestID);
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public UserDTO login(String username) {

        UserDTO user = null;

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM [User] WHERE username = ? ";

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = getResultSet(rs);
            }
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return user;
    }

    @Override
    public List<UserDTO> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public UserDTO getByUsername(String username) {
        UserDTO user = null;

        try {
            Connection con = DBUtils.getConnection();

            String sql = "SELECT * FROM [User] WHERE username = ? ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = getResultSet(rs);
            }
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return user;
    }

    @Override
    public UserDTO getById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public UserDTO getByEmail(String email) {
        UserDTO userEmail = null;

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM [USER] WHERE Email = ? ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, email);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                userEmail = getResultSet(rs);
            }
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();
        }
        return userEmail;
    }

    @Override
    public UserDTO getByPhoneNumber(String phoneNumber) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int count() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int countMaleUser() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int countFemaleUser() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
