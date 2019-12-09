<%-- 
    Document   : form_catalogo_venda
    Created on : 13/11/2018, 15:10:56
    Author     : Administrador
--%>

<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.ItemVenda"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Produto> catalogo = new ArrayList<Produto>();
    Venda venda = new Venda();
    try{
        String nova = request.getParameter("nova");
        if(nova.equals("sim")){
            int id = Integer.parseInt(request.getParameter("id"));
            Cliente c = new Cliente();
            ClienteDAO cDAO = new ClienteDAO();
            c = cDAO.carregarPorId(id);
            venda.setCliente(c);
            venda.setCarrinho(new ArrayList<ItemVenda>());
            Funcionario funcionario = (Funcionario) session.getAttribute("funcionario");
            venda.setFuncionario(funcionario);
            session.setAttribute("venda", venda);
        }else{
            venda = (Venda) session.getAttribute("venda");
        }
        ProdutoDAO pDAO = new ProdutoDAO();
        catalogo = pDAO.listar();
        
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>Compra</title>
        <style>
            body {
                background-image: url(imagens/eletrica_fundo.jpg);
            }
        </style>
        
        <script type="text/javascript">
            function validaQtd(qtdEstoque,qtdEscolhida,id_produto,preco_un){
                if(qtdEscolhida > qtdEstoque || qtdEscolhida <= 0){
                    alert("Quantidade inválida!!!");
                    window.location.href = "gerenciar_carrinho.do?op=aborta";
                }else{
                    window.location.href = "gerenciar_carrinho.do?op=add&id_produto="+id_produto+"&preco_un="+preco_un+"&quantidade="+qtdEscolhida;
                }
            }
         
        </script>    
    </head>
    <body>
        <div class="container">
              <div class="panel panel-default">
        <div class="panel-heading">
            <h1 class="panel-title"><img src="imagens/carrinhoDeCompra.png"> <%=venda.getCarrinho().size() %> </h1>
        </div>
        <h1>Cliente:<%=venda.getCliente().getNome() %></br><br/>
        <h2>Catálogo</h2>
        
        <table class="table table-responsive">
            <tr>
            <%
            int i=0;
            int j=0;
            for(Produto prod:catalogo){
                if(i <= 4){
            %>    
             
                <td align="center">
                        <img align="center" src="imagens/<%=prod.getId() %>.jpg"><br/>
                        <%=prod.getNome() %><br/>
                        R$ <%=prod.getPreco_un() %><br/>
                        <%
                        Double limite= prod.getQtdEstoque();
                        if(venda.getCarrinho() != null){
                        for(int m=0;m<venda.getCarrinho().size();m++){
                            if(prod.getId()  == venda.getCarrinho().get(m).getProduto().getId()){
                               limite = limite - venda.getCarrinho().get(m).getQuantidade();
                            }
                        }
                        }
                        j++;
                        %>
                        Quantidade:<input type="text" name="quantidade" id="qtdEscolhida<%=j%>" value="1" size="3" required/>
                        <input type="submit" value="+" class="btn btn-info" onclick="validaQtd(<%=limite%>,document.getElementById('qtdEscolhida<%=j%>').value,<%=prod.getId() %>,<%=prod.getPreco_un() %>)"/>
                        <p>*limite: <%=limite %></p>
                </td>
                
            <%
                i++;
                }else{
                    i=0;
                %>
                </tr>
                <tr>
                <td align="center">
                        <img src="imagens/<%=prod.getId() %>.jpg"><br/>
                        <%=prod.getNome() %><br/>
                        R$ <%=prod.getPreco_un() %><br/>
                        <%
                        Double limite= prod.getQtdEstoque();
                        if(venda.getCarrinho() != null){
                        for(int m=0;m<venda.getCarrinho().size();m++){
                            if(prod.getId()  == venda.getCarrinho().get(m).getProduto().getId()){
                               limite = limite - venda.getCarrinho().get(m).getQuantidade();
                            }
                        }
                        }    
                        j++;
                        %>
                        Quantidade:<input type="text" name="quantidade" id="qtdEscolhida<%=j%>" value="1" size="3" required/>
                        <input type="submit" class="btn btn-info" value="+" onclick="validaQtd(<%=limite %>,document.getElementById('qtdEscolhida<%=j%>').value,<%=prod.getId() %>,<%=prod.getPreco_un() %>)"/>
                        <p>*limite: <%=limite %></p>
                </td> 
                
<%
                
                i++;
                }
            }
%>
            
        </table>
        <br/>
        <a  href="listar_cliente.jsp"><input style="position: relative; left: 13px;" type="submit"  class="btn btn-info alert-danger" type="submit" value="Cancelar"></a>
        <a href="form_fecha_carrinho.jsp"><input style="position: relative; left: 13px;" type="submit"  class="btn btn-info alert-success" type="submit" value="Ver Carrinho"></a>
        </div>
       </div>     
    </body>
</html>
