<%-- 
    Document   : listar_perfil
    Created on : 22/08/2018, 14:24:20
    Author     : Administrador
--%>

<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
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
                if(confirm("Tem certeza que deseja excluir o perfil: "+nome+"?")){
                    window.open("excluir_perfil.do?id="+id,"_parent");
                }
            }
        </script>
        <title>Lista de Perfis</title>
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
             <h1 class="panel-title">Lista de Perfis (<a href="form_inserir_perfil.jsp"><img src="imagens/novo.png"/></a>)</h1>
        </div>
        <table class="table table-hover table-striped">
            <tr>
                <td>ID</td>
                <td>NOME</td>
                <td>OP��ES</td>
            </tr>
            <%
            ArrayList<Perfil> lista = new ArrayList<Perfil>();
            PerfilDAO pDAO = new PerfilDAO();
            try{
               lista = pDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Perfil p:lista){
            %>
            <tr>
                <td><%=p.getId() %></td>
                <td><%=p.getNome() %></td>
                <td><a href="form_alterar_perfil.jsp?id=<%=p.getId() %>"><img src="imagens/alterar.png"/></a> <a href="#" onclick="excluir(<%=p.getId() %>,'<%=p.getNome() %>')"><img src="imagens/excluir.png"/></a> <a href="form_gerenciar_menu_perfil.jsp?id=<%=p.getId() %>"><img src="imagens/menu.png"/></a> </td>
            </tr>            
            <%
            }
            %>
        </table>
                </div>
        </div>  
    </body>
</html>
