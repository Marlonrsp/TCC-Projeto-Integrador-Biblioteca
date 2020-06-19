<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.LogRenovacao"%>
<%@page import="Model.Emprestimo"%>
<%@page import="Dao.EmprestimoDao"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Livro"%>
<%@page import="Dao.LogRenovacaoDao"%>
<%@page import="Dao.MultaDao"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        <title>Emprestimos</title>
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
            <h2>Empréstimos de Livros</h2>
            <div>
                <form action="emprestimos.jsp" method="post">
                    <input type="text" name="id_exemplares" placeholder="Pesquisar por ID">
                    <button type="submit">Enviar</button><br>
                </form>
                <%
                    String id_exemplares = request.getParameter("id_exemplares");
                    try {
                        out.print("<table border=1>");
                        out.print("<tr>");
                        out.print("<th>Id do Emprestimo</th>");
                        out.print("<th>Id do Usuario</th>");
                        out.print("<th>Id do Exemplar</th>");
                        out.print("<th>Codigo do Exemplar</th>");
                        out.print("<th>Data do Emprestimo</th>");
                        out.print("<th>Data de Devolução</th>");
                        out.print("<th>Renovar</th>");
                        out.print("<th>Impor Multa</th>");
                        out.print("<th>Editar</th>");
                        out.print("<th>Excluir</th>");
                        EmprestimoDao emp = new EmprestimoDao();
                        LogRenovacaoDao lvr = new LogRenovacaoDao();
                        MultaDao mul = new MultaDao();
                        if (request.getParameter("id_exemplares") == "" || request.getParameter("") == null) {
                            ArrayList<Emprestimo> listaEmprestimo = emp.listarTodosEmprestimo();
                            for (int num = 0; num < listaEmprestimo.size(); num++) {
                                out.print("<tr>");
                                out.print("<td>" + listaEmprestimo.get(num).getId_emprestimo() + "</td>");
                                out.print("<td>" + listaEmprestimo.get(num).getId_usuario() + "</td>");
                                out.print("<td>" + listaEmprestimo.get(num).getId_exemplares() + "</td>");
                                out.print("<td>" + listaEmprestimo.get(num).getCod_Controle_Exemplar() + "</td>");
                                out.print("<td>" + listaEmprestimo.get(num).getData_emprestimo() + "</td>");
                                out.print("<td>" + listaEmprestimo.get(num).getData_devolucao() + "</td>");
                                out.print("<td><a href='renovacaoEmprestimo.jsp?id_emprestimo=" + listaEmprestimo.get(num).getId_emprestimo() + "'>Renovar</a></td>");
                                out.print("<td><a href='multa.jsp?id_emprestimo=" + listaEmprestimo.get(num).getId_emprestimo() + "'>Impor Multa</a></td>");
                                out.print("<td><a href='alteraEmprestimo.jsp?id_emprestimo=" + listaEmprestimo.get(num).getId_emprestimo()
                                        + "&id_usuario= " + listaEmprestimo.get(num).getId_usuario() + "&id_exemplares= " + listaEmprestimo.get(num).getId_exemplares() + "&cod_Controle_Exemplar=" + listaEmprestimo.get(num).getCod_Controle_Exemplar() + "&data_emprestimo="
                                        + listaEmprestimo.get(num).getData_emprestimo() + "&data_devolucao=" + listaEmprestimo.get(num).getData_devolucao() + "'>Editar</a></td>");
                                out.print("<td><a href='excluirEmprestimo.jsp?id_emprestimo="+listaEmprestimo.get(num).getId_emprestimo()+"&id_exemplares="+listaEmprestimo.get(num).getId_exemplares()+"'>Excluir</a></td>");
                                out.print("</tr>");
                            }
                        } else {
                            ArrayList<Emprestimo> listaEmprestimo = emp.listarTodosData("id_exemplares");
                            for (int num = 0; num < listaEmprestimo.size(); num++) {
                                out.print("<tr>");
                                out.print("<td>" + listaEmprestimo.get(num).getId_emprestimo() + "</td>");
                                out.print("<td>" + listaEmprestimo.get(num).getId_usuario() + "</td>");
                                out.print("<td>" + listaEmprestimo.get(num).getId_exemplares() + "</td>");
                                out.print("<td>" + listaEmprestimo.get(num).getCod_Controle_Exemplar() + "</td>");
                                out.print("<td>" + listaEmprestimo.get(num).getData_emprestimo() + "</td>");
                                out.print("<td>" + listaEmprestimo.get(num).getData_devolucao() + "</td>");
                                out.print("<td><a href='renovacaoEmprestimo.jsp?id_emprestimo=" + listaEmprestimo.get(num).getId_emprestimo() + "'>Renovar</a></td>");
                                out.print("<td><a href='multa.jsp?id_emprestimo=" + listaEmprestimo.get(num).getId_emprestimo() + "'>Impor Multa</a></td>");
                                out.print("<td><a href='alteraEmprestimo.jsp?id_emprestimo=" + listaEmprestimo.get(num).getId_emprestimo()
                                        + "&id_usuario= " + listaEmprestimo.get(num).getId_usuario() + "&id_exemplares= " + listaEmprestimo.get(num).getId_exemplares() + "&cod_Controle_Exemplar=" + listaEmprestimo.get(num).getCod_Controle_Exemplar() + "&data_emprestimo="
                                        + listaEmprestimo.get(num).getData_emprestimo() + "&data_devolucao=" + listaEmprestimo.get(num).getData_devolucao() + " '></a>Editar</td>");

                                out.print("</tr>");
                            }
                        }
                        out.print("</table>");
                    } catch (Exception erro) {
                        throw new RuntimeException("Erro Emprestimos JSP" + erro);
                    }

                %>


            </div><br><br>

            </body>
            </html>
