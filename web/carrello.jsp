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
    
    String codice = request.getParameter("codice"), quantita = request.getParameter("quantita");
    int age = 60*60*24*365;
    
    //remove cookie
    if(request.getParameter("delete") != null || quantita!=null && quantita.equals("0"))
        age = 0;
    
    //add cookie
    if(codice!=null && quantita!=null){
        for(Cookie c : cookies)
            if(c.getName().equals(codice)){                
                StringBuilder sb = new StringBuilder();
                sb.append("");
                
                String now = c.getValue();
                if(request.getParameter("update") != null)
                    now = "0";
                sb.append(Integer.parseInt(now) + Integer.parseInt(quantita));
                quantita = sb.toString();
            }
        
        Cookie temp = new Cookie(codice, quantita);
        temp.setMaxAge(age);
        response.addCookie(temp);
        response.sendRedirect("carrello.jsp");
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
                                <th>Gestisci</th>
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
                        <form action="carrello.jsp" method="get">
                            <tr>
                                <td><img src="img/hw.jpg" alt="hw :)"></td>
                                <td><%= c.getName() %><input type="hidden" name="codice" value="<%= c.getName() %>"></td>
                                <td><%= result.nome %></td>
                                <td><%= result.descrizione %></td>
                                <td><%= result.prezzo * Integer.parseInt(c.getValue()) %></td>
                                <td><input type="number" name="quantita" value="<%= c.getValue() %>" max="100" min="0"></td>
                                <td><input type='submit' class='btn btn-default' name="update" value='Aggiorna'><input type='submit' class='btn btn-default' name="delete" value='Elimina'></td>
                            </tr>
                        </form>
                        <% } } %>
                    </tbody>
            </table>
    </div>
    
    <br>
                        
    <a href="submit.jsp" type='submit' class='btn btn-default'>Acquista</a>
    <a href="prodotti.jsp" type='submit' class='btn btn-default'>Continua Navigazione</a>
                        
</div>


<%@include file="footer.jsp" %>
