import eshop.business.LineItem;
import eshop.business.ShoppingCart;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;

/**
 * Created by Serg on 25-Nov-15.
 */
public class UpdateCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String originQuantity = request.getParameter("quantity");
        int quantity = Integer.valueOf(originQuantity);
        String code = request.getParameter("code");
        ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");


        Iterator<LineItem> it = cart.getLineItems().iterator();
        LineItem lineItem;
        while (it.hasNext()) {
            lineItem = it.next();
            if (lineItem.getProduct().getCode().equals(code)) {
                lineItem.setQuantity(quantity);
            }

        }

        RequestDispatcher view =request.getRequestDispatcher("shoppingcart.jsp");
        view.forward(request,response);
    }
}