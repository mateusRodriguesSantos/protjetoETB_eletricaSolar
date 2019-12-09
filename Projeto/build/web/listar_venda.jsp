<%-- 
    Document   : listar_venda
    Created on : 26/11/2018, 22:51:33
    Author     : User
--%>

<%@page import="modelo.Venda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.VendaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>Listar Venda</title>
        <script type="text/javascript">
            function cancelar(id){
                if(confirm("Tem certeza que deseja cancelar a venda, nº: "+id+"?")){
                    window.open("cancelar_venda.do?id="+id,"_parent");
                }
            }
        </script>
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
        <h1>Lista de vendas (<a href="listar_cliente.jsp"><img src="imagens/novo.png"/></a>)</h1>
        </div>
            <table class="table table-hover ">
            <tr>
                <td>ID</td>
                <td>Tipo de pagamento</td>
                <td>Data de venda</td>
                <td>Data de cancelamento</td>
                <td>Funcionario</td>
                <td>Cliente</td>
                <td>Opções</td>
            </tr>
            <%
 
                ArrayList<Venda> lista = new ArrayList<Venda>();
                VendaDAO vDAO = new VendaDAO();
                try{
                    lista = vDAO.listar();
                }catch(Exception e){
                    out.print("Erro:"+e);
                }
                for (Venda v:lista){
            %>
            <tr <% if(v.getData_cancelamento()== null){%> class="alert-success" <%}else{%> class="alert-danger" <%}%> >
                <td><%=v.getId()%></td>
                <td><%=v.getTipoDePagamento().getNome()%></td>
                <td><%=v.getData_venda()%></td>
                <td><%=v.getData_cancelamento()%></td>
                <td><%=v.getFuncionario().getNome()%></td>
                <td><%=v.getCliente().getNome()%></td> 
                <td style="text-align: center"> <% if(v.getData_cancelamento()== null){%><a href="#" onclick="cancelar('<%=v.getId() %>')"><img src="imagens/cancelar.png"/></a><a href="recibo_venda.jsp?id=<%=v.getId()%>"><img src="imagens/recibo.png"/></a><%}%> </td>
                
            </tr>
            <%
                }
            %>
            </table>
            </div>
            </div>
    </body>
</html>
