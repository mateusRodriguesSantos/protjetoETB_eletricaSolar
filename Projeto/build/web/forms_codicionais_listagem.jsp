<%-- 
    Document   : forms_codicionais_listagem
    Created on : 20/11/2018, 12:27:32
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>Forms condicionais da listagem</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="container">
           <div class="panel panel-default">
        <div class="panel-heading">
             <h1 class="panel-title">Lista de Vendas (<a href="listar_cliente.jsp"><img src="imagens/novo.png"/></a>)</h1>
        </div>
    <style>
          body {
                background-image: url(imagens/eletrica_fundo.jpg);
            }
            h1{
                align:"center"; 
            }
               
    </style>   
    
        </br>
        <%
            int op = Integer.parseInt(request.getParameter("op"));
            if(op == 1){
        %>
            <form action="listar_venda2.jsp" method="get"> 
                <input type="hidden" name="op" value="<%=op%>"> 
                Digite a data p/pesquisa:</br>
                <div class="col-3">
                    <input class="form-control" type="datetime" name="data_venda" required >
                </div>
                <div style="position: relative; left: 17px;">
                    <input type="submit" class="btn btn-info" value="Pesquisar" required>
                </div>
            </form>
            <p>*Digite no formato: ANO-MES-DIA</p>
            <p>*Ou apenas digite um dos integrantes: ANO,MES ou DIA</p>   
        <%
            }else if(op == 2){
        %>
            <form action="listar_venda2.jsp" method="get"> 
                <input type="hidden" name="op" value="<%=op%>"> 
                Digite a data de cancelamento p/pesquisa:</br>
                <div class="col-3">
                    <input class="form-control"  type="datetime" name="data_cancelamento" required> 
                </div>
                <div style="position: relative; left: 17px;">
                    <input type="submit" class="btn btn-info" value="Pesquisar" required>
                </div>    
            </form>
            <p>*Digite no formato: ANO-MES-DIA</p>
            <p>*Ou apenas digite um dos integrantes: ANO,MES ou DIA</p>       
        <%          
            }else if(op == 3){
        %>
            <form action="listar_venda2.jsp" method="get"> 
                <input type="hidden" name="op" value="<%=op%>"> 
                Digite o nome do cliente p/apesquisa:</br>
                <div class="col-3">
                    <input class="form-control"  type="text" name="nome_cli" required>
                </div>
                <div style="position: relative; left: 17px;">
                    <input type="submit" class="btn btn-info" value="Pesquisar" required>
                </div>
            </form>
            <p>*Digite um nome completo, algum nome ou letra</p>
        <%         
            }else if(op == 4){
        %>
        <script type="text/javascript">
            window.location.href = "listar_venda2.jsp?op=4";          
        </script>    
        <%
                
            }
            
        %>
    </body>
</html>
