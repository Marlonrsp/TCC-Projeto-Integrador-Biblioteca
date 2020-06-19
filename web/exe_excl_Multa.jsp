<%@page import="Dao.MultaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                MultaDao mut = new MultaDao();
                int id_multa = Integer.parseInt(request.getParameter("id_multa"));
                mut.excluir(id_multa);
                out.print("<script>alert('Registro de Multa foi excluído');</script>");
                out.print("<script>window.location.href='index.jsp'</script>");
            } catch (Exception erro) {
                throw new RuntimeException("Erro no executar excluir Multa: " + erro);
            }
        %>
    </body>
</html>
