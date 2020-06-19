<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Date"%>
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
                LogRenovacao lgr = new LogRenovacao();
                LogRenovacaoDao lgrd = new LogRenovacaoDao();

                String data_geracao = request.getParameter("data_geracao");
                String data_Nova_Devolucao = request.getParameter("data_Nova_Devolucao");
                int id_emprestimo = Integer.parseInt(request.getParameter("id_emprestimo"));

                if (request.getParameter("id_emprestimo").equals("") || data_geracao.equals("") || data_Nova_Devolucao.equals("")) {
                    out.print("<script>alert('Campos obrigatórios!');</script>");
                    response.sendRedirect("alteraRenovar.jsp");
                } else {
                    lgr.setData_geracao(Date.valueOf(request.getParameter("data_geracao")));
                    lgr.setData_Nova_Devolucao(Date.valueOf(request.getParameter("data_Nova_Devolucao")));
                    lgr.setId_emprestimo(Integer.parseInt(request.getParameter("id_emprestimo")));
                    lgr.setId_logRenovacao(Integer.parseInt(request.getParameter("id_logRenovacao")));
                    lgrd.alterar(lgr);
                    out.print("<script>alert('Atualizado com sucesso');</script>");
                    out.print("<script>window.location.href='renovacao.jsp'</script>");
                }

            } catch (Exception erro) {
                throw new RuntimeException("Erro alterar Renovacao");
            }

        %>
    </body>
</html>