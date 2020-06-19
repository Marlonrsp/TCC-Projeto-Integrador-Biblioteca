<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Dados de Emprestimo Biblioteca</title>
         <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
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
        <h2>Alterar Emprestimo</h2>

        <form action="exe_alt_Emprestimo.jsp" method="post">
            <label>ID do Emprestimo</label>
            <input type="text" name="id_emprestimo" value="<%=request.getParameter("id_emprestimo")%>"><br><br>

            <label>ID do Usuario</label>
            <input type="text" name="id_usuario" value="<%=request.getParameter("id_usuario")%>"><br><br>

            <label>ID do Exemplar</label>
            <input type="text" name="id_exemplares" value="<%=request.getParameter("id_exemplares")%>"><br><br>

            <label>Código do Exemplar</label>
            <input type="text" name="cod_Controle_Exemplar" value="<%=request.getParameter("cod_Controle_Exemplar")%>"><br><br>

            <label>Data do Emprestimo</label>
            <input type="date" name="data_emprestimo" class="form-control date-mask" placeholder="Ex.: dd/mm/aaaa" min="2020-06-18" value="<%=request.getParameter("data_emprestimo")%>"><br><br>

            <label>Data da Devolução</label>
            <input type="date" name="data_devolucao" class="form-control date-mask" placeholder="Ex.: dd/mm/aaaa" min="2020-06-18" value="<%=request.getParameter("data_devolucao")%>"><br><br>

            <button type="submit">Confirmar</button>
        </form>
        </div>      
    </body>
</html>
