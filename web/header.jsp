<%-- 
    Document   : header
    Created on : Apr 7, 2017, 9:06:55 AM
    Author     : pirasalbe
--%>

<%-- librerie --%>
<%@page import="java.sql.ResultSet" %>
<%@page import="javax.servlet.http.Cookie" %>
<%@page import="Jamazon.MySql " %>
<%@page import="Jamazon.ordine"%>
<%@page import="Jamazon.prodotto " %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amazon povero</title>
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
        <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>
    </head>
    <body>
        <!--- header --->
            <nav class='navbar navbar-default'>
                    <div class='container-fluid'>
                            <div class='navbar-header'>
                                    <a class='navbar-brand' href='index.jsp'>Amazon povero</a>
                            </div>
                            <ul class='nav navbar-nav'>
                                    <li class='dropdown'>
                                        <li><a href='ordini.jsp'>Ordini</a></li>
                                        <li><a href='prodotti.jsp'>Catalogo</a></li>
                                        <li><a href='carrello.jsp'>Carrello</a></li>
                                    </li>
                            </ul>
                    </div>
            </nav>
