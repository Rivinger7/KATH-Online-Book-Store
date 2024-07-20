/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin.DAO;

import Admin.Model.CategoryDTO;
import java.util.List;

/**
 *
 * @author satori
 */
public interface CategoryDAO {
    public List<CategoryDTO> getAllCategory();
    public void insertCategory(String categoryName);
    public void deleteCategory();
    public CategoryDTO getCategoryByID(int categoryID);
    public void updateCategory(int categoryID);
}
