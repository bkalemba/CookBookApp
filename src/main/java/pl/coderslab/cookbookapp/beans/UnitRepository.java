package pl.coderslab.cookbookapp.beans;


import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.cookbookapp.model.Unit;

public interface UnitRepository extends JpaRepository<Unit, Long> {
}
