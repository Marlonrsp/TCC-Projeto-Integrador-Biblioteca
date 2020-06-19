<%@page import="Model.Multa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.MultaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        <title>Inserir Multas</title>
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
                <h2>Atribuir Multa</h2>

                <form action="exe_ins_Multa.jsp" method="post">
                    <label>ID do Emprestimo</label>
                    <input type="text" name="id_emprestimo" value="<%=request.getParameter("id_emprestimo")%>" required><br><br>

                    <label>Valor</label>
                    <input type="text" name="valor" id="valor form-control" data-mask="#.##0,00" style="display:inline-block" required><br><br> 

                    <label>Data da Emissão</label> 
                    <input type="date" name="data_emissao" min="2020-06-18"  required><br><br>

                    <button type="submit">Confirmar</button>
                </form>
                <script src="JS/jquery-3.5.1.min.js"></script>
                <script src="JS/jquery.mask.min.js"></script>
                <script src="JS/jquery.mask.js"></script>
                <script>
                    $(document).ready(function(){
                    $('.valor').mask('#.##0,00', {reverse: true});
                            )};
                </script>
    </body>
</html>
