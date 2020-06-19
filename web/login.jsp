<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Usuario"%>
<%@page import="Dao.UsuarioDao"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS/login.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h2>LOGIN</h2>
        <div class="loginSistema">
            <form action="login.jsp" method="post">
                <p>Email</p>
                <input type="email" name="email_usuario" placeholder="Insira seu E-mail"><br>
                <p>Senha</p>
                <input type="password" name="senha_usuario" placeholder="Insira sua Senha"><br>
                <input type="submit" value="Login"> <br>
                <!--                <a href="cadastroUsuario.jsp">Ainda não possui cadastro?</a>      -->
            </form>
        </div>
        <%
            String email_usuario = request.getParameter("email_usuario");
            String senha_usuario = request.getParameter("senha_usuario");
            UsuarioDao usu = new UsuarioDao();
            if (usu.autenticarLogin(email_usuario, senha_usuario)) {
                session.setAttribute("email_usuario", email_usuario);
                response.sendRedirect("index.jsp");
            } else {
                out.print("<script>alert('USUARIO_NAO_EXISTE!');</script>");
            }
        %>
    </body>
</html>
