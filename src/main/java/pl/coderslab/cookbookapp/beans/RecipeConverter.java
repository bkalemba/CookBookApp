package pl.coderslab.cookbookapp.beans;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.cookbookapp.model.Recipe;

public class RecipeConverter implements Converter<String, Recipe> {

    @Autowired
    RecipeRepository recipeRepository;

    @Override
    public Recipe convert(String s) {
        return recipeRepository.findById(Long.parseLong(s)).get();
    }
}
