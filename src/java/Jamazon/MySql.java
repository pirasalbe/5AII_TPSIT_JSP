package Jamazon;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Cookie;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

public class MySql {
    
    private static String server = "jdbc:mysql://localhost:3306/amazon";
    private static String user = "root";
    private static String pass = "";
    
    public static ResultSet prodotti(){
        String query = "select * "
                    + "from prodotto p ";

        Connection c = null;
        Statement s = null;
        ResultSet r = null;

        try{
            Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection(server, user, pass);
            s = c.createStatement();

            //query
            r = s.executeQuery(query);
        } catch(ClassNotFoundException | SQLException e){
            System.out.println(e); //for debug purpose
        }
           
        return r;
    }
    
    public static String submitOrder(String cf, String indirizzo, String pagamento, Cookie[] prodotti){
        java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
        
        String query = "insert into ordine (codFiscale, indirizzo, data, pagamento)"
                + " values (?,?,?,?)";

        Connection c = null;
        PreparedStatement s = null;
        ResultSet r = null;

        try{
            Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection(server, user, pass);
            
            //query
            s = c.prepareStatement(query);
            
            s.setString(1, cf);
            s.setString(2, indirizzo);
            s.setDate(3, date);
            s.setString(4, pagamento);
            
            s.executeUpdate();
            
            //obtain cod
            query = "select cod from ordine where codFiscale=? and data=? and indirizzo=?";
            
            s = c.prepareStatement(query);
            
            s.setString(1, cf);
            s.setDate(2, date);
            s.setString(3, indirizzo);
            
            r = s.executeQuery();
            
            int cod = -1;
            if(r.next()) {
                cod = r.getInt("cod");
            }
            
            //get products
            if(cod != -1)
                for (Cookie p : prodotti){
                    query = "insert into dettagli (ordine, prodotto, quantita)"
                            + " values (?,?,?)";
                    
                    s = c.prepareStatement(query);
                    
                    s.setInt(1, cod);
                    
                    try{
                        s.setInt(2, Integer.parseInt(p.getName()));
                        s.setInt(3, Integer.parseInt(p.getValue()));
                    } catch (Exception e) { 
                        continue;
                    }
                    
                    s.executeUpdate();
                }      
            
        } catch(ClassNotFoundException | SQLException e){
            return e.getMessage(); //for debug purpose
        }
        
        return "";
    }
}
