<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        <title>Multas</title>
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
        <div>
        <h2>Alterar Multa</h2>

        <form action="exe_alt_Multa.jsp" method="post">
            <label>ID da Multa</label>
            <input type="text" name="id_multa" value="<%=request.getParameter("id_multa")%>"><br><br>

            <label>ID do Emprestimo</label>
            <input type="text" name="id_emprestimo" value="<%=request.getParameter("id_emprestimo")%>"><br><br>

            <label>Valor</label>
            <input type="text" name="valor" value="<%=request.getParameter("valor")%>"><br><br>

            <label>Data Emissão da Multa</label>
            <input type="date" name="data_emissao" class="form-control date-mask" placeholder="Ex.: dd/mm/aaaa" value="<%=request.getParameter("data_emissao")%>"><br><br>

            <button type="submit">Confirmar</button>
        </form>
        </div>
    </body>
</html>
