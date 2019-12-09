<%-- 
    Document   : recibo_venda
    Created on : 14/11/2018, 18:26:17
    Author     : Administrador
--%>

<%@page import="modelo.ItemVenda"%>
<%@page import="modelo.VendaDAO"%>
<%@page import="modelo.Venda"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Venda v = new Venda();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        VendaDAO vDAO = new VendaDAO();
        v = vDAO.carregarPorId(id);
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="jsPDF-1.3.2/dist/jspdf.min.js"></script> 
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>Recibo</title>
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
             <h1 class="panel-title">Recibo</h1>
        </div>
                <%
                Date dataAtual = new Date();
                %>
        <div align="center" id="Recibo">    
        <h1>ELÉTRICA SOLAR</h1>
        <p>CNPJ: 289953.0580001-79</p>
        <p>End: QN 05 CONJUNTO 01 LOJA 01 LOTE 07 - RIACHO FUNDO 1 - BRASÍLIA-DF</p>
        <p>Dat. Emissão: <% out.println(dataAtual); %> </p>
        <p>ID:<%=v.getCliente().getId() %> Cliente:<%=v.getCliente().getNome() %></p>
        <p>---------------------------------------------------------------------------</p>
            <h2>Itens Comprados</h2>
            <p>ORD  -   Produto -   Quantidade  -   Preço   -   SubTotal</p>
                <%
                int i = 0;
                double total = 0;
                for(ItemVenda item:v.getCarrinho()){
                    total = total + (item.getQuantidade()*item.getPreco());
                %>
                <p><%=i+1 %>    -   <%=item.getProduto().getNome() %>   -   <%=item.getQuantidade() %>  -   R$  <%=item.getPreco() %>   -   R$  <%=(item.getQuantidade()*item.getPreco()) %></p>
                <%
                    i++;
                }
                %>
            <br/>
            VALOR TOTAL     -    R$ <%=total %>
            <br/><br/>
        </div>
        <script>
            function downloadPDF() {
                   var doc = new jsPDF();              
                   doc.fromHTML($('#Recibo').get(0),30,30,{
                       'width':500});
                   doc.save('Recibo.pdf');
            }
        </script>
        <div align="center">
        <a href="listar_venda.jsp"><input type="submit" value="Retornar"></a>
        <button onclick="downloadPDF()">Baixar Recibo</button>
        </div>
        </div>
        </div>
    </body>
</html>
