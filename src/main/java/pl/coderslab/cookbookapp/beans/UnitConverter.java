package pl.coderslab.cookbookapp.beans;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.cookbookapp.model.Unit;

public class UnitConverter implements Converter<String, Unit> {

    @Autowired
    UnitRepository unitRepository;

    @Override
    public Unit convert(String s) {
        return unitRepository.findById(Long.parseLong(s)).get();
    }
}
