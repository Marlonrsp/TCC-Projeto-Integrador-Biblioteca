<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="Dao.LogRenovacaoDao"%>
<%@page import="Model.LogRenovacao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <body>
        <%
            try {
                LogRenovacaoDao lgrd = new LogRenovacaoDao();
                int id_logRenovacao = Integer.parseInt(request.getParameter("id_logRenovacao"));
                lgrd.excluir(id_logRenovacao);
                out.print("<script>alert('Registro de usuário foi excluído');</script>");
                out.print("<script>window.location.href='renovacao.jsp'</script>");
            } catch (Exception erro) {
                throw new RuntimeException("Erro excluir Renovar");
            }
        %>
    </body>
</html>