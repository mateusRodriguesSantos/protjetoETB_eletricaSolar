<%-- 
    Document   : form_alterar_perfil
    Created on : 02/11/2018, 19:42:59
    Author     : Administrador
--%>

<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    Perfil p = new Perfil();
    
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        PerfilDAO pDAO = new PerfilDAO();
        p = pDAO.carregarPorId(id);
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
        <title>Alterar Perfil</title>
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
             <h1 class="panel-title">Alterando Perfil</h1>
        </div>
        <form action="alterar_perfil.do" method="post">
            <div class="container">    
                <p>ID:<%=p.getId() %></p>
                <input type="hidden" name="id" value="<%=p.getId() %>"/>
                <div class="col-3">
                    Nome:<input class="form-control"  type="titulo" value="<%=p.getNome() %>" name="nome" placeholder="Nome" size="60" required>
                </div>
                <div  class="col-3">
                    Descrição<input class="form-control" type="text" name="descricao" value="<%=p.getDescricao() %>" size="60" placeholder="Mais informações"  required>
                </div>
                <br/>
                <input style="position: relative; left: 13px;"  class="btn btn-info" type="submit" value="Salvar"/>
            </div>
        </form>
        </div>
        </div>  
    </body>
</html>
