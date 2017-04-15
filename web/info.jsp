<%-- 
    Document   : carrello
    Created on : Apr 7, 2017, 10:45:34 AM
    Author     : pirasalbe
--%>

<%@include file="header.jsp" %>
<%@page import="java.util.*" %>

<%-- obtain value --%>
<% 
    String cod = request.getParameter("cod");
    int codice = Integer.parseInt(cod);
    
%>

<%-- query --%>
<% ResultSet r = MySql.ordini(); 

    ordine o = null;
    prodotto pr = null;
    while(r.next()) {
        if(r.getInt("o.cod")==codice){
            if(o == null){
                o = new ordine(codice, r.getString("codFiscale"), r.getString("indirizzo"), r.getString("pagamento"), r.getDate("data"));
            }
            
            pr = new prodotto(r.getInt("p.cod"), r.getString("p.nome"), r.getString("p.descrizione"), r.getFloat("p.prezzo"));
            pr.quantita = r.getInt("d.quantita");
            
            o.prodotti.add(pr);
        }
    }
%>

<div class="container">
    <p class="h1">Informazioni</p><br>

    <div class="row form-group">
        <div class="col-sm-2">
            <label for="">Codice: </label>
        </div>
        <div class="col-sm-4">
            <%= cod %>
        </div>
        <div class="col-sm-2">
            <label for="">Data: </label>
        </div>
        <div class="col-sm-4">
            <%= o.data %>
        </div>
    </div>     
    <div class="row form-group">
        <div class="col-sm-2">
            <label for="">Indirizzo: </label>
        </div>
        <div class="col-sm-4">
            <%= o.indirizzo %>
        </div>
        <div class="col-sm-2">
            <label for="">Pagamento: </label>
        </div>
        <div class="col-sm-4">
            <%= o.pagamento %>
        </div>
    </div>       
    <div class="row form-group">
        <div class="col-sm-2">
            <label for="">Codice Fiscale: </label>
        </div>
        <div class="col-sm-4">
            <%= o.cf %>
        </div>
        <div class="col-sm-2">
            <label for="">Prezzo totale: </label>
        </div>
        <div class="col-sm-4">
            <% 
            float prezzo = 0;
            
            for(prodotto p : o.prodotti) {
                prezzo += p.prezzo;
            }
            
            out.println(prezzo);
            %>
        </div>
    </div>   
        
    <hr><p class="h2">Prodotti</p><br>
        
    <% for(prodotto p : o.prodotti) { %>
    
    <div class="row form-group">
        <div class="col-sm-2">
            <label for="">Prodotto: </label>
        </div>
        <div class="col-sm-2">
            <%= p.cod %>
        </div>
        <div class="col-sm-2">
            <label for="">Quantita: </label>
        </div>
        <div class="col-sm-2">
            <%= p.cod %>
        </div>
        <div class="col-sm-2">
            <label for="">Nome: </label>
        </div>
        <div class="col-sm-2">
            <%= p.nome %>
        </div>
    </div>     
    <div class="row form-group">
        <div class="col-sm-2">
            <label for="">Descrizione: </label>
        </div>
        <div class="col-sm-4">
            <%= p.descrizione %>
        </div>
        <div class="col-sm-2">
            <label for="">Prezzo al pezzo: </label>
        </div>
        <div class="col-sm-4">
            <%= p.prezzo %>
        </div>
    </div>     
        
    <br>
    <br>
        
    <% } %>
        
    
    <hr>
    
    
    <a href="ordini.jsp" type='submit' class='btn btn-default'>Torna indietro</a>
    <a href="ordini.jsp?cod=<%= cod %>" type='submit' class='btn btn-default'>Elimina elemento</a>
</div>


<%@include file="footer.jsp" %>
