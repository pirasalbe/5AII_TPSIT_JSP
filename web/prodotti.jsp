<%-- 
    Document   : index
    Created on : Apr 7, 2017, 9:07:16 AM
    Author     : pirasalbe
--%>

<%-- page --%>
<%@include file="header.jsp" %>

<%-- query --%>
<% ResultSet r = MySql.prodotti(); %>

<div class="container">
		
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
                        <% while(r.next()){ %>
                        <form action="carrello.jsp" method="get">
                            <tr>
                                <td><img src="img/hw.jpg" alt="hw :)"></td>
                                <td><%= r.getInt("cod") %><input type="hidden" name="codice" value="<%= r.getInt("cod") %>"></td>
                                <td><%= r.getString("nome") %></td>
                                <td><%= r.getString("descrizione") %></td>
                                <td><%= r.getFloat("prezzo") %></td>
                                <td><input type="number" name="quantita" value="1" max="100" min="1"></td>
                                <td><input type='submit' class='btn btn-default' value='Inserisci'></td>
                            </tr>
                        </form>
                        <% } %>
                    </tbody>
            </table>
    </div>

</div>

<%@include file="footer.jsp" %>
