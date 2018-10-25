package pl.coderslab.cookbookapp.beans;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.cookbookapp.model.Product;

public class ProductConverter implements Converter<String, Product> {

    @Autowired
    ProductRepository productRepository;

    @Override
    public Product convert(String s) {
        return productRepository.findById(Long.parseLong(s)).get();
    }
}
