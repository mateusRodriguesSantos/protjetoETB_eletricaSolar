<%-- 
    Document   : login
    Created on : 10/11/2018, 17:10:33
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/estilo.css">
        <title>Login</title>
        <style>
            body {
                background-image: url(imagens/eletrica_fundo.jpg);
            }
            
     .container {
         width: 100vw;
         height: 100vh;
         display:flex;
         flex-direction: row;
         justify-content: center;
         align-items: center  
     }

     .form-login{
        width: 250px;
        background-color: #777777; 
        border-radius: 5px; 
     }
   
     body {
        margin: 0px;
     }
    h2{ color:#ffffff; }
    label{
        color: #ffffff;
        font-size:  large;
    }
 </style>
        
    </head>

    <body>
        <div class="container" >    
        <form action="valida_login.do" method="post" class="form-login">
        <h2 align="center" class="form-login-holding">Acesso Restrito</h2>
        <div class="col-12">
            <label for="inputLogin">Login:</label>   
            <input type="text" name="login" class="form-control" required>
        </div>
        <div class="col-12">    
            <label for="inputLogin">Senha:</label>
            <input type="password" name="senha" class="form-control">
        </div>
        <br/>
            <div align="center" style="position: relative; bottom: 8px;">
                <button type="submit" class="btn btn-info">Entrar</button> 
            </div>
          
    </form>
            </div>   
        
    </body>
</html>
