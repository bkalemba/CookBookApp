package pl.coderslab.cookbookapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.cookbookapp.beans.CategoryRepository;
import pl.coderslab.cookbookapp.beans.IngredientRepository;
import pl.coderslab.cookbookapp.beans.ProductRepository;
import pl.coderslab.cookbookapp.beans.RecipeRepository;
import pl.coderslab.cookbookapp.model.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
public class HomeController {

    @Autowired
    private RecipeRepository recipeRepository;
    @Autowired
    private IngredientRepository ingredientRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private ProductRepository productRepository;

    @GetMapping("")
    public String homePage(Model model) {
        List<Category> categories = categoryRepository.findOrdered();
        model.addAttribute("meats", productRepository.findAllByCategoryNameOrderByName("Mięso"));
        model.addAttribute("fruits", productRepository.findAllByCategoryNameOrderByName("Owoce"));
        model.addAttribute("vegetables", productRepository.findAllByCategoryNameOrderByName("Warzywa"));
        return "index";
    }

    @PostMapping("/searchByProducts")
    public String searchByProducts(HttpServletRequest request, Model model) {
        List<Product> allProducts = productRepository.findAll();
        List<Product> productsToSearch = new ArrayList<>();
        for (Product product : allProducts) {
            String potentialId = request.getParameter(product.getName());
            if (potentialId != null) {
                productsToSearch.add(productRepository.findById(Long.parseLong(potentialId)).get());
            }
        }
        List<Recipe> searchResult = new ArrayList<>();
        for (Product product : productsToSearch) {
            List<Ingredient> ingredients = ingredientRepository.findAllByProductId(product.getId());
            if (ingredients != null) {
                for (Ingredient ingredient : ingredients) {
                    Recipe recipe = recipeRepository.findById(ingredient.getRecipe().getId()).get();
                    if (!containsRecipe(searchResult,recipe)) {
                        searchResult.add(recipe);
                    }
                }
            }
        }

        if (searchResult.size() > 0) {
            List<ScoreRecipe> scoreRecipes = new ArrayList<>();
            for(Recipe recipe : searchResult){
                ScoreRecipe scoreRecipe = new ScoreRecipe();
                scoreRecipe.setRecipe(recipe);
                scoreRecipe.setScore(0);
                List<Ingredient> ingredients = ingredientRepository.findAllByRecipeId(recipe.getId());
                for (Ingredient ingredient : ingredients) {
                    for (Product product : productsToSearch) {
                        if (product.getId().equals(ingredient.getProduct().getId())) {
                            scoreRecipe.setScore(scoreRecipe.getScore()+1);
                        }
                    }
                }
                scoreRecipe.setScore(scoreRecipe.getScore()- ingredients.size());
                scoreRecipes.add(scoreRecipe);
            }
            searchResult = new ArrayList<>();
            ScoreRecipe[] scoreRecipesArray = scoreRecipes.toArray(new ScoreRecipe[scoreRecipes.size()]);
            Integer[] scores = new Integer[scoreRecipesArray.length];
            for (int i = 0; i < scores.length; i++){
                scores[i] = scoreRecipesArray[i].getScore();
            }
            Arrays.sort(scores);
            for(int i = scores.length - 1; i >= 0; i--){
                for (ScoreRecipe sr : scoreRecipes) {
                    if(sr.getScore().equals(scores[i])){
                        searchResult.add(sr.getRecipe());
                    }
                }
            }
        }
        model.addAttribute("searchResult", searchResult);
        return "recipe/searchResult";
    }

    @PostMapping("/searchByTitle")
    public String searchByTitle(HttpServletRequest request, Model model) {
        String toSearch = request.getParameter("toSearch");
        List<Recipe> searchResult = recipeRepository.findAllByTitleContaining(toSearch);
        model.addAttribute("searchResult", searchResult);
        return "recipe/searchResult";
    }

    @GetMapping("/recipe/{id}")
    public String showRecipe(@PathVariable Long id, Model model) {
        model.addAttribute("recipe", recipeRepository.findById(id).get());
        model.addAttribute("recipeIngredients", ingredientRepository.findAllByRecipeId(id));
        return "recipe/showRecipe";
    }

    private boolean containsRecipe(List<Recipe> recipes, Recipe recipe){
        for (Recipe r: recipes) {
            if(r.getId() == recipe.getId()){
                return true;
            }
        }
        return false;
    }
}
