<%-- 
    Document   : form_alterar_menu
    Created on : 03/11/2018, 01:07:14
    Author     : Administrador
--%>

<%@page import="modelo.MenuDAO"%>
<%@page import="modelo.Menu"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    Menu m = new Menu();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        MenuDAO mDAO = new MenuDAO();
        m = mDAO.carregarPorId(id);
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <script type="text/javascript" src="MascaraJS-master/mascara.min.js"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>Alterar Menu</title>
        <style>
            body {
                background-image: url(imagens/eletrica_fundo.jpg);
            }
        </style>
    </head>
    <body>
        <div class="container">
        <%@include file="menu.jsp" %>
        <div class="panel panel-default">
        <div class="panel-heading">
        <h1 class="panel-title">Alterando Menu</h1>
        </div>
        <form action="alterar_menu.do" method="post">
            <div class="container">    
                <p>ID:<%=m.getId() %></p>
                <input type="hidden" name="id" value="<%=m.getId() %>"/>
                <div class="col-3">
                    Titulo:<input class="form-control"  type="text" value="<%=m.getTitulo() %>" name="titulo" placeholder="Nome e sobrenome" size="60" required>
                </div>
                <div  class="col-3">
                    Link:<input class="form-control" type="text" name="link" value="<%=m.getLink() %>" size="60" placeholder="Mais informações"  required>
                </div>
                <div  class="col-5" >
                    Ícone:<input class="form-control" type="icone" value="<%=m.getIcone() %>"  name="endereco" placeholder="[imagen].png" size="60" required>       
                </div>  
                <br/>
                <input style="position: relative; left: 13px;"  class="btn btn-info" type="submit" value="Salvar"/>
            </div>
        </form>
        </div>
        </div>    
    </body>
</html>
