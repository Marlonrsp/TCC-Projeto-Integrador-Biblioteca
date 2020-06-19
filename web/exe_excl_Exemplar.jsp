<%@page import="Dao.ExemplaresDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            try {
                ExemplaresDao exem = new ExemplaresDao();
                int id_exemplares = Integer.parseInt(request.getParameter("id_exemplares"));
                exem.excluir(id_exemplares);
                out.print("<script>alert('Exemplar excluido!');</script>");
                out.print("<script>window.location.href='exemplares.jsp'</script>");
            } catch (Exception erro) {
                throw new RuntimeException("Erro executar excluir Exemplar: " + erro);
            }
        %>
    </body>
</html>
