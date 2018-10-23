package pl.coderslab.cookbookapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.cookbookapp.beans.*;
import pl.coderslab.cookbookapp.model.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RecipeRepository recipeRepository;
    @Autowired
    private UnitRepository unitRepository;
    @Autowired
    private IngredientRepository ingredientRepository;

    @ModelAttribute("categories")
    public List<Category> getCategories() {
        return categoryRepository.findAll();
    }

    @ModelAttribute("users")
    public List<User> getUsers() {
        return userRepository.findAll();
    }

    @ModelAttribute("ingredients")
    public List<Ingredient> getIngredients() {
        return ingredientRepository.findAll();
    }

    @ModelAttribute("units")
    public List<Unit> getUnits() {
        return unitRepository.findAll();
    }

    @ModelAttribute("recipes")
    public List<Recipe> getRecipes() {
        return recipeRepository.findAll();
    }

    @GetMapping(value = {"", "/"})
    public String adminPanel() {
        return "/admin/home";
    }

    @GetMapping("/category/")
    public String categoryHome() {
        return "/admin/categoryHome";
    }

    @GetMapping("/category/add")
    public String categoryAdd(Model model) {
        model.addAttribute(new Category());
        return "admin/categoryForm";
    }

    @PostMapping("/category/add")
    public String categoryAdd(@Valid @ModelAttribute Category category, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/categoryForm";
        } else {
            categoryRepository.save(category);
            return "redirect:/admin/category/";
        }
    }

    @GetMapping("/category/edit/{id}")
    public String categoryEdit(Model model, @PathVariable Long id) {
        model.addAttribute("category", categoryRepository.findById(id).get());
        return "admin/categoryForm";
    }

    @PostMapping("/category/edit/{id}")
    public String categoryEdit(@Valid @ModelAttribute Category category, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/categoryForm";
        } else {
            categoryRepository.save(category);
            return "redirect:/admin/category/";
        }
    }

    @GetMapping("/category/delete/{id}")
    public String categoryDelete(@PathVariable Long id) {
        categoryRepository.delete(categoryRepository.findById(id).get());
        return "redirect:/admin/category/";
    }

//    @GetMapping("/ingredient/")
//    public String ingredientHome(){
//        return "/admin/ingredientHome";
//    }
}
