package pl.coderslab.cookbookapp.beans;


import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.cookbookapp.model.Ingredient;

public interface IngredientRepository extends JpaRepository<Ingredient, Long> {
}
