package com.codesquad.sidedish1.presentation;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

@Getter @Setter @ToString
public class Banchan {

    @Id
    private int banchan_id;
    private String image;
    private List<String> delivery_types = new ArrayList<>();
    private String title;
    private String description;
    private int normal_price;
    private int sale_price;
    private List<String> badges = new ArrayList<>();

    public void addBadge(String badge) { badges.add(badge);}
    public void addDelivery(String deliveryType) { delivery_types.add(deliveryType);}





}
