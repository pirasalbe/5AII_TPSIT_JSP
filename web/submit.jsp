<%-- 
    Document   : carrello
    Created on : Apr 7, 2017, 10:45:34 AM
    Author     : pirasalbe
--%>

<%@include file="header.jsp" %>

<div class="container">
    <p class="h1">Inserimento dati</p><br>

    <form action="ordini.jsp">
        <div class="row form-group">
            <div class="col-sm-2">
                <label for="cf">Codice Fiscale: </label>
            </div>
            <div class="col-sm-4">
                <input name="cf" class="form-control" maxlength="20">
            </div>
            <div class="col-sm-2">
                <label for="indirizzo">Indirizzo: </label>
            </div>
            <div class="col-sm-4">
                <input name="indirizzo" class="form-control" maxlength="20">
            </div>
        </div>
        <div class="row form-group">
            <div class="col-sm-2">
                <label for="pagamento">Pagamento: </label>
            </div>
            <div class="col-sm-4">
                <select name="pagamento" class="form-control">
                    <option value="paypal">Paypal</option>
                    <option value="carta">Carta</option>
                    <option value="contanti">Contanti</option>
                </select>
            </div>
        </div>
        <br>
        <div class="row form-group">
            <div class="col-sm-4">
                <button type="submit" class="form-control">
                    Procedi
                </button>
            </div>
        </div>
    </form>
        
</div>


<%@include file="footer.jsp" %>
