<%-- 
    Document   : form_inserir_menu
    Created on : 03/11/2018, 00:16:27
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
        <title>Novo Produto</title>
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
             <h1 class="panel-title">Novo Produto</h1>
        </div>
        <div class="container">   
        <form action="inserir_produto.do" method="get">
            <div class="col-3">
            Nome:<input class="form-control"  type="text" name="nome" placeholder="Nome do produto" size="60" required>
            </div>
            <div class="col-3">
            Descricao:<input class="form-control"  type="text" name="descricao" placeholder="Mais informações" size="60" required>
            </div>
            <div class="col-3">
            Marca:<input class="form-control"  type="text" name="marca" placeholder="Marca" size="60" required>
            </div>
            <div class="col-3">
            Quantidade(Estoque):<input class="form-control"  type="text" name="qtdEstoque" placeholder="Quantidade p/estoque" size="60" required>
            </div>
            <div class="col-3">
            Preço(Unidade):<input class="form-control"  type="text" name="preco" placeholder="R$####.##" placeholder="R$####.##" size="60" required>
            </div>
            <br/>
            <input style="position: relative; left: 13px;" class="btn btn-info" type="submit" value="Salvar">
        </form>
        </div>
                </div>
        </div>  
    </body>
</html>
