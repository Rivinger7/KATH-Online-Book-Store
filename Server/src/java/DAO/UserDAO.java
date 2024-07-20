/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.UserDTO;
import java.util.List;

/**
 *
 * @author Admins
 */
public interface UserDAO {

    public UserDTO login(String username);
    
    public void register(UserDTO user);
    
    public List<UserDTO> getAll();
    
    public UserDTO getByUsername(String username);

    public UserDTO getById(int id);

    public UserDTO getByEmail(String email);

    public UserDTO getByPhoneNumber(String phoneNumber);
    
    public void updateProfile(UserDTO user);
    
    public void uploadImage(UserDTO user);
    
    public void updateShippingAddress(UserDTO user);
    
    public void changePassword(UserDTO user);
    
    public boolean resetPassword(String email, String newPassword);
    
    public void deleteUser(UserDTO user);

    public int count();

    public int countMaleUser();

    public int countFemaleUser();

}
