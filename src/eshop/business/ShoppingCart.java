package eshop.business;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * Created by Serg on 13-Nov-15.
 */
public class ShoppingCart {
    private ArrayList<LineItem> lineItems;

    public ShoppingCart(){
        lineItems =new ArrayList<>();
    }

    public ArrayList<LineItem> getLineItems() {
        return lineItems;
    }

    public boolean getEmpty(){
        if(lineItems.size()==0)
            return true;
        else return false;
    }

    public int getSize(){
        return lineItems.size();
    }

    public void setLineItems(ArrayList<LineItem> lineItems) {
        this.lineItems = lineItems;
    }

    public void addItem(LineItem item){
        lineItems.add(item);
    }

    public LineItem getLineItem(String productCode){
        LineItem item,result=null;
        while(lineItems.iterator().hasNext()){
            item=lineItems.iterator().next();
            if(item.getProductCode().equals(productCode)){
                result=item;
                break;
            }
        }
        return result;
    }

    public double getAmount(){
        double total=0;
        Iterator<LineItem> it=lineItems.iterator();
        while(it.hasNext()){
            total+=it.next().getTotal();
        }
        return total;

    }

    public void removeItem(LineItem item){
        lineItems.remove(item);
    }
    public boolean isSameProduct(String productCode){
        Boolean status=false;
        ArrayList<LineItem> lineItems=getLineItems();
        Iterator<LineItem> it=lineItems.iterator();
       while(it.hasNext()){
            LineItem item=it.next();
            if(item.getProductCode().equals(productCode)){
                status=true;
                break;
            }
            else{
                status=false;
            }
        }
        return status;
    }
}
