<%-- 
    Document   : carrello
    Created on : Apr 7, 2017, 10:45:34 AM
    Author     : pirasalbe
--%>

<%@include file="header.jsp" %>

<%-- query --%>
<% ResultSet r = MySql.prodotti(); %>

<%-- Cookie --%>
<% 
    Cookie[] cookies = request.getCookies(); 
    
    //int cod = Integer.parseInt(request.getParameter("codice"));
    //int amount = Integer.parseInt(request.getParameter("quantita"));
    
    //add cookie
    Cookie temp = new Cookie(request.getParameter("codice"), request.getParameter("quantita"));
    temp.setMaxAge(60*60*24*365);
    response.addCookie(temp);
%>




<%@include file="footer.jsp" %>
