<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Exemplares"%>
<%@page import="Model.Usuario"%>
<%@page import="Dao.UsuarioDao"%>
<%@page import="Dao.ExemplaresDao"%>
<%@page import="Dao.EmprestimoDao"%>
<%@page import="Model.Emprestimo"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        <title>Exemplares</title>
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
        <h2>Exemplares dos Livros</h2>
            
            <%
                String cod_Controle_Exemplar = request.getParameter("cod_Controle_Exemplar");
                try {
                    out.print("<table border=1>");
                    out.print("<tr>");
                    out.print("<th>Id do Exemplar</th>");
                    out.print("<th>Codigo do Exemplar</th>");
                    out.print("<th>Id do Livro</th>");
                    out.print("<th>Reservar</th>");
                    out.print("<th>Editar</th>");
                    out.print("<th>Excluir</th>");
                    ExemplaresDao exem = new ExemplaresDao();
                    UsuarioDao usu = new UsuarioDao();
                    if (request.getParameter("cod_Controle_Exemplar") == "" || request.getParameter("") == null) {
                        ArrayList<Exemplares> listaExemplares = exem.ListarTodos();
                        ArrayList<Usuario> listaUsuario = usu.listarTodosUsuario();
                        for (int num = 0; num < listaExemplares.size(); num++) {
                            out.print("<tr>");
                            out.print("<td>" + listaExemplares.get(num).getId_exemplares() + "</td>");
                            out.print("<td>" + listaExemplares.get(num).getCod_Controle_Exemplar() + "</td>");
                            out.print("<td>" + listaExemplares.get(num).getId_livro() + "</td>");
                            out.print("<td><a href='fazerEmprestimo.jsp?id_usuario=" + listaUsuario.get(num).getId_usuario() + "&id_exemplares=" + listaExemplares.get(num).getId_exemplares() + "&cod_Controle_Exemplar=" + listaExemplares.get(num).getCod_Controle_Exemplar() + "'>Reservar Exemplar</a></td>");
                            out.print("<td><a href='alteraExemplares.jsp?id_exemplares="
                                    + listaExemplares.get(num).getId_exemplares() + "&cod_Controle_Exemplar="
                                    + listaExemplares.get(num).getCod_Controle_Exemplar() + "&id_livro="
                                    + listaExemplares.get(num).getId_livro() + "'>Editar</a></td>");
                            out.print("<td><a href='excluirExemplar.jsp?id_exemplares="+listaExemplares.get(num).getId_exemplares()+"&cod_Controle_Exemplar="+listaExemplares.get(num).getCod_Controle_Exemplar()+"'>Excluir</a></td>");
                            out.print("</tr>");
                        }
                    } else {
                        ArrayList<Exemplares> listaExemplares = exem.ListarTodosCodigoExemplar("cod_Controle_Exemplar");
                        ArrayList<Usuario> listaUsuario = usu.listarTodosNome("nome_usuario");
                        for (int num = 0; num > listaExemplares.size(); num++) {
                            out.print("<tr>");
                            out.print("<td>" + listaExemplares.get(num).getId_exemplares() + "</td>");
                            out.print("<td>" + listaExemplares.get(num).getCod_Controle_Exemplar() + "</td>");
                            out.print("<td>" + listaExemplares.get(num).getId_livro() + "</td>");
                            out.print("<td><a href='fazerEmprestimo.jsp?id_usuario=" + listaUsuario.get(num).getId_usuario() + "&id_exemplares=" + listaExemplares.get(num).getId_exemplares() + "&cod_Controle_Exemplar=" + listaExemplares.get(num).getCod_Controle_Exemplar() + "'>Reservar Exemplar</a></td>");
                            out.print("<td><a href='alteraExemplares.jsp?id_exemplares="
                                    + listaExemplares.get(num).getId_exemplares() + "&cod_Controle_Exemplar="
                                    + listaExemplares.get(num).getCod_Controle_Exemplar() + "&id_livro="
                                    + listaExemplares.get(num).getId_livro() + "'>Editar</a></td>");
                            out.print("<td><a href='excluirExemplar.jsp?id_exemplares="+listaExemplares.get(num).getId_exemplares()+"&cod_Controle_Exemplar="+listaExemplares.get(num).getCod_Controle_Exemplar()+"'>Excluir</a></td>");
                            out.print("</tr>");
                        }
                        out.print("</tr>");
                        out.print("</table>");
                    }
                } catch (Exception erro) {
                    throw new RuntimeException("Erro Exemplares JSP: " + erro);
                }

            %>
        </div>
    </body>
</html>
