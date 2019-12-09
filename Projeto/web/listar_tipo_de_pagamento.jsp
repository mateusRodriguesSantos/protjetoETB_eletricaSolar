<%-- 
    Document   : listar_funcionario
    Created on : 03/11/2018, 14:10:37
    Author     : Administrador
--%>

<%@page import="modelo.TipoDePagamentoDAO"%>
<%@page import="modelo.TipoDePagamento"%>
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
                if(confirm("Tem certeza que deseja excluir o tipo: "+nome+"?")){
                    window.open("excluir_tipo_de_pagamento.do?id="+id,"_parent");
                }
            }
        </script>
        <title>Tipos de pagamento</title>
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
             <h1 class="panel-title">Tipos de pagamento (<a href="form_inserir_tipo_de_pagamento.jsp"><img src="imagens/novo.png"/></a>)</h1>
        </div>
        <table class="table table-hover table-striped">
            <tr>
                <td>ID</td>
                <td>NOME</td>
                <td>DESCRIÇÃO</td>
                <td>ICONE</td>
                <td>OPÇÕES</td>
            </tr>
            <%
                ArrayList<TipoDePagamento> lista = new ArrayList<TipoDePagamento>();
                TipoDePagamentoDAO tpDAO = new TipoDePagamentoDAO();
                try{
                    lista = tpDAO.listar();
                }catch(Exception e){
                    out.print("Erro:"+e);
                }
                for (TipoDePagamento tp:lista){
            %>
            <tr>
                <td><%=tp.getId() %></td>
                <td><%=tp.getNome()%> </td>
                <td><%=tp.getDescricao()%></td>
                <td><img src="imagens/<%=tp.getIcone()%>"></td>
                <td><a href="form_alterar_tipo_de_pagamento.jsp?id=<%=tp.getId() %>"><img src="imagens/alterar.png"/></a> <a href="#" onclick="excluir(<%=tp.getId() %>,'<%=tp.getNome() %>')"><img src="imagens/excluir.png"/></a></td>
            </tr>
            <%
                }
            %>
        </table>
                </div>
        </div>  
    </body>
</html>
