<%-- 
    Document   : menu
    Created on : 10/11/2018, 17:55:41
    Author     : Administrador
--%>

<%@page import="modelo.Menu"%>
<%@page import="modelo.Funcionario"%>
<!DOCTYPE html>
<div class="container">
<div class="img" align="center"><img src="imagens/banner.jpg" /></div><br/>  
</div>
<div class="container">
<nav class="navbar navbar-default">
<% 
         
    try{
        Funcionario fLogado = (Funcionario) session.getAttribute("funcionario");
        if(fLogado.getSituacao().equals("ativo")){
        %>
        <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp"><img src="imagens/home.png"></a> 
        </div>
            <%
                for(Menu mu:fLogado.getPerfil().getMeusMenus()){
            %>
                    <a class="navbar-link"  class="btn btn-info" href="<%=mu.getLink()%>"><%=mu.getTitulo()%></a>  
            <%
                }
        
        }       
    %>
    <%
        if(fLogado.getSituacao().equals("inativo") || !(fLogado.getSituacao().equals("ativo"))){
            %>
             
            <script type="text/javascript">
                window.location.href = "indesejado.jsp";
            </script>    
            
            <%
        }
    %>
   <a class="navbar-link"   href="sair.jsp">Sair</a>
          
</div>        
<%
    }catch(Exception e){
        response.sendRedirect("login.jsp");
    }
%>
