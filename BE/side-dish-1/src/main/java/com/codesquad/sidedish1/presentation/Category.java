package com.codesquad.sidedish1.presentation;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

@Getter @Setter
public class Category {

    @Id
    private int category_id;
    private String category_name;
    private String category_description;
    private List<Banchan> banchans = new ArrayList<>();

    public void addBanchan(Banchan banchan) { banchans.add(banchan);}

}
