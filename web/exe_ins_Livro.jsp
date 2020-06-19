<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Livro"%>
<%@page import="Dao.LivroDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Livro li = new Livro();
            LivroDao liv = new LivroDao();
            String titulo_livro = request.getParameter("titulo_livro");
            String autor_livro = request.getParameter("autor_livro");
            String editora_livro = request.getParameter("editora_livro");
            String genero_livro = request.getParameter("genero_livro");
            String numPaginas = request.getParameter("numPaginas");
            try {
                if (titulo_livro.equals("")
                        || autor_livro.equals("")
                        || editora_livro.equals("")
                        || genero_livro.equals("")
                        || numPaginas.equals("")) {
                    out.print("<script>alert('Campos Obrigatórios!');</script>");
                    response.sendRedirect("index.jsp");
                } else {
                    li.setTitulo_livro(request.getParameter("titulo_livro"));
                    li.setAutor_livro(request.getParameter("autor_livro"));
                    li.setEditora_livro(request.getParameter("editora_livro"));
                    li.setGenero_livro(request.getParameter("genero_livro"));
                    li.setNum_paginas(Integer.parseInt(request.getParameter("numPaginas")));
                    liv.inserir(li);
                    out.print("<script>alert('Livro cadastrado com sucesso');</script>");
                    out.print("<script>window.location.href='index.jsp'</script>");
                }
            } catch (Exception erro) {
                throw new RuntimeException("Erro 22" + erro);
            }
        %>
    </body>
</html>
