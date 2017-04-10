<%-- 
    Document   : carrello
    Created on : Apr 7, 2017, 10:45:34 AM
    Author     : pirasalbe
--%>

<%@include file="header.jsp" %>
<%@page import="java.util.*" %>

<%-- query --%>
<% ResultSet r = MySql.prodotti(); 

    List<prodotto> results = new ArrayList<>();
    while(r.next()) {
        prodotto temp = new prodotto(r.getInt("cod"), r.getString("nome"), r.getString("descrizione"), r.getFloat("prezzo"));
        results.add(temp);
    }
%>

<%-- Cookie --%>
<% 
    Cookie[] cookies = request.getCookies(); 
    
    //int cod = Integer.parseInt(request.getParameter("codice"));
    //int amount = Integer.parseInt(request.getParameter("quantita"));
    
    String codice = request.getParameter("codice"), quantita= request.getParameter("quantita");
    
    //add cookie
    if(codice!=null&&quantita!=null){
        Cookie temp = new Cookie(codice, quantita);
        temp.setMaxAge(60*60*24*365);
        response.addCookie(temp);
        out.println("<meta http-equiv='refresh' content='1'>"); //todo test
    }
%>

<div class="container">
    <p class="h1">Carrello</p>

    <div class="table-responsive">          
            <table class="table">
                    <thead>
                            <tr>
                                <th>Immagine</th>
                                <th>Codice</th>
                                <th>Nome</th>
                                <th>Descrizione</th>
                                <th>Prezzo</th>
                                <th>Quantità</th>
                                <th>Inserimento</th>
                            </tr>
                    </thead>

                    <tbody>
                        <% for(Cookie c : cookies){ 
                            prodotto result = null;
                            
                            for(prodotto p : results) {
                                try{
                                    if(Integer.parseInt(c.getName()) == p.cod)
                                        result = p;
                                } catch(Exception e){
                                    System.out.println(":)");
                                }
                            }
                                
                            if(result != null) {
                        %>
                        <form action="carrello.jsp?codice=<%= c.getName() %>" method="get">
                            <tr>
                                <td><img src="img/hw.jpg" alt="hw :)"></td>
                                <td><%= c.getName() %></td>
                                <td><%= result.nome %></td>
                                <td><%= result.descrizione %></td>
                                <td><%= result.prezzo * Integer.parseInt(c.getValue()) %></td>
                                <td><%= c.getValue() %></td>
                                <td><input type='submit' class='btn btn-default' value='Elimina'></td>
                            </tr>
                        </form>
                        <% } } %>
                    </tbody>
            </table>
    </div>
                    
</div>


<%@include file="footer.jsp" %>
