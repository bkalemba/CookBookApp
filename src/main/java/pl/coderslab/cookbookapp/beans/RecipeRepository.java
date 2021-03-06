package pl.coderslab.cookbookapp.beans;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.cookbookapp.model.Recipe;

import java.util.List;

@Transactional
public interface RecipeRepository extends JpaRepository<Recipe, Long> {
    List<Recipe> findAllByTitleContaining(String toSearch);
    @Query(value = "SELECT r.id FROM Recipe r")
    List<Long> findAllIds();
}
