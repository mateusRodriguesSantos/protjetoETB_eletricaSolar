<%-- 
    Document   : index
    Created on : 10/11/2018, 18:25:47
    Author     : Administrador
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>JSP Page</title>
        <style> body {
                background-image: url(imagens/eletrica_fundo.jpg);
            }
    </style>
    </head>
    <%
        try{
            ProdutoDAO pDAO = new ProdutoDAO();
            ArrayList<Produto> lista = new ArrayList<Produto>();
            lista = pDAO.listar();
    %>
    <body>
        <%@include file="menu.jsp" %>
        <div class="container">
        <div align="center" class="panel panel-default">
        <div class="panel-heading">
            <%Funcionario fLogado = (Funcionario) session.getAttribute("funcionario"); %>
            <h1 class="panel-title">Seja bem vindo <%=fLogado.getNome() %> !!! </h1>
        </div>
            <div id="myCarousel" class="carousel slide" data-ride="carousel" >
                <div class="carousel-inner" > 
                    <%for(int j=1;j<lista.size();j++){
                        if(j==1){
                    %>
                    <div class="carousel-item active">
                        <img  class="img-fluid d-block w-20" src="imagens/<%=j%>.jpg" >
                    </div>            
                    <%}else{
                        %>
                    <div class="carousel-item">
                        <img  class="img-fluid  d-block w-20" src="imagens/<%=j%>.jpg" >  
                    </div>            
                        <%
                    }}%>    
                </div> 
            </div>
      
            <div align="left" class="container">
                <h6>Pesquisa rápida de estoque</h6>
                <div class="form-inline" class="col-3">
                    <form action="pesquisaIndex.do" method="get">
                        <input class="form-control" type="text" name="nomeProduto" placeholder="Nome do produto/Letra">
                        <input class="btn btn-info" type="submit" value="Pesquisar">
                    </form>
                    <br/>
                </div>
                    <%
                    ArrayList<Produto> listaPesquisa = new ArrayList<Produto>();
                    listaPesquisa = (ArrayList<Produto>) session.getAttribute("listaIndex");
                    if(listaPesquisa != null){
                    %>
                    <table class="table table-hover table-striped">
                      <tr>
                      <td>ID</td>
                      <td>NOME</td>
                      <td>DESCRIÇÃO</td>
                      <td>MARCA</td>
                      <td style="text-align: center" >QUANTIDADE</br>ESTOQUE</td>
                      <td style="text-align: center" >PRECO</br>UNIDADE</td>
                      </tr>  
                    <%
                    for (Produto p:listaPesquisa){
                    %>
                        <tr>
                        <td><%=p.getId() %></td>
                        <td><%=p.getNome()%> </td>
                        <td><%=p.getDescricao()%></td>
                        <td><%=p.getMarca()%> </td>
                        <td><%=p.getQtdEstoque()%> </td>
                        <td><%=p.getPreco_un()%></td>
                        </tr>
                    <%
                    }
                    %>
                    </table>
            </div>    
        </div> 
        </div>    
            <%
                }
                }catch(Exception e){ 
                out.print("ERRO: "+e);
                }
            %>
    </body>
</html>
