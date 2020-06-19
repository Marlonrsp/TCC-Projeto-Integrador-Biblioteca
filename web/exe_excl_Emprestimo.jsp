<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.EmprestimoDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                EmprestimoDao emp = new EmprestimoDao();
                int id_emprestimo = Integer.parseInt(request.getParameter("id_emprestimo"));
                emp.excluir(id_emprestimo);
                out.print("<script>alert('Emprestimo excluido!');</script>");
                out.print("<script>window.location.href='emprestimo.jsp'</script>");
            } catch (Exception erro) {
                throw new RuntimeException("Erro 26" + erro);
            }

        %>
    </body>
</html>
