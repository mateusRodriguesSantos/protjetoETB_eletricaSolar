<%-- 
    Document   : listar_funcionario
    Created on : 03/11/2018, 14:10:37
    Author     : Administrador
--%>

<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <script type="text/javascript">
            function excluir(id,nome){
                if(confirm("Tem certeza que deseja excluir o cliente: "+nome+"?")){
                    window.open("excluir_cliente.do?id="+id,"_parent");
                }
            }
        </script>
        <title>Lista de Clientes</title>
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
        <h1 class="panel-title">Lista de Clientes (<a href="form_inserir_cliente.jsp"><img src="imagens/novo.png"/></a>)</h1>
        </div>
        <table class="table table-hover table-striped">
            <tr>
                <td>ID</td>
                <td>NOME</td>
                <td>CPF</td>
                <td>TELEFONE</td>
                <td>ENDEREÇO</td>
                <td>OPÇÕES</td>
            </tr>
            <%
                ArrayList<Cliente> lista = new ArrayList<Cliente>();
                ClienteDAO cDAO = new ClienteDAO();
                try{
                    lista = cDAO.listar();
                }catch(Exception e){
                    out.print("Erro:"+e);
                }
                for (Cliente c:lista){
            %>
            <tr>
                <td><%=c.getId() %></td>
                <td><%=c.getNome()%> </td>
                <td><%=c.getCpf() %></td>
                <td><%=c.getTelefone() %> </td>
                <td><%=c.getEndereco() %> </td>
                <td><a href="form_alterar_cliente.jsp?id=<%=c.getId() %>"><img src="imagens/alterar.png"/></a> <a href="#" onclick="excluir(<%=c.getId() %>,'<%=c.getNome() %>')"><img src="imagens/excluir.png"/></a> <a href="form_catalogo_venda.jsp?id=<%=c.getId() %>&nova=sim"><img src="imagens/carrinho.png"/></a></td>
            </tr>
            <%
                }
            %>
        </table>
                </div>
        </div>  
    </body>
</html>
