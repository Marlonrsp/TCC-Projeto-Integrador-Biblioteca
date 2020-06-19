<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.UsuarioDao"%>
<%@page import="Model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        <title>Cadastro de Usuários Biblioteca</title>
    </head>
    <body>
        <%
            String email_usuario = (String) session.getAttribute("email_usuario");
            if (email_usuario == null) {
                response.sendRedirect("login.jsp");
            } else {
                out.print("<script>alert alert-dismissible('Bem vindo " + email_usuario + "');</script>");
            }
        %>
        <h1>Biblioteca Cidadã</h1>
        <nav class="menu">
            <ul>
                <li><a href="index.jsp">Página Inicial</a></li>
                <li><a href="listaUsuarios.jsp">Usuários
                        <ul>
                            <li><a href="cadastroUsuario.jsp">Cadastro de Usuários</a></li>
                        </ul>
                    </a></li>
                <li><a href="index.jsp">Livros
                        <ul>
                            <li><a href="cadastroLivro.jsp">Cadastro de Livros</a></li>
                        </ul>
                    </a></li>
                <li><a href="exemplares.jsp">Exemplares
                        <ul>
                            <li><a href="novoExemplar.jsp">Cadastro de Exemplares</a></li>
                        </ul>
                    </a></li>
                <li><a href="emprestimos.jsp">Emprestimo</a></li>
                <li><a href="renovacao.jsp">Renovação</a></li>
                <li><a href="multasEmp.jsp">Multas</a></li>
                <li><a href="deslogar.jsp">Sair</a></li>
            </ul>     
            </nav>
        <br>
        <div>
            <h2>Cadastro de Usuários</h2>
            <form action="exe_ins_Usuario.jsp" method="post">
                <label>Nome</label> 
                <input type="text" name="nome_usuario" required><br><br>

                <label>Telefone</label>
                <input type="text" name="telefone_usuario" id="phone_with_ddd" data-mask="(00)00000-0000" required><br><br> 

                <label>Data de Nascimento</label>
                <input type="date" name="dataNascimento_usuario" max="2020-06-18" required><br><br>

                <label>Endereço</label>
                <input type="text" name="endereco_usuario" required><br><br>

                <label>Email</label>
                <input type="email" name="email_usuario" placeholder="email@hotmail.com" required><br><br> 

                <!--<label>Senha</label><input type="password" name="senha_usuario"><br><br>-->

                <button type="submit">Cadastrar</button>
            </form>

            <script src="JS/jquery-3.5.1.min.js"></script>
            <script src="JS/jquery.mask.js"></script>
            <script>
                $(document).ready(function(){
                $('.phone_with_ddd').mask('(00)00000-0000');
                        )};
            </script>
        </div>    
    </body>
</html>
