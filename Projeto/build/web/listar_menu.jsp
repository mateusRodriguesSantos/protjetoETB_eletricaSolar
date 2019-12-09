<%-- 
    Document   : listar_menu
    Created on : 03/11/2018, 00:34:43
    Author     : Administrador
--%>

<%@page import="modelo.MenuDAO"%>
<%@page import="modelo.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <script type="text/javascript">
            function excluir(id,titulo){
                if(confirm("Tem certeza que deseja excluir o Menu "+titulo+"?")){
                    window.open("excluir_menu.do?id="+id,"_parent");
                }
            }
        </script>
        <title>Lista de Menus</title>
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
             <h1 class="panel-title">Lista de Menus (<a href="form_inserir_menu.jsp"><img src="imagens/novo.png"/></a>)</h1>
        </div>
        <table class="table table-hover table-striped">
            <tr>
                <td>ID</td>
                <td>TÍTULO</td>
                <td>LINK</td>
                <td>OPÇÕES</td>
            </tr>
            <%
                ArrayList<Menu> lista = new ArrayList<Menu>();
                MenuDAO mDAO = new MenuDAO();
                try{
                    lista = mDAO.listar();
                }catch(Exception e){
                    out.print("Erro:"+e);
                }
                for(Menu m:lista){
            %>
            <tr>
                <td><%=m.getId() %></td>
                <td><%=m.getTitulo()%></td>
                <td><%=m.getLink() %></td>
                <td><a href="form_alterar_menu.jsp?id=<%=m.getId() %>"><img src="imagens/alterar.png"/></a> <a href="#" onclick="excluir(<%=m.getId() %>,'<%=m.getTitulo() %>')"><img src="imagens/excluir.png"/></a> </td>
            </tr>
            <%
                }
            %>
        </table>
                </div>
        </div>  
    </body>
</html>
