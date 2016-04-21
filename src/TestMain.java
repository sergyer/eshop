import eshop.dbAccess.ConnectionPool;

import java.sql.Connection;

/**
 * Created by Serg on 15-Nov-15.
 */
public class TestMain {
    public static void main(String[] args) {
       ConnectionPool pool=ConnectionPool.getInstance();
        Connection connection=pool.getConnection();

    }
}