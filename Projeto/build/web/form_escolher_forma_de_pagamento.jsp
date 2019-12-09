<%-- 
    Document   : escolher_forma_de_pagamento
    Created on : 16/11/2018, 20:36:51
    Author     : User
--%>

<%@page import="modelo.TipoDePagamento"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.ItemVenda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.TipoDePagamentoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>Escolher forma de pagamento</title>
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
             <h1 class="panel-title">Escolha a forma de pagamento!</h1>
        </div>
        <form action="finalizar_venda.do" method="post">
            <%
              for(TipoDePagamento tp:tiposPag){
            %>    
            <input type="radio" name="id" value="<%=tp.getId()%>"> <%=tp.getNome()%><br>
            <%
                }
            %>  
            <input type="submit" class="btn btn-info alert-success"  type="submit" value="Finalizar venda!!!">
        </form>  
                <h2>Itens no Carrinho</h2>
        <table class="table table-hover table-striped">
            <tr>
                <td>ORD</td>
                <td>Produto</td>
                <td>Quantidade</td>
                <td>Preço</td>
                <td>Sub Total</td>
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
            
            <%
                i++;
            }
            %>
            </tr>
            <tr>
                <td class="alert-success">VALOR TOTAL R$ <%=total %> </td>
            </tr>
            </table>  
        
        
    </body>
</html>
