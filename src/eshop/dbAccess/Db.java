package eshop.dbAccess;

import java.sql.*;

/**
 * Created by Serg on 27-Nov-15.
 */
public class Db {
    public static void closePreparedStatement(PreparedStatement ps){
       try {
           if(ps!=null){
               ps.close();
           }
       }catch (SQLException e){
           e.printStackTrace();
       }
    }

    public static void closeResultSet(ResultSet rs){
        try {
            if(rs!=null){
                rs.close();
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
