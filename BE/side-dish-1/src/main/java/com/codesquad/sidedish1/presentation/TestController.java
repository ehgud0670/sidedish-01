package com.codesquad.sidedish1.presentation;

package com.example.demo;


import com.example.demo.Entity.Banchan;
import com.example.demo.Entity.Category;
import com.example.demo.Entity.Image;
import org.simpleflatmapper.jdbc.JdbcMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
