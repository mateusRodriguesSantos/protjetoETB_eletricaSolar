<%-- 
    Document   : sair
    Created on : 10/11/2018, 18:30:36
    Author     : Administrador
--%>

<%
    session.removeAttribute("funcionario");
    response.sendRedirect("login.jsp");
%>
