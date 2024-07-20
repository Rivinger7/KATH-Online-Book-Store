/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin.DAO.Implement;

import Admin.DAO.UserDAO;
import DBUtils.DBUtils;
import Model.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author satori
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
    public List<UserDTO> getByRole(String role) {
        List<UserDTO> userList = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT User_ID, First_Name, Last_Name, username, Role FROM [User] WHERE Role = ?";
            PreparedStatement prStm = con.prepareStatement(sql);
            prStm.setString(1, role);
            ResultSet rs = prStm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("User_ID");
                String firstName = rs.getString("First_Name");
                String lastName = rs.getString("Last_Name");
                String username = rs.getString("username");
                String Role = rs.getString("Role");

                UserDTO list = new UserDTO();
                list.setId(id);
                list.setFirstName(firstName);
                list.setLastName(lastName);
                list.setUsername(username);
                list.setRole(Role);

                userList.add(list);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();
        }
        return userList;
    }

    @Override
    public UserDTO getById(int id) {
        UserDTO user = null;
        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM [User] WHERE User_ID = ?";
            PreparedStatement prStm = con.prepareStatement(sql);
            prStm.setInt(1, id);
            ResultSet rs = prStm.executeQuery();
            if (rs.next()) {
                user = getResultSet(rs);
            }
            con.close();

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();
        }
        return user;

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

            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

//    @Override
//    public void insertUser(UserDTO user) {
//        try(Connection con = DBUtils.getConnection()){
//            String sql = "INSERT INTO [User](passwordHash)"
//                       + "VALUES(?)";
//            PreparedStatement prStm = con.prepareStatement(sql);
//            prStm.setString(1, );
//            
//            
//        }catch(SQLException ex){
//            System.err.println(ex.getMessage());
//            ex.printStackTrace();
//        }
//    }
    
    @Override
    public void insertAdmin(UserDTO user) {
        try (Connection con = DBUtils.getConnection()) {
            String sql = "INSERT INTO [User] \n"
                    + "(First_Name, Last_Name, username, passwordHash, Email ,Role) \n"
                    + "VALUES \n"                                                                                           
                    + "(?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getUsername());
            stmt.setString(4, user.getPasswordHashed());
            stmt.setString(5, user.getEmail());
            stmt.setString(6, user.getRole());

            stmt.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }
    
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

    public UserDTO getByUserName(String username) {
        UserDTO userName = null;

        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM [USER] WHERE username = ? ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                userName = getResultSet(rs);
            }
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();
        }
        return userName;
    }
}
