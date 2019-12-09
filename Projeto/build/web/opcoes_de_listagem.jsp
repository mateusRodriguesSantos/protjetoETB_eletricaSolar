<%-- 
    Document   : opcoesDeListagem
    Created on : 20/11/2018, 11:28:55
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>Opcões de listagem</title>
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
             <h1 class="panel-title">Lista de Vendas (<a href="listar_cliente.jsp"><img src="imagens/novo.png"/></a>)</h1>
        </div>
        </br>
        Opcões de listagem:
        </br>
                <form action="forms_codicionais_listagem.jsp" method="get"> 
                    <input  type="radio" name="op" value="1" required>Listar por data de venda</br>
                    <input  type="radio" name="op" value="2" required>Listar vendas canceladas</br>
                    <input  type="radio" name="op" value="3" required>Listar por nome do cliente</br>
                    <input  type="radio" name="op" value="4" checked required>Listagem normal</br>
                    <input type="submit" class="btn btn-info"  value="Pesquisar"> 
                </form> 
            </div>
        </div>    
    </body>
</html>
