package eshop.dbAccess;


import eshop.business.Product;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Serg on 17-Nov-15.
 */
public class dbProduct {
    public static Product selectProduct(String productCode){
        ConnectionPool pool= ConnectionPool.getInstance();
        Connection connection=pool.getConnection();
        PreparedStatement ps=null;
        ResultSet rs=null;
        String query = "select * from Product where code= ?";

        try {


            ps= connection.prepareStatement(query);
            ps.setString(1, productCode);
            rs=ps.executeQuery();
            if(rs.next()){
                Product product=new Product();
                product.setCode(rs.getString("code"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                return product;
            }else
            {
                return null;
            }




        }

        catch (Exception e){
            e.printStackTrace();
            return null;
        }
        finally {
            Db.closeResultSet(rs);
            Db.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }


    }




    public static ArrayList<Product> selectProducts(){

        ConnectionPool pool= ConnectionPool.getInstance();
        Connection connection=pool.getConnection();
        PreparedStatement ps=null;
        ResultSet rs=null;
        String query = "select * from Product";

        try {
            ArrayList<Product> products=new ArrayList<>();
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                Product p=new Product();
                p.setCode(rs.getString("code"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                products.add(p);
            }
            return products;




        } catch (Exception e){
            e.printStackTrace();
            return null;
        }


        finally {
            Db.closeResultSet(rs);
            Db.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }



    }


}
