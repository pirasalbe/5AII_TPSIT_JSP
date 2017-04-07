package Jamazon;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


public class MySql {
    public static ResultSet prodotti(){
        String query = "select * "
                    + "from prodotto p ";

        Connection c = null;
        Statement s = null;
        ResultSet r = null;

        try{
            Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/amazon", "root","");
            s = c.createStatement();

            //query
            r = s.executeQuery(query);
        } catch(ClassNotFoundException | SQLException e){
            System.out.println(e); //for debug purpose
        }
           
        return r;
    }
}
