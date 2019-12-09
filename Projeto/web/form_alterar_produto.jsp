<%-- 
    Document   : form_alterar_menu
    Created on : 03/11/2018, 01:07:14
    Author     : Administrador
--%>

<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    Produto p = new Produto();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        ProdutoDAO pDAO = new ProdutoDAO();
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
        <title>Alterar Produto</title>
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
             <h1 class="panel-title">Alterando Produto</h1>
        </div>
        <form action="alterar_produto.do" method="post">
            <p>ID:<%=p.getId() %></p>
                <input type="hidden" name="id" value="<%=p.getId() %>"/>
            <div class="col-3">
                Nome:<input class="form-control"  type="titulo" value="<%=p.getNome() %>" name="nome" placeholder="Nome e sobrenome" size="60" required>
            </div>
            <div  class="col-3">
                Descrição:<input class="form-control" type="text" name="descricao" value="<%=p.getDescricao() %>" size="60" placeholder="Mais informações" required>
            </div>
            <div  class="col-3">
                Marca:<input class="form-control" type="text" name="marca" value="<%=p.getMarca()%>" size="60" placeholder="marca"  required>
            </div>
            <div  class="col-3">
                Quantidade(Estoque):<input class="form-control" type="text" name="qtdEstoque" value="<%=p.getQtdEstoque()%>" size="60" placeholder="Quantidade p/estoque" required>
            </div>
            <div  class="col-3">
                Preço(Unidade):<input class="form-control" type="text" name="preco" value="<%=p.getPreco_un() %>" size="60" placeholder="Preço unitário"  required>
            </div>
            <br/>
            <input style="position: relative; left: 13px;"  class="btn btn-info" type="submit" value="Salvar"/>
        </form>
           </div>
        </div>  
    </body>
</html>
