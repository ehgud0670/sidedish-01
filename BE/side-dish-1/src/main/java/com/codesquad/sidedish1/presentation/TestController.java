package com.codesquad.sidedish1.presentation;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class TestController {

    @Autowired
    private CategoryRepository categoryRepository;

    @GetMapping("/categories/{categoryId}")
    public ApiResponseMessage getCategory(@PathVariable int categoryId) {
        Category category = categoryRepository.getCategoryWithId(categoryId);
        return new ApiResponseMessage("SUCCESS", category);
    }

    @GetMapping("/banchans/{banchanId}")
    public ApiResponseMessage getBanchanDetails(@PathVariable int banchanId) {
        BanchanDetail banchanDetail =  categoryRepository.getBanchanDetailWithThumbImagesAndDetailImages(banchanId);
        return new ApiResponseMessage("SUCCESS", banchanDetail);
    }

    @GetMapping("/see/banchans/{banchanId}")
    public ApiResponseMessage getBanchanDetails1(@PathVariable int banchanId) {
        Banchan banchan =  categoryRepository.getBanchanWithEveryDetails(banchanId);
        return new ApiResponseMessage("SUCCESS", banchan);
    }

    @GetMapping("/urls")
    public ApiResponseMessage getAllUrls() {
        List<String> urls = new ArrayList<>();
        urls.add("http://15.165.210.164:8080/categories/1");
        urls.add("http://15.165.210.164:8080/categories/2");
        urls.add("http://15.165.210.164:8080/categories/3");
        return new ApiResponseMessage("SUCCESS", urls );
    }


}
