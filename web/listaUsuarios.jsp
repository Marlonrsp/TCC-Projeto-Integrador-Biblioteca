<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Usuario"%>
<%@page import="Dao.UsuarioDao"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        <title>Usuarios Biblioteca Cidaddã</title>
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
                <h2>Lista de Usuários</h2>

                <!--array list do formulário de usuarios-->
                <%
                    String nome_usuario = request.getParameter("nome_usuario");
                    try {
                        out.print("<table border=1>");
                        out.print("<tr>");
                        out.print("<th>ID Usuário</th>");
                        out.print("<th>Nome Completo</th>");
                        out.print("<th>Telefone</th>");
                        out.print("<th>Data de Nascimento</th>");
                        out.print("<th>Endereço</th>");
                        out.print("<th>E-mail</th>");
                        out.print("<th>Editar</th>");
                        UsuarioDao usd = new UsuarioDao();
                        if (request.getParameter("nome_usuario") == "" || request.getParameter("") == null) {
                            ArrayList<Usuario> listaUsuario = usd.listarTodosUsuario();
                            for (int i = 0; i < listaUsuario.size(); i++) {
                                out.print("<tr>");
                                out.print("<td>" + listaUsuario.get(i).getId_usuario() + "</td>");
                                out.print("<td>" + listaUsuario.get(i).getNome_usuario() + "</td>");
                                out.print("<td>" + listaUsuario.get(i).getTelefone_usuario() + "</td>");
                                out.print("<td>" + listaUsuario.get(i).getDataNascimento_usuario() + "</td>");
                                out.print("<td>" + listaUsuario.get(i).getEndereco_usuario() + "</td>");
                                out.print("<td>" + listaUsuario.get(i).getEmail_usuario() + "</td>");
                                out.print("<td><a href='alteraUsuario.jsp?id_usuario=" + listaUsuario.get(i).getId_usuario()
                                        + "&nome_usuario=" + listaUsuario.get(i).getNome_usuario()
                                        + "&telefone_usuario" + listaUsuario.get(i).getTelefone_usuario()
                                        + "&dataNascimento_usuario=" + listaUsuario.get(i).getDataNascimento_usuario()
                                        + "&endereco_usuario=" + listaUsuario.get(i).getEndereco_usuario()
                                        + "&email_usuario=" + listaUsuario.get(i).getEmail_usuario() + "'>Editar</a></td>");
                                out.print("</tr>");
                            }
                        } else {
                            ArrayList<Usuario> listaUsuario = usd.listarTodosNome(request.getParameter("nome_usuario"));
                            for (int i = 0; i < listaUsuario.size(); i++) {
                                out.print("<tr>");
                                out.print("<td>" + listaUsuario.get(i).getId_usuario() + "</td>");
                                out.print("<td>" + listaUsuario.get(i).getNome_usuario() + "</td>");
                                out.print("<td>" + listaUsuario.get(i).getTelefone_usuario() + "</td>");
                                out.print("<td>" + listaUsuario.get(i).getDataNascimento_usuario() + "</td>");
                                out.print("<td>" + listaUsuario.get(i).getEndereco_usuario() + "</td>");
                                out.print("<td>" + listaUsuario.get(i).getEmail_usuario() + "</td>");
                                out.print("<td><a href='alteraUsuario.jsp?id_usuario=" + listaUsuario.get(i).getId_usuario()
                                        + "&nome_usuario=" + listaUsuario.get(i).getNome_usuario()
                                        + "&telefone_usuario" + listaUsuario.get(i).getTelefone_usuario()
                                        + "&dataNascimento_usuario=" + listaUsuario.get(i).getDataNascimento_usuario()
                                        + "&endereco_usuario=" + listaUsuario.get(i).getEndereco_usuario()
                                        + "&email_usuario=" + listaUsuario.get(i).getEmail_usuario() + "'>Editar</a></td>");
                                out.print("</tr>");
                            }
                        }
                    } catch (Exception erro) {
                        throw new RuntimeException("Erro listar usuários na página: " + erro);
                    }
                %>
        </div><br><br>
    </body>
</html>
