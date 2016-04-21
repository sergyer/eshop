
import eshop.dbAccess.ConnectionPool;
import eshop.dbAccess.Db;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Created by Serg on 15-Nov-15.
 */
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        response.setContentType("text/html");
        ConnectionPool pool=ConnectionPool.getInstance();
        Connection connection=pool.getConnection();
        PreparedStatement ps=null;
        ResultSet rs=null;
        String query="select * from users where username=?";



        try {
            ps=connection.prepareStatement(query);
            ps.setString(1, username);
            rs=ps.executeQuery();
            if(rs.next()){
                if(rs.getString("password").equals(password)){

                    request.getSession().setAttribute
                            ("user",username);
                    request.getSession().setAttribute("Invalid", null);
                    if(request.getSession().getAttribute("checkout")==null){

                        response.sendRedirect("home.jsp");
                    }
                    else{
                        response.sendRedirect("checkout.jsp");
                    }

                } else {
                    response.sendRedirect("login.jsp");
                }
            } else {

                request.getSession().setAttribute("Invalid", "Invalid username or password");
                response.sendRedirect("login.jsp");
            }



        }  catch(Exception e){
            e.printStackTrace();

        }
        finally {
            Db.closePreparedStatement(ps);
            Db.closeResultSet(rs);
            pool.freeConnection(connection);
        }



    }
}
