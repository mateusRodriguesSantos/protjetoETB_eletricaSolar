<%-- 
    Document   : form_fecha_carrinho
    Created on : 13/11/2018, 16:42:38
    Author     : Administrador
--%>

<%@page import="modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.TipoDePagamentoDAO"%>
<%@page import="modelo.TipoDePagamento"%>
<%@page import="modelo.ItemVenda"%>
<%@page import="modelo.Venda"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    Venda v = new Venda();
    ArrayList<TipoDePagamento> tiposPag = new ArrayList<TipoDePagamento>();
    TipoDePagamentoDAO tpDAO = new TipoDePagamentoDAO();
    try{
        v = (Venda) session.getAttribute("venda");
        tiposPag = tpDAO.listar();
    }catch(Exception e){
        out.print("Erro"+e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>Fecha Carrinho</title>
        <style>
            body {
                background-image: url(imagens/eletrica_fundo.jpg);
            }
        </style>
    </head>
    <body>
        <div class="container">

        <div class="panel panel-default">
        <div class="panel-heading">
            <h1 class="panel-title">Venda</br>
            ID:<%=v.getCliente().getId() %> Cliente:<%=v.getCliente().getNome() %></h1>
        </div>    
            <% if(!v.getCarrinho().isEmpty()){%>
        <h2>Itens no Carrinho</h2>
        <table class="table table-hover table-striped">
            <tr>
                <td>ORD</td>
                <td>Produto</td>
                <td>Quantidade</td>
                <td>Preço</td>
                <td>Sub Total</td>
                <td>Remover</td>
            </tr>
            <%
            int i = 0;
            double total = 0;
            
            for(ItemVenda item:v.getCarrinho()){
                total = total + (item.getQuantidade()*item.getPreco());
            %>
            <tr>
                <td><%=i+1 %></td>
                <td><%=item.getProduto().getNome() %></td>
                <td><%=item.getQuantidade() %></td>
                <td>R$ <%=item.getPreco() %></td>
                <td>R$ <%=(item.getQuantidade()*item.getPreco()) %></td>
                <td align="center"><a href="gerenciar_carrinho.do?op=del&ord=<%=i %>"><img src="imagens/excluir.png"></a></td>
            </tr>
            <%
                i++;
            }    
            %>
            <tr>
            <td class="alert-success">VALOR TOTAL R$ <%=total %> </td>
            </tr>
            </table>  
        <a href="listar_cliente.jsp"><input type="submit"  class="btn btn-info alert-danger" type="submit" value="Cancelar"></a>
        <a href="form_catalogo_venda.jsp?nova=nao"><input type="submit"   class="btn btn-info alert-primary" type="submit" value="Continuar Comprando"></a>
        <a href="form_escolher_forma_de_pagamento.jsp"><input type="submit"   class="btn btn-info alert-success" type="submit" value="Concluir"></a>
        <% }else{%> 
            <script type="text/javascript">
                    alert("Escolha algum produto!!!");
                    window.location.href = "form_catalogo_venda.jsp?nova=nao";
            </script>    
        <%}%>
               </div>
       </div>  
    </body>
</html>
