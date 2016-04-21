package eshop.business;

/**
 * Created by Serg on 13-Nov-15.
 */
public class Product {
    private double id;
    private String name;
    private Double price;
    private String code;
    private String description;

    public Product(){}

    public String getImageURL(){
        String url="/images/" + code + "/cover.jpg";
        return url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Double getPrice() {
        return price;
    }

    public String getCode() {
        return code;
    }

    public String getDescription() {
        return description;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

}
