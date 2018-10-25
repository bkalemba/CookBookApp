package pl.coderslab.cookbookapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.cookbookapp.beans.*;
import pl.coderslab.cookbookapp.model.*;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private IngredientRepository ingredientRepository;
    @Autowired
    private RecipeRepository recipeRepository;
    @Autowired
    private UnitRepository unitRepository;
    @Autowired
    private ProductRepository productRepository;

    @ModelAttribute("categories")
    public List<Category> getCategories() {
        return categoryRepository.findOrdered();
    }

    @ModelAttribute("products")
    public List<Product> getProducts() {
        return productRepository.finAllOrderedByCategory();
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

    //----------------------------------------------------------

    @GetMapping("/product/")
    public String productHome() {
        return "/admin/productHome";
    }

    @GetMapping("/product/add")
    public String productAdd(Model model) {
        model.addAttribute(new Product());
        return "admin/productForm";
    }

    @PostMapping("/product/add")
    public String productAdd(@Valid @ModelAttribute Product product, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/productForm";
        } else {
            productRepository.save(product);
            return "redirect:/admin/product/";
        }
    }

    @GetMapping("/product/edit/{id}")
    public String productEdit(Model model, @PathVariable Long id) {
        model.addAttribute("product", productRepository.findById(id).get());
        return "admin/productForm";
    }

    @PostMapping("/product/edit/{id}")
    public String productEdit(@Valid @ModelAttribute Product product, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/productForm";
        } else {
            productRepository.save(product);
            return "redirect:/admin/product/";
        }
    }

    @GetMapping("/product/delete/{id}")
    public String productDelete(@PathVariable Long id) {
        productRepository.delete(productRepository.findById(id).get());
        return "redirect:/admin/product/";
    }

    //----------------------------------------------------------

    @GetMapping("/unit/")
    public String unitHome() {
        return "/admin/unitHome";
    }

    @GetMapping("/unit/add")
    public String unitAdd(Model model) {
        model.addAttribute(new Unit());
        return "admin/unitForm";
    }

    @PostMapping("/unit/add")
    public String unitAdd(@Valid @ModelAttribute Unit unit, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/unitForm";
        } else {
            unitRepository.save(unit);
            return "redirect:/admin/unit/";
        }
    }

    @GetMapping("/unit/edit/{id}")
    public String unitEdit(Model model, @PathVariable Long id) {
        model.addAttribute("unit", unitRepository.findById(id).get());
        return "admin/unitForm";
    }

    @PostMapping("/unit/edit/{id}")
    public String unitEdit(@Valid @ModelAttribute Unit unit, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/unitForm";
        } else {
            unitRepository.save(unit);
            return "redirect:/admin/unit/";
        }
    }

    @GetMapping("/unit/delete/{id}")
    public String unitDelete(@PathVariable Long id) {
        unitRepository.delete(unitRepository.findById(id).get());
        return "redirect:/admin/unit/";
    }

    //----------------------------------------------------------

    @GetMapping("/recipe/")
    public String recipeHome() {
        return "/admin/recipeHome";
    }

    @GetMapping("/recipe/add")
    public String recipeAdd(Model model) {
        model.addAttribute(new Recipe());
        return "admin/recipeTitleForm";
    }

    @PostMapping("/recipe/add")
    public String recipeAdd(@Valid @ModelAttribute Recipe recipe, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/recipeTitleForm";
        } else {
            recipe.setCreated(LocalDateTime.now().toString());
            recipe.setActive(false);
            Long savedId = recipeRepository.save(recipe).getId();

            return "redirect:/admin/recipe/add/"+savedId;
        }
    }

    @GetMapping("/recipe/add/{id}")
    public String recipeDetails(Model model, @PathVariable Long id){
        model.addAttribute("recipe", recipeRepository.findById(id).get());
        model.addAttribute("ingredient", new Ingredient());
        model.addAttribute("recipeIngredients", ingredientRepository.findAllByRecipeId(id));
        return "admin/recipeDetailsForm";
    }

    @PostMapping("/recipe/add/{id}")
    public String recipeDetails(@ModelAttribute Ingredient ingredient ,Model model, @Valid @ModelAttribute Recipe recipe, BindingResult result){
        model.addAttribute("recipeIngredients", ingredientRepository.findAllByRecipeId(recipe.getId()));
        if (result.hasErrors()){
            return "admin/recipeDetailsForm";
        } else {
            recipeRepository.save(recipe);
            return "admin/recipeDetailsForm";
        }
    }

    @PostMapping("/recipe/add/{id}/ingredient")
    public String recipeIngredient(@ModelAttribute Ingredient ingredient, @PathVariable Long id){
        ingredient.setId(null);
        Recipe recipe = recipeRepository.findById(id).get();
        ingredient.setRecipe(recipe);
        ingredientRepository.save(ingredient);
        return "redirect:/admin/recipe/add/"+recipe.getId();
    }

    @GetMapping("/recipe/add/{recipeId}/ingredient/{ingredientId}")
    public String deleteIngredient(@PathVariable Long recipeId, @PathVariable Long ingredientId){
        ingredientRepository.deleteById(ingredientId);
//        return "redirect:/admin/recipe/add/"+recipeId;
        return "redirect:/admin/recipe/";
    }

    @GetMapping("/recipe/delete/{id}")
    public String recipeDelete(@PathVariable Long id) {
        ingredientRepository.deleteIngredientByRecipeId(id);
        recipeRepository.delete(recipeRepository.findById(id).get());
        return "redirect:/admin/recipe/";
    }

    //----------------------------------------------------------
}
