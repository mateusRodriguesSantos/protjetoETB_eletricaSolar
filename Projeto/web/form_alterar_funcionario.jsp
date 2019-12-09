<%-- 
    Document   : form_alterar_funcionario
    Created on : 03/11/2018, 14:35:35
    Author     : Administrador
--%>

<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.FuncionarioDAO"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Perfil> perfis = new ArrayList<Perfil>();
    Funcionario f = new Funcionario();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        FuncionarioDAO fDAO = new FuncionarioDAO();
        f = fDAO.carregarPorId(id);
        
        PerfilDAO pDAO = new PerfilDAO();
        perfis = pDAO.listar();
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
           <script type="text/javascript" src="MascaraJS-master/mascara.min.js"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>Alterar Funcionário</title>
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
                <h1 class="panel-title">Editando Funcionário</h1>
            </div>
             <div class="container">    
            <form action="alterar_funcionario.do" method="get">
                <p>ID:<%=f.getId() %></p>
                <input type="hidden" name="id" value="<%=f.getId() %>"/>
                <div class="col-3">
                    Nome:<input class="form-control"  type="text" value="<%=f.getNome()%>" name="nome" placeholder="Nome e sobrenome" size="60" required>
                </div>
                <div  class="col-3">
                    CPF:<input class="form-control" type="text" name="cpf" value="<%=f.getCpf()%>" size="60" placeholder="###.###.###-##" onkeyup="mascara('###.###.###-##',this,event,true)" maxlength="14" required>
                </div>
                <div  class="col-5" >
                    Endereço:<input class="form-control" type="text" value="<%=f.getEndereco()%>"  name="endereco" placeholder="Onde ele mora?" size="60" required>       
                </div>  
                <div class="col-3">
                    Telefone:<input class="form-control" type="text" value="<%=f.getTelefone()%>" name="telefone" size="60" placeholder="#########" onkeyup="mascara('#########',this,event,true)" maxlength="9" required>
                </div>
                <div class="col-4">
                    Login:<input class="form-control" type="text" value="<%=f.getLogin() %>" name="login" size="60" required>
                </div>
                <div class="col-4">
                    Senha:<input class="form-control" type="text" value="<%=f.getSenha() %>" name="senha" required>
                </div>
                <div class="col-4">
                    Situação:<input class="form-control" type="text" value="<%=f.getSituacao() %>" name="situacao" size="60" required>
                </div>
                <div class="col-4">
                    Perfil:
                    <select class="form-control" name="id_perfil" size="1" required>
                        <option value="">Selecione...</option>
                        <%
                            String selecao = "";
                            for (Perfil p:perfis){
                                if(f.getPerfil().getId()==p.getId()){
                                    selecao = "selected";
                                }else{
                                    selecao = "";
                                }    
                        %>
                        <option value="<%=p.getId() %>"<%=selecao%>><%=p.getNome() %></option>
                        <%
                            }
                        %>
                    </select>
                    </div>
                   <br/>
                <input style="position: relative; left: 13px;"  class="btn btn-info" type="submit" value="Salvar"/>
                </div>
            </div>
        </div>        
    </body>
</html>
