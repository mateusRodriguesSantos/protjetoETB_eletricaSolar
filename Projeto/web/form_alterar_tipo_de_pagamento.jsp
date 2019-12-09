<%-- 
    Document   : form_alterar_menu
    Created on : 03/11/2018, 01:07:14
    Author     : Administrador
--%>

<%@page import="modelo.TipoDePagamentoDAO"%>
<%@page import="modelo.TipoDePagamento"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    TipoDePagamento tp = new TipoDePagamento();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        TipoDePagamentoDAO tpDAO = new TipoDePagamentoDAO();
        tp = tpDAO.carregarPorId(id);
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
        <title>Alterar Tipo de pagamento</title>
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
             <h1 class="panel-title">Alterar Tipo de pagamento</h1>
        </div>
        <form action="alterar_tipo_de_pagamento.do" method="post">
            <div class="container">    
                <p>ID:<%=tp.getId() %></p>
                <input type="hidden" name="id" value="<%=tp.getId() %>"/>
                <div class="col-3">
                    Nome:<input class="form-control"  type="titulo" value="<%=tp.getNome() %>" name="nome" placeholder="Nome e sobrenome" size="60" required>
                </div>
                <div  class="col-3">
                    descricao:<input class="form-control" type="text" name="descricao" value="<%=tp.getDescricao() %>" size="60" placeholder="Mais informações" required>
                </div>
                <div  class="col-5" >
                    Ícone:<input class="form-control" type="icone" value="<%=tp.getIcone() %>"  name="endereco" placeholder="[imagen].png" size="60">       
                </div>  
                <br/>
                <input style="position: relative; left: 13px;"  class="btn btn-info" type="submit" value="Salvar"/>
            </div>
        </form>
                    </div>
        </div>  
    </body>
</html>
