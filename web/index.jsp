<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Livro"%>
<%@page import="Dao.LivroDao"%>
<%@page import="Model.Usuario"%>
<%@page import="Dao.UsuarioDao"%>
<%@page import="Model.Emprestimo"%>
<%@page import="Dao.EmprestimoDao"%>
<%@page import="Model.Multa"%>
<%@page import="Dao.MultaDao"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        <title>Biblioteca</title>
    </head>
    <body>
        <!--metodo de validação de usuario no sistema-->
        <%
            String email_usuario = (String) session.getAttribute("email_usuario");
            if (email_usuario == null) {
                response.sendRedirect("login.jsp");
            } else {
                out.print("<script>alert('Bem vindo " + email_usuario + "');</script>");
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
        <!--div do corpo do formulário de livros-->
        <div >
            <h2>Tabela de Livros</h2>
            
            <!--array list do formulario de pesquisa dos livros na index-->
            <%
                String titulo_livro = request.getParameter("titulo_livro");

                try {
                    out.print("<table border=1>");
                    out.print("<tr>");
                    out.print("<th>ID</th>");
                    out.print("<th>Titulo</th>");
                    out.print("<th>Autor</th>");
                    out.print("<th>Editora</th>");
                    out.print("<th>Gênero</th>");
                    out.print("<th>Páginas</th>");
                    out.print("<th>Editar</th>");
                    out.print("<th>Excluir</th>");
                    LivroDao lvr = new LivroDao();
                    EmprestimoDao emp = new EmprestimoDao();
                    if (request.getParameter("titulo_livro") == "" || request.getParameter("") == null) {
                        ArrayList<Livro> listaLivro = lvr.listarTodosLivro();
                        for (int num = 0; num < listaLivro.size(); num++) {
                            out.print("<tr>");
                            out.print("<td>" + listaLivro.get(num).getId_livro() + "</td>");
                            out.print("<td>" + listaLivro.get(num).getTitulo_livro() + "</td>");
                            out.print("<td>" + listaLivro.get(num).getAutor_livro() + "</td>");
                            out.print("<td>" + listaLivro.get(num).getEditora_livro() + "</td>");
                            out.print("<td>" + listaLivro.get(num).getGenero_livro() + "</td>");
                            out.print("<td>" + listaLivro.get(num).getNumPaginas() + "</td>");
                            out.print("<td><a href='alteraLivro.jsp?id_livro=" + listaLivro.get(num).getId_livro()
                                    + "&titulo_livro=" + listaLivro.get(num).getTitulo_livro() + "&autor_livro="
                                    + listaLivro.get(num).getAutor_livro() + "&editora_livro="
                                    + listaLivro.get(num).getEditora_livro() + "&genero_livro="
                                    + listaLivro.get(num).getGenero_livro() + "&numPaginas="
                                    + listaLivro.get(num).getNumPaginas() + " '>Editar</a></td>");
                            out.print("<td><a href='excluirLivro.jsp?id_livro="+listaLivro.get(num).getId_livro()+"&titulo_livro="+listaLivro.get(num).getTitulo_livro()+"'>Excluir</a></td>");
                            out.print("</tr>");
                        }
                    } else {
                        ArrayList<Livro> listaLivro = lvr.listarTodosTitulo(request.getParameter("titulo_livro"));
                        for (int num = 0; num < listaLivro.size(); num++) {
                            out.print("<tr>");
                            out.print("<td>" + listaLivro.get(num).getId_livro() + "</td>");
                            out.print("<td>" + listaLivro.get(num).getTitulo_livro() + "</td>");
                            out.print("<td>" + listaLivro.get(num).getAutor_livro() + "</td>");
                            out.print("<td>" + listaLivro.get(num).getEditora_livro() + "</td>");
                            out.print("<td>" + listaLivro.get(num).getGenero_livro() + "</td>");
                            out.print("<td>" + listaLivro.get(num).getNumPaginas() + "</td>");
                            out.print("<td><a href='alteraLivro.jsp?id_livro=" + listaLivro.get(num).getId_livro()
                                    + "&titulo_livro=" + listaLivro.get(num).getTitulo_livro() + "&autor_livro="
                                    + listaLivro.get(num).getAutor_livro() + "&editora_livro="
                                    + listaLivro.get(num).getEditora_livro() + "&genero_livro="
                                    + listaLivro.get(num).getGenero_livro() + "&numPaginas="
                                    + listaLivro.get(num).getNumPaginas() + " '>Editar</a></td>");
                            out.print("<td><a href='excluirLivro.jsp?id_livro="+listaLivro.get(num).getId_livro()+"&titulo_livro="+listaLivro.get(num).getTitulo_livro()+"'>Excluir</a></td>");
                            out.print("</tr>");
                        }
                    }
                    out.print("</tr>");
                    out.print("</table>");
                } catch (Exception erro) {
                    throw new RuntimeException("Erro Livros Index: " + erro);
                }
            %>
        </div><br><br>
    </body>
</html>
