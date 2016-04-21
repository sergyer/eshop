
import eshop.dbAccess.ConnectionPool;
import eshop.dbAccess.Db;
import eshop.dbAccess.DbUser;

import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 * Created by Serg on 12-Nov-15.
 */
public class Registration extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email=request.getParameter("email");
        response.setContentType("text/html");
        ConnectionPool pool=ConnectionPool.getInstance();
        Connection connection=pool.getConnection();
        PreparedStatement ps=null;
        String query="insert into users (username,password,email) " +
                "VALUES (?,?,?) ";
        HttpSession session=request.getSession();
        Boolean emailIsBusy= DbUser.checkEmail(email);



        if(!emailIsBusy){
            try {

                ps= connection.prepareStatement(query);
                ps.setString(1, username);
                ps.setString(2, password);
                ps.setString(3, email);
                int i=ps.executeUpdate();
                if(i>0){
                    session.setAttribute("user",username);
                    session.setAttribute("busyusername",null);
                    session.setAttribute("busyemail",null);
                    response.sendRedirect("home.jsp");
                }




            }  catch(Exception e){
                e.printStackTrace();
                session.setAttribute("busyusername","Oops! Someone already has that username...");
                response.sendRedirect("signup.jsp");


            }
            finally {
                Db.closePreparedStatement(ps);
                pool.freeConnection(connection);
            }

        }

        else {
            session.setAttribute("busyemail","This Email already exist");
            response.sendRedirect("signup.jsp");
        }




    }
}
