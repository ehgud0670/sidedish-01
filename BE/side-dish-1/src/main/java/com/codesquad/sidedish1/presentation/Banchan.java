package com.example.demo.Entity;

import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

public class Banchan {

    @Id
    private Long id;

    private String name;
    private String price;
    private String category_id;
    private List<Image> imageList = new ArrayList<>();

    public Long getId() {
        return id;
    }

    public String getCategory_id() {
        return category_id;
    }

    public void setCategory_id(String category_id) {
        this.category_id = category_id;
    }


    public void addImage(Image image) { imageList.add(image); }

    @Override
    public String toString() {
        return "Banchan{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price='" + price + '\'' +
                ", imageList=" + imageList +
                '}';
    }

    public String getName() {
        return name;
    }

    public String getPrice() {
        return price;
    }

    public Banchan() {
    }

    public Banchan(String name, String price, String category_id) {
        this.name = name;
        this.price = price;
        this.category_id = category_id;
    }

    public List<Image> getImageList() {
        return imageList;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setImageList(List<Image> imageList) {
        this.imageList = imageList;
    }

}
