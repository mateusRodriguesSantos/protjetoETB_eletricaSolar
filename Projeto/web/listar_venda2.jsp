<%-- 
    Document   : listar_funcionario
    Created on : 03/11/2018, 14:10:37
    Author     : Administrador
--%>

<%@page import="modelo.VendaDAO"%>
<%@page import="modelo.Venda"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <script type="text/javascript">
            function cancelar(id){
                if(confirm("Tem certeza que deseja cancelar a venda, nº: "+id+"?")){
                    window.open("cancelar_venda.do?id="+id,"_parent");
                }
            }
        </script>
        <title>Lista de Vendas</title>
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
             <h1 class="panel-title">Lista de Vendas (<a href="listar_cliente.jsp"><img src="imagens/novo.png"/></a>)</h1>
        </div>
            <%
            int op = Integer.parseInt(request.getParameter("op"));    
            if(op == 1){   
            %>
            <p>Listagem por data de venda</p>
            <% String data_venda = request.getParameter("data_venda"); %>
            </br>
            <table class="table table-hover">
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
            ArrayList<Venda> listaDataVenda = new ArrayList<Venda>();
            VendaDAO vDAO = new VendaDAO();
            try{
                listaDataVenda = vDAO.listarPorDataVenda(data_venda);
            }catch(Exception e){
                out.print("Erro:"+e);
            } 
            for(Venda v:listaDataVenda){
            %>
            <tr <% if(v.getData_cancelamento() == null){%> class="alert-success" <%}else{%> class="alert-danger" <%}%> >
                <td><%=v.getId()%></td>
                <td><%=v.getTipoDePagamento().getNome()%></td>
                <td><%=v.getData_venda()%></td>
                <td><%=v.getData_cancelamento()%></td>
                <td><%=v.getFuncionario().getNome()%></td>
                <td><%=v.getCliente().getNome()%></td>
                <td style="text-align: center"> <% if(v.getData_cancelamento()== null){%><a href="#" onclick="cancelar('<%=v.getId() %>')"><img src="imagens/cancelar.png"/></a> <a href="recibo_venda.jsp?id=<%=v.getId()%>"><img src="imagens/recibo.png"/></a><%}%></td>
            </tr>
            <%  
             }
            %>
            </table>
            <%
                
            }else if(op == 2){

            %>
            <p>Listagem por data de cancelamento</p>
            <% String data_cancelamento = request.getParameter("data_cancelamento"); %>
            </br>
            <table class="table table-hover">
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
            ArrayList<Venda> listaDataCancelamento = new ArrayList<Venda>();
            VendaDAO vDAO = new VendaDAO();
            try{
                listaDataCancelamento = vDAO.listarPorDataCancelamento(data_cancelamento);
            }catch(Exception e){
                out.print("Erro:"+e);
            } 
            for(Venda v:listaDataCancelamento){
            %>
            <tr <% if(v.getData_cancelamento()== null){%> class="alert-success" <%}else{%> class="alert-danger" <%}%>  >
                <td><%=v.getId()%></td>
                <td><%=v.getTipoDePagamento().getNome()%></td>
                <td><%=v.getData_venda()%></td>
                <td><%=v.getData_cancelamento()%></td>
                <td><%=v.getFuncionario().getNome()%></td>
                <td><%=v.getCliente().getNome()%></td>
                <td style="text-align: center"> <% if(v.getData_cancelamento()== null){%><a href="#" onclick="cancelar('<%=v.getId() %>')"><img src="imagens/cancelar.png"/></a><a href="recibo_venda.jsp?id=<%=v.getId()%>"><img src="imagens/recibo.png"/></a><%}%></td>
            </tr>
            <%  
             }
            %>
            </table>
            <%
                
            }else if(op == 3){ 
            %>
            <p>Listagem por nome do cliente</p>
             <% String nome_cli = request.getParameter("nome_cli"); %>
            </br>
            <table class="table table-hover">
            <tr >
                <td>ID</td>
                <td>Tipo de pagamento</td>
                <td>Data de venda</td>
                <td>Data de cancelamento</td>
                <td>Funcionario</td>
                <td>Cliente</td>
                <td>Opções</td>
            </tr>
            <%  
            ArrayList<Venda> listaNomeCliente = new ArrayList<Venda>();
            VendaDAO vDAO = new VendaDAO();
            try{
                listaNomeCliente = vDAO.listarVendaCliente(nome_cli);
            }catch(Exception e){
                out.print("Erro:"+e);
            } 
            for(Venda v:listaNomeCliente){
            %>
            <tr <% if(v.getData_cancelamento()== null){%> class="alert-success" <%}else{%> class="alert-danger" <%}%> >
                <td><%=v.getId()%></td>
                <td><%=v.getTipoDePagamento().getNome()%></td>
                <td><%=v.getData_venda()%></td>
                <td><%=v.getData_cancelamento()%></td>
                <td><%=v.getFuncionario().getNome()%></td>
                <td><%=v.getCliente().getNome()%></td>
                <td style="text-align: center"> <% if(v.getData_cancelamento()== null){%><a href="#" onclick="cancelar('<%=v.getId() %>')"><img src="imagens/cancelar.png"/></a><a href="recibo_venda.jsp?id=<%=v.getId()%>"><img src="imagens/recibo.png"/></a><%}%></td>
            </tr>
            <%  
             }
            %>
            </table>
            <%
                
            }else if(op == 4){
                
            %>
            <p>Listagem de todas as vendas</p>
            </br>
            <table class="table table-hover">
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
            <%
            }
            %>
            </br>
            <div style="text-align: center; position: relative; bottom: 8px;">
                <a  href="opcoes_de_listagem.jsp"><input  type="button" class="btn btn-info" value="Voltar"></a>
            </div>
       </body>
</html>
