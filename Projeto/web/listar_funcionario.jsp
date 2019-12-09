<%-- 
    Document   : listar_funcionario
    Created on : 03/11/2018, 14:10:37
    Author     : Administrador
--%>

<%@page import="modelo.FuncionarioDAO"%>
<%@page import="modelo.Funcionario"%>
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
                if(confirm("Tem certeza que deseja excluir o funcionário: "+nome+"?")){
                    window.open("excluir_funcionario.do?id="+id,"_parent");
                }
            }
        </script>
        <title>Lista de Funcionários</title>
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
             <h1 class="panel-title">Lista de Funcionários (<a href="form_inserir_funcionario.jsp"><img src="imagens/novo.png"/></a>)</h1>
        </div>
        <table class="table table-hover table-striped">
            <tr>
                <td>ID</td>
                <td>NOME</td>
                <td>PERFIL</td>
                <td>SITUAÇÃO</td>
                <td>OPÇÕES</td>
            </tr>
            <%
                ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
                FuncionarioDAO fDAO = new FuncionarioDAO();
                try{
                    lista = fDAO.listar();
                }catch(Exception e){
                    out.print("Erro:"+e);
                }
                for (Funcionario f:lista){
            %>
            <tr>
                <td><%=f.getId() %></td>
                <td><%=f.getNome()%> </td>
                <td><%=f.getPerfil().getNome()%></td> 
                <td<% if(f.getSituacao().equals("ativo")){ %> class="alert alert-success" <% }else{%> class="alert alert-danger" <% } %>><%=f.getSituacao()%></td>
                <td> <% if(f.getId() != 1){ %> <a href="form_alterar_funcionario.jsp?id=<%=f.getId() %>"><img src="imagens/alterar.png"/></a> <a href="#" onclick="excluir(<%=f.getId() %>,'<%=f.getNome() %>')"><img src="imagens/excluir.png"/></a> <% }else{ %> Indisponível <%}%> </td>
            </tr>
            <%
                }
            %>
        </table>
                </div>
        </div>  
    </body>
</html>
