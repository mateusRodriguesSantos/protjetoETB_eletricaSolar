<%-- 
    Document   : form_alterar_menu
    Created on : 03/11/2018, 01:07:14
    Author     : Administrador
--%>

<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    Cliente c = new Cliente();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        ClienteDAO pDAO = new ClienteDAO();
        c = pDAO.carregarPorId(id);
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <script type="text/javascript" src="MascaraJS-master/mascara.min.js"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>Alterar Cliente</title>
        <style>
            body {
                background-image: url(imagens/eletrica_fundo.jpg);
            }
        </style>
    </head>
    <body>
      <div class="container">
        <%@include file="menu.jsp" %>
        <div class="panel panel-default">
        <div class="panel-heading">
             <h1 class="panel-title">Alterando Cliente</h1>
        </div>
        <div class="panel-body">  
        <form action="alterar_cliente.do" method="post">
           <div class="container">    
                <p>ID:<%=c.getId() %></p>
                <input type="hidden" name="id" value="<%=c.getId() %>"/>
                <div class="col-3">
                    Nome:<input class="form-control"  type="text" value="<%=c.getNome()%>" name="nome" placeholder="Nome e sobrenome" size="60" required>
                </div>
                <div  class="col-3">
                    CPF:<input class="form-control" type="text" name="cpf" value="<%=c.getCpf()%>" size="60" placeholder="###.###.###-##" onkeyup="mascara('###.###.###-##',this,event,true)" maxlength="14" required>
                </div>
                <div  class="col-5" >
                    Endereço:<input class="form-control" type="text" value="<%=c.getEndereco()%>"  name="endereco" placeholder="Onde ele mora?" size="60" required>       
                </div>  
                <div class="col-3">
                    Telefone:<input class="form-control" type="text" value="<%=c.getTelefone() %>" name="telefone" size="60" placeholder="#########" onkeyup="mascara('#########',this,event,true)" maxlength="9" required>
                </div>
                <br/>
                <input style="position: relative; left: 13px;"  class="btn btn-info" type="submit" value="Salvar"/>
            </div>
        </form>
        </div> 
        </div>
      </div>
    </body>
</html>
