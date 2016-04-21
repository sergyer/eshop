package eshop.business;

/**
 * Created by Serg on 13-Nov-15.
 */
public class LineItem {
    private int quantity;
    private Product product;

    public LineItem(){}

    public int getQuantity() {
        return quantity;
    }

    public String getProductCode(){
        return product.getCode();
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void addQuanity(){
        this.quantity+=1;
    }

    public double getTotal(){
        return product.getPrice()*quantity;
    }
}
