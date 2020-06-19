<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        <title>Alterar Informações dos Livros Biblioteca</title>
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
        <h2>Alterar Dados dos Livros</h2>

        <form action="exe_alt_Livro.jsp" method="post">

            <label> Id </label>
            <input type="text" name="id_livro" value="<%=request.getParameter("id_livro")%>"><br><br>

            <label>Título do Livro</label>
            <input type="text" name="titulo_livro" value="<%=request.getParameter("titulo_livro")%>"><br><br>

            <label>Autor</label>
            <input type="text" name="autor_livro" value="<%=request.getParameter("autor_livro")%>"><br><br>

            <label>Editora</label>
            <input type="text" name="editora_livro" value="<%=request.getParameter("editora_livro")%>"><br><br>

            <label>Gênero</label>
            <input type="text" name="genero_livro" value="<%=request.getParameter("genero_livro")%>"><br><br>

            <label>Número de Páginas</label>
            <input type="text" name="numPaginas" value="<%=request.getParameter("numPaginas")%>"><br><br>

            <button type="submit">Confirmar</button>
        </form>
        </div>
    </body>
</html>
