package pl.coderslab.cookbookapp.beans;


import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.cookbookapp.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
}
