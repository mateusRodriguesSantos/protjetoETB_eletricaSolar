<%-- 
    Document   : form_alterar_menu
    Created on : 03/11/2018, 01:07:14
    Author     : Administrador
--%>

<%@page import="modelo.TipoDePagamentoDAO"%>
<%@page import="modelo.TipoDePagamento"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <script type="text/javascript" src="MascaraJS-master/mascara.min.js"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>Inserir Tipo de pagamento</title>
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
             <h1 class="panel-title">Inserir Tipo de pagamento</h1>
        </div>
        <div class="container">       
        <form action="inserir_tipo_de_pagamento.do" method="post">
            <div class="col-3">
            Nome:<input class="form-control"  type="text" name="nome" placeholder="Cartão..." size="60" required>
            </div>
            <div class="col-3">
            Descricao:<input class="form-control"  type="text" name="descricao" placeholder="Mais informações" size="60" required>
            </div>
            <div class="col-3">
            Ícone:<input class="form-control"  type="text" name="marca" placeholder="[imagem].png" size="60">
            </div>
            <br/>
            <input style="position: relative; left: 13px;" class="btn btn-info"  type="submit" value="Salvar"/>
        </form>
        </div>
        </div> 
        </div>    
    </body>
</html>
