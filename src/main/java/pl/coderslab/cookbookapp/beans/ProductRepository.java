package pl.coderslab.cookbookapp.beans;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.cookbookapp.model.Product;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    @Query(value = "SELECT p FROM Product p ORDER BY p.category.name, p.name")
    List<Product> finAllOrderedByCategory();
    List<Product> findAllByCategoryNameOrderByName(String categoryName);
}
