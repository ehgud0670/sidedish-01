package com.example.demo.Entity;

import org.springframework.data.annotation.Id;

public class Image {

    @Id
    private Long id;

    private String url;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Image() {
    }

    @Override
    public String toString() {
        return "Image{" +
                "id=" + id +
                ", url='" + url + '\'' +
                '}';
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Image(String url) {
        this.url = url;
    }
}
