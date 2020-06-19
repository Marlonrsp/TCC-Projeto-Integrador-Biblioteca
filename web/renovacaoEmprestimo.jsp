<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.LogRenovacaoDao"%>
<%@page import="Model.LogRenovacao"%>
<%@page import="Dao.EmprestimoDao"%>
<%@page import="Model.Emprestimo"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        <title>Renovar Emprestimo de Exemplares</title>
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
        <h2>Renovação de Emprestimo</h2>

        <form id="renovacao" action="exe_ins_Renovar.jsp" method="post">

            <label>ID do Emprestimo</label>
            <input type="text" name="id_emprestimo" value="<%=request.getParameter("id_emprestimo")%>" required><br><br>

            <label>Data Geração da Renovação</label>
            <input type="date" name="data_geracao" min="2020-06-18" required><br><br>

            <label>Nova Data de Devolução</label>
            <input type="date" name="data_Nova_Devolucao" min="2020-06-18" required><br><br>

            <button type="submit">Confirmar</button>

        </form>
        </div>    
    </body>
</html>
