<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Livro"%>
<%@page import="Dao.LivroDao"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        <title>Cadastro de Livros Biblioteca</title>
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
            <h2>Cadastrar Livros</h2>

            <form action="exe_ins_Livro.jsp" method="post">

                <label>Título do Livro</label> 
                <input type="text" name="titulo_livro" required><br><br>

                <label>Autor</label> 
                <input type="text" name="autor_livro" required><br><br>

                <label>Editora</label> 
                <input type="text" name="editora_livro" required><br><br>

                <label>Gênero</label> 
                <input type="text" name="genero_livro" required><br><br>

                <label>Número de Páginas</label> 
                <input type="text" name="numPaginas" required><br><br>

                <button type="submit">Cadastrar</button>
            </form>
        </div>    
    </body>
</html>
