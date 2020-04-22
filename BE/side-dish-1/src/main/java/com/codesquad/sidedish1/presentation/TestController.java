package com.codesquad.sidedish1.presentation;


import com.codesquad.sidedish1.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TestController {

    @Autowired
    private CategoryRepository categoryRepository;

    @GetMapping("/test1")
    public Category findCategoryById() {
        return categoryRepository.findCategoryWithBanchans(1L);
    }

    @GetMapping("/test2")
    public List<Category> findAllCategoriesById() {
        return categoryRepository.findAllCategoryWithBanchans();
    }


}
