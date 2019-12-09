<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="MascaraJS-master/mascara.min.js"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>Novo Cliente</title>
        <style>
            body {
                background-image: url(imagens/eletrica_fundo.jpg);
            }
        </style>
    </head>
    <body>
        <div class="container">
        <%@include file="menu.jsp" %>
        <div class="container">
        <div class="panel panel-default">
        <div class="panel-heading">
             <h1 class="panel-title">Novo Cliente</h1>
        </div>
            <div class="container">    
            <form action="inserir_cliente.do" method="get">
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
                <br/>
                <input style="position: relative; left: 13px;"  class="btn btn-info" type="submit" value="Salvar"/>
            </form>
            </div>
            </div>
        </div>  
    </body>
</html>
