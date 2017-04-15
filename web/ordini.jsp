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
    
    if(request.getParameter("cod")!=null)
        MySql.elimina(Integer.parseInt(request.getParameter("cod")));
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
                                <th>Codice</th>
                                <th>Codice Fiscale</th>
                                <th>Indirizzo</th>
                                <th>Data</th>
                                <th>Pagamento</th>
                                <th>Info</th>
                            </tr>
                    </thead>
                        
                    <tbody>
                        <% 
                            ResultSet r = MySql.ordini();

                            int cod = -1;
                            while(r.next()) {
                                if(r.getInt("o.cod")!=cod) {
                                    cod = r.getInt("o.cod");
                        %>
                        <tr>
                            <td><%= r.getInt("o.cod") %></td>
                            <td><%= r.getString("codFiscale") %></td>
                            <td><%= r.getString("indirizzo") %></td>
                            <td><%= r.getDate("data") %></td>
                            <td><%= r.getString("pagamento") %></td>
                            <td><a href="info.jsp?cod=<%= r.getInt("o.cod") %>" type='submit' class='btn btn-default'>Informazioni</a></td>
                        </tr>
                        <% } } %>
                    </tbody>
            </table>
    </div>        
        
</div>


<%@include file="footer.jsp" %>
