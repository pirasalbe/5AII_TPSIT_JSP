<%-- 
    Document   : carrello
    Created on : Apr 7, 2017, 10:45:34 AM
    Author     : pirasalbe
--%>

<%@include file="header.jsp" %>
<%@page import="java.util.*" %>


<%-- obtain value --%>
<% 
    String cf = request.getParameter("cf"), indirizzo = request.getParameter("indirizzo"), pagamento = request.getParameter("pagamento");
    
%>

<%-- query --%>
<% 
    ResultSet r = MySql.prodotti(); 

    List<prodotto> results = new ArrayList<>();
    while(r.next()) {
        prodotto temp = new prodotto(r.getInt("cod"), r.getString("nome"), r.getString("descrizione"), r.getFloat("prezzo"));
        results.add(temp);
    }
%>

<%-- Cookie --%>
<% 
    Cookie[] cookies = request.getCookies(); 
    
    if( cf != null && indirizzo != null && pagamento != null){
        out.println(MySql.submitOrder(cf, indirizzo, pagamento, cookies));
        
        for (Cookie cookie : cookies) {
            cookie.setMaxAge(0);

            response.addCookie(cookie);
        }
        response.sendRedirect("ordini.jsp");
    }
%>

<div class="container">
    <p class="h1">Ordini</p>

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
                        <form action="carrello.jsp" method="get">
                            <tr>
                                <td><img src="img/hw.jpg" alt="hw :)"></td>
                                <td>ciao</td>
                                <td>ciao</td>
                                <td>ciao</td>
                                <td>ciao</td>
                                <td>ciao</td>
                                <td><input type='submit' class='btn btn-default' name="delete" value='Elimina'></td>
                            </tr>
                        </form>
                    </tbody>
            </table>
    </div>        
        
</div>


<%@include file="footer.jsp" %>
