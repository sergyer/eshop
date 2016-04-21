import eshop.business.LineItem;
import eshop.business.Product;
import eshop.business.ShoppingCart;
import eshop.dbAccess.dbProduct;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * Created by Serg on 23-Nov-15.
 */
public class ShowCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productCode=request.getParameter("code");
        HttpSession session=request.getSession();
        ShoppingCart cart=(ShoppingCart)session.getAttribute("cart");
        int defaultQuantity=1;





        if(cart==null){
            cart=new ShoppingCart();
            session.setAttribute("cart",cart);
        }


        Product product = dbProduct.selectProduct(productCode);
        if(product!=null){
            if(cart.isSameProduct(productCode)) {
               cart.getLineItem(productCode).addQuanity();
            }
            else {
                LineItem lineItem =new LineItem();
                lineItem.setProduct(product);
                lineItem.setQuantity(defaultQuantity);
                cart.addItem(lineItem);
                }



        }
        session.setAttribute("cart",cart);

        RequestDispatcher view =request.getRequestDispatcher("shoppingcart.jsp");
        view.forward(request,response);



    }
}
