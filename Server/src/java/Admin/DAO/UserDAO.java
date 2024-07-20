/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin.DAO;

import Model.UserDTO;
import java.util.List;

/**
 *
 * @author satori
 */
public interface UserDAO {
    public List<UserDTO> getByRole(String role);
    public UserDTO getById(int id);
    public void deleteUser(UserDTO user);
    public void insertAdmin(UserDTO user);
}
