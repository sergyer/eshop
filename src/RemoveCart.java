import eshop.business.LineItem;
import eshop.business.ShoppingCart;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;
import java.io.IOException;
import java.util.Iterator;

/**
 * Created by Serg on 25-Nov-15.
 */
public class RemoveCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code=request.getParameter("productCode");
        ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");

        Iterator<LineItem> it = cart.getLineItems().iterator();
        LineItem lineItem, res=null;
        while (it.hasNext()) {
            lineItem = it.next();
            if (lineItem.getProductCode().equals(code)) {
                res=lineItem;
            }

        }
        cart.removeItem(res);

        RequestDispatcher view =request.getRequestDispatcher("shoppingcart.jsp");
        view.forward(request,response);

    }
}
