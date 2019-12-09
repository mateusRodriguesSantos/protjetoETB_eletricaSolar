<%-- 
    Document   : form_inserir_funcionario
    Created on : 03/11/2018, 13:07:47
    Author     : Administrador
--%>

<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    ArrayList<Perfil> perfis = new ArrayList<Perfil>();
    try{
        PerfilDAO pDAO = new PerfilDAO();
        perfis = pDAO.listar();
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
        <title>Inserir Funcionario</title>
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
             <h1 class="panel-title">Novo Funcionário</h1>
        </div>
        <div class="container">
            <form action="inserir_funcionario.do" method="post">
                <div class="col-3">
                    Nome:<input class="form-control"  type="text" name="nome" placeholder="Nome e sobrenome" size="60" required>
                </div>
                <div  class="col-3">
                    CPF:<input class="form-control" type="text" name="cpf" size="60" placeholder="###.###.###-##" onkeyup="mascara('###.###.###-##',this,event,true)" maxlength="14" required>
                </div>
                <div  class="col-5" >
                    Endereço:<input class="form-control" type="text" name="endereco" placeholder="Onde ele mora?" size="60" required>       
                </div>  
                <div class="col-3">
                    Telefone:<input class="form-control" type="text" name="telefone" size="60" placeholder="#########" onkeyup="mascara('#########',this,event,true)" maxlength="9" required>
                </div>
                <div class="col-3">
                    Login:<input class="form-control" type="text" name="login" placeholder="Login" size="60" required>
                </div>
                <div class="col-3">
                    Senha:<input class="form-control"  type="password" name="senha" placeholder="Senha" size="60" required>
                </div>
                <div class="col-2">
                    Situacao:<input class="form-control"  type="text" name="situacao" placeholder="ativo/inativo" size="60" required>
                    Perfil:
                    <select  class="form-control" name="id_perfil" size="1" required>
                        <option value="">Selecione...</option>
                        <%
                            for (Perfil p:perfis){
                                %>
                                <option value="<%=p.getId() %>"><%=p.getNome() %></option>
                                <%
                            }
                         %>
                    </select>
                </div>
                <br/>
                
                <input style="position: relative; left: 13px;" type="submit" class="btn btn-info" value="Salvar">
            </form>
        </div>
        </div>  
        </div>
    </body>
</html>
