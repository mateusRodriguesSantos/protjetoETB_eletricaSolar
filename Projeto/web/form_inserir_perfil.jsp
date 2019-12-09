<%-- 
    Document   : form_inserir_perfil
    Created on : 02/11/2018, 18:30:09
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <script type="text/javascript" src="MascaraJS-master/mascara.min.js"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>Insesrir Perfil</title>
        <style>
            body {
                background-image: url(imagens/eletrica_fundo.jpg);
            }
        </style>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="container">
                    <div class="panel panel-default">
        <div class="panel-heading">
             <h1 class="panel-title">Novo Perfil</h1>
        </div>
        <div class="container">                
        <form action="inserir_perfil.do" method="post">
            <div class="col-3">
                Nome:<input class="form-control"  type="text" name="nome" placeholder="Nome do perfil" size="60" required>
            </div>
            <div class="col-3">
                Descricao:<input class="form-control"  type="text" name="descricao" placeholder="O que faz?" size="60" required>
            </div>
            <br/>
            <input style="position: relative; left: 13px;" type="submit" class="btn btn-info" type="submit" value="Salvar">
        </form>
        </div>
                </div>
        </div>  
    </body>
</html>
