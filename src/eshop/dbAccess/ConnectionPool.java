package eshop.dbAccess;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by Serg on 27-Nov-15.
 */
public class ConnectionPool {
    private static ConnectionPool pool=null;
    private static DataSource dataSource=null;

    private ConnectionPool(){
        try{
            InitialContext ic=new InitialContext();
            dataSource= (DataSource) ic.lookup("java:/comp/env/jdbc/eshop");
        }
        catch (NamingException e){
            System.out.print(e);
        }
    }

    public static ConnectionPool getInstance(){
        if(pool==null){
            pool=new ConnectionPool();
        }
        return pool;
    }

    public Connection getConnection(){
        try {
            return dataSource.getConnection();
        }
        catch (SQLException e){
            System.err.print(e);
            return null;
        }
    }
    public void freeConnection(Connection c){
        try {
            c.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }
}
