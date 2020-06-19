<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.LivroDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            try {
                LivroDao liv = new LivroDao();
                int id_livro = Integer.parseInt(request.getParameter("id_livro"));
                liv.excluir(id_livro);
                out.print("<script>alert('Livro excluído');</script>");
                out.print("<script>window.location.href='index.jsp'</script>");
            } catch (Exception erro) {
                throw new RuntimeException("Erro 23" + erro);
            }
        %>
    </body>
</html>
