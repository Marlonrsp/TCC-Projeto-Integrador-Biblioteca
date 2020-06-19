<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Emprestimo"%>
<%@page import="Dao.EmprestimoDao"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Livro"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        <title>Reservar Livros</title>
    </head>
    <body>
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
            <h2>Realizar Emprestimo do Exemplar</h2>

            <form id="Emprestimo" action="exe_ins_Emprestimo.jsp" method="post">

                <label>ID do Leitor</label>
                <input type="text" name="id_usuario" required><br><br>

                <label>ID do Exemplar</label>
                <input type="text" name="id_exemplares" value="<%=request.getParameter("id_exemplares")%>" required><br><br>

                <label>Código do Exemplar</label>
                <input type="text"name="cod_Controle_Exemplar" value="<%=request.getParameter("cod_Controle_Exemplar")%>" required><br><br> 

                <label>Data do Emprestimo</label>
                <input type="date" name="data_emprestimo" min="2020-06-18" required><br><br> 

                <label>Data de Devolução</label>
                <input type="date" name="data_devolucao" min="2020-06-18" required><br><br>

                <button type="submit">Confirmar</button>

            </form>  
    </body>
</html>
