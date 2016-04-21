package eshop.dbAccess;

import eshop.business.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by Serg on 18-Nov-15.
 */
public class DbUser {
    public static void insert(User user){
        String username=user.getUserName();
        String password=user.getPassword();
        String email=user.getEmail();
        int creditCardNum=user.getCreditCardNumber();
        ConnectionPool pool=ConnectionPool.getInstance();
        Connection connection=pool.getConnection();
        PreparedStatement ps=null;
        String query="Insert into Users (username,password,email,creditcardnum) values (?,?,?,?)";

        try {


            ps=connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setInt(4, creditCardNum);
            ps.executeUpdate();
        }

        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            Db.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

    }





    public static boolean checkEmail(String email){

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT email FROM users WHERE email = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            return rs.next();

        }
        catch (Exception e) {
            System.out.println(e);
            return false;
        }

        finally {
            Db.closeResultSet(rs);
            Db.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }





}
