package com.codesquad.sidedish1.presentation;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

@Getter @Setter
public class BanchanDetail {
    @Id
    private Long BanchanDetail_Id;

    private int normal_price;
    private int sale_price;
    private String main_image;
    private String description;
    private String point;
    private String delivery_info;
    private String delivery_fee;
    private String title;
    private List<String> thumbs = new ArrayList<>();
    private List<String> details = new ArrayList<>();

    public void addThumbImages(String img) {
        thumbs.add(img);
    }

    public void addDetailImages(String img) {
        details.add(img);
    }
}
