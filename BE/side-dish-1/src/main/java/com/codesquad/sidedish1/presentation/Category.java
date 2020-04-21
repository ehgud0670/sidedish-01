package com.example.demo.Entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

@Getter @Setter
public class Category {

    @Id
    private Long id;
    private String name;

    private List<Banchan> banchans = new ArrayList<>();

    public Category() {
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public List<Banchan> getBanchans() {
        return banchans;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setBanchans(List<Banchan> banchans) {
        this.banchans = banchans;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", banchans=" + banchans +
                '}';
    }

    public Category(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    public void addBanchan(Banchan banchan) { banchans.add(banchan);}

}
