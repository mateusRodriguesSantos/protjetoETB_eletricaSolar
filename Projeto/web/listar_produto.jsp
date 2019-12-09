<%-- 
    Document   : listar_funcionario
    Created on : 03/11/2018, 14:10:37
    Author     : Administrador
--%>

<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <script type="text/javascript">
            function excluir(id,nome){
                if(confirm("Tem certeza que deseja excluir o produto: "+nome+"?")){
                    window.open("excluir_produto.do?id="+id,"_parent");
                }
            }
        </script>
        <title>Lista de Produtos</title>
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
        <h1>Lista de Produtos (<a href="form_inserir_produto.jsp"><img src="imagens/novo.png"/></a>)</h1>
        </div>
        <table class="table table-hover table-striped">
            <tr>
                <td>ID</td>
                <td>NOME</td>
                <td>DESCRIÇÃO</td>
                <td>MARCA</td>
                <td style="text-align: center" >QUANTIDADE</br>ESTOQUE</td>
                <td style="text-align: center" >PRECO</br>UNIDADE</td>
                <td>OPÇÕES</td>
            </tr>
            <%
                ArrayList<Produto> lista = new ArrayList<Produto>();
                ProdutoDAO pDAO = new ProdutoDAO();
                try{
                    lista = pDAO.listar();
                }catch(Exception e){
                    out.print("Erro:"+e);
                }
                for (Produto p:lista){
            %>
            <tr>
                <td><%=p.getId() %></td>
                <td><%=p.getNome()%> </td>
                <td><%=p.getDescricao()%></td>
                <td><%=p.getMarca()%> </td>
                <td style="text-align: center"><%=p.getQtdEstoque()%> </td>
                <td style="text-align: center"><%=p.getPreco_un()%></td>
                <td><a href="form_alterar_produto.jsp?id=<%=p.getId() %>"><img src="imagens/alterar.png"/></a> <a href="#" onclick="excluir(<%=p.getId() %>,'<%=p.getNome() %>')"><img src="imagens/excluir.png"/></a></td>
            </tr>
            <%
                }
            %>
        </table>

        </div>
        </div>  
    </body>
</html>
