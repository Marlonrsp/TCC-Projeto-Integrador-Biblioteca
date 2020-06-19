<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.LogRenovacao"%>
<%@page import="Dao.LogRenovacaoDao"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        <title>Renovar Livros Biblioteca</title>
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
        <h2>Renovação de Exemplares de Livros</h2>

        
        <%
            String id_logRenovacao = request.getParameter("id_logRenovacao");

            try {
                out.print("<table border=1>");
                out.print("<tr>");
                out.print("<td>Id da Renovação</td>");
                out.print("<td>Id Emprestimo</td>");
                out.print("<th>Data de Renovação</th>");
                out.print("<th>Data de Devolução</th>");
                out.print("<th>Editar</th>");
                out.print("<th>Excluir</th>");
                LogRenovacaoDao ren = new LogRenovacaoDao();
                if (request.getParameter("id_logRenovacao") == "" || request.getParameter("") == null) {
                    ArrayList<LogRenovacao> listaRenovar = ren.listarTodosLogRenovacao();
                    for (int i = 0; i < listaRenovar.size(); i++) {
                        out.print("<tr>");
                        out.print("<td>" + listaRenovar.get(i).getId_logRenovacao() + "</td>");
                        out.print("<td>" + listaRenovar.get(i).getId_emprestimo() + "</td>");
                        out.print("<td>" + listaRenovar.get(i).getData_geracao() + "</td>");
                        out.print("<td>" + listaRenovar.get(i).getData_Nova_Devolucao() + "</td>");
                        out.print("<td><a href='alteraRenovar.jsp?id_logRenovacao="
                                + listaRenovar.get(i).getId_logRenovacao() + "&id_emprestimo=" + listaRenovar.get(i).getId_emprestimo() + "&data_geracao= "
                                + listaRenovar.get(i).getData_geracao() + "&data_Nova_Devolucao= "
                                + listaRenovar.get(i).getData_Nova_Devolucao() + " '>Editar</a></td>");
                        out.print("<td><a href='excluirRenovar.jsp?id_logRenovacao="+listaRenovar.get(i).getId_logRenovacao()+"&data_geracao="+listaRenovar.get(i).getData_geracao()+"'>Excluir</a></td>");
                        out.print("</tr>");
                    }
                } else {
                    ArrayList<LogRenovacao> listaRenovar = ren.listarTodosIdEmprestimo("id_emprestimo");
                    for (int i = 0; i < listaRenovar.size(); i++) {
                        out.print("<tr>");
                        out.print("<td>" + listaRenovar.get(i).getId_logRenovacao() + "</td>");
                        out.print("<td>" + listaRenovar.get(i).getId_emprestimo() + "</td>");
                        out.print("<td>" + listaRenovar.get(i).getData_geracao() + "</td>");
                        out.print("<td>" + listaRenovar.get(i).getData_Nova_Devolucao() + "</td>");
                        out.print("<td><a href='alteraRenovar.jsp?id_logRenovacao="
                                + listaRenovar.get(i).getId_logRenovacao() + "&id_emprestimo= " + listaRenovar.get(i).getId_emprestimo() + "&data_geracao= "
                                + listaRenovar.get(i).getData_geracao() + "&data_Nova_Devolucao= "
                                + listaRenovar.get(i).getData_Nova_Devolucao() + " '>Editar</a></td>");
                        out.print("<td><a href='excluirRenovar.jsp?id_logRenovacao="+listaRenovar.get(i).getId_logRenovacao()+"&data_geracao="+listaRenovar.get(i).getData_geracao()+"'>Excluir</a></td>");
                        out.print("</tr>");
                    }
                    out.print("</tr>");
                    out.print("</table>");
                }
            } catch (Exception erro) {
                throw new RuntimeException("Erro list renovação");
            }
        %>
        </div>
    </body>
</html>
