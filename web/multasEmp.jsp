<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Multa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.MultaDao"%>
<%@page import="Model.Emprestimo"%>
<%@page import="Dao.EmprestimoDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        <title>Multas</title>
    </head>
    <body>
        <!--metodo de validação de usuario no sistema-->
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
           <h2>Multas dos Emprestimos</h2> 
            
            <%
                String valor = request.getParameter("valor");
                try {
                    out.print("<table border=1>");
                    out.print("<tr>");
                    out.print("<th>Id da Multa</th>");
                    out.print("<th>Id do Emprestimo</th>");
                    out.print("<th>Valor</th>");
                    out.print("<th>Data de Emissão</th>");
                    out.print("<th>Editar</th>");
                    out.print("<th>Remover</th>");
                    MultaDao mul = new MultaDao();
                    if (request.getParameter("valor") == "" || request.getParameter("") == null) {
                        ArrayList<Multa> listaMulta = mul.listarTodasMultas();
                        for (int i = 0; i < listaMulta.size(); i++) {
                            out.print("<tr>");
                            out.print("<td>" + listaMulta.get(i).getId_multa() + "</td>");
                            out.print("<td>" + listaMulta.get(i).getId_emprestimo() + "</td>");
                            out.print("<td>" + listaMulta.get(i).getValor() + "</td>");
                            out.print("<td>" + listaMulta.get(i).getData_emissao() + "</td>");
                            out.print("<td><a href='alteraMulta.jsp?id_multa=" + listaMulta.get(i).getId_multa() + "&id_emprestimo=" + listaMulta.get(i).getId_emprestimo() + "&valor=" + listaMulta.get(i).getValor() + "&data_emissao=" + listaMulta.get(i).getData_emissao() + "'>Editar</a></td>");
                            out.print("<td><a href='excluirMulta.jsp?id_multa=" + listaMulta.get(i).getId_multa() + "&id_emprestimo=" + listaMulta.get(i).getId_emprestimo() + "&valor=" + listaMulta.get(i).getValor() + "'>Remover</a></td>");
                            out.print("</tr>");
                        }
                    } else {
                        ArrayList<Multa> listaMulta = mul.listarTodosValor("valor");
                        for (int i = 0; i < listaMulta.size(); i++) {
                            out.print("<tr>");
                            out.print("<td>" + listaMulta.get(i).getId_multa() + "</td>");
                            out.print("<td>" + listaMulta.get(i).getId_emprestimo() + "</td>");
                            out.print("<td>" + listaMulta.get(i).getValor() + "</td>");
                            out.print("<td>" + listaMulta.get(i).getData_emissao() + "</td>");
                            out.print("<td><a href='alteraMulta.jsp?id_multa=" + listaMulta.get(i).getId_multa() + "&id_emprestimo=" + listaMulta.get(i).getId_emprestimo() + "&valor=" + listaMulta.get(i).getValor() + "&data_emissao=" + listaMulta.get(i).getData_emissao() + "'>Editar</a></td>");
                            out.print("<td><a href='excluirMulta.jsp?id_multa=" + listaMulta.get(i).getId_multa() + "&id_emprestimo=" + listaMulta.get(i).getId_emprestimo() + "&valor=" + listaMulta.get(i).getValor() + "'>Remover</a></td>");
                            out.print("</tr>");
                        }
                    }
                    out.print("</tr>");
                    out.print("</table>");
                } catch (Exception erro) {
                    throw new RuntimeException("Erro index listar multas: " + erro);
                }

            %>

        </div>        
    </body>
</html>
