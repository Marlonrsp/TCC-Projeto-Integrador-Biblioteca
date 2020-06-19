<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.LogRenovacao"%>
<%@page import="Dao.LogRenovacaoDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        <title>Alterar Dados de Renovação Biblioteca</title>
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
        <h2>Alterar Data de Renovação de Livros</h2>

        <form action="exe_alt_Renovar.jsp" method="post">
            <label>ID da Renovação</label> 
            <input type="text" name="id_logRenovacao" value="<%=request.getParameter("id_logRenovacao")%>"><br><br>

            <label>Data da Renovação</label> 
            <input type="date" name="data_geracao" min="2020-06-18" value="<%=request.getParameter("data_geracao")%>"><br><br>

            <label>Nova Data de Devolução</label> 
            <input type="date" name="data_Nova_Devolucao" min="2020-06-18" value="<%=request.getParameter("data_Nova_Devolucao")%>"><br><br>

            <button type="submit">Confirmar</button>
        </form>
        </div>
    </body>
</html>
