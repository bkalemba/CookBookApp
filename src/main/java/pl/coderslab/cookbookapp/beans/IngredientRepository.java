package pl.coderslab.cookbookapp.beans;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.cookbookapp.model.Ingredient;
import pl.coderslab.cookbookapp.model.Product;

import java.util.List;

@Transactional
public interface IngredientRepository extends JpaRepository<Ingredient, Long> {

    List<Ingredient> findAllByRecipeId(Long id);
    void deleteIngredientByRecipeId(Long id);

    List<Ingredient> findAllByProductId(Long productId);
}
