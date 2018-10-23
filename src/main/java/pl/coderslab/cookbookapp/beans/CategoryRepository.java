package pl.coderslab.cookbookapp.beans;


import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.cookbookapp.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}
