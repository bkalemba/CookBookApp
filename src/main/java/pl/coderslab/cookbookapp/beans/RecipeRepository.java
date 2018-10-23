package pl.coderslab.cookbookapp.beans;


import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.cookbookapp.model.Recipe;

public interface RecipeRepository extends JpaRepository<Recipe, Long> {
}
