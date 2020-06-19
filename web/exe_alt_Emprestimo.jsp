<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Emprestimo"%>
<%@page import="Dao.EmprestimoDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Emprestimo em = new Emprestimo();
            EmprestimoDao emp = new EmprestimoDao();
            String data_emprestimo = request.getParameter("data_emprestimo");
            String data_devolucao = request.getParameter("data_devolucao");
            int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
            int id_exemplares = Integer.parseInt(request.getParameter("id_exemplares"));
            int cod_Controle_Exemplar = Integer.parseInt(request.getParameter("cod_Controle_Exemplar"));
            int id_emprestimo = Integer.parseInt(request.getParameter("id_emprestimo"));

            try {
                if (data_emprestimo.equals("")
                        || data_devolucao.equals("")) {
                    out.print("<script>alert('Campos obrigatórios!');</script>");
                    response.sendRedirect("index.jsp");
                } else {
                    em.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));
                    em.setId_exemplares(Integer.parseInt(request.getParameter("id_exemplares")));
                    em.setCod_Controle_Exemplar(Integer.parseInt(request.getParameter("cod_Controle_Exemplar")));
                    em.setData_emprestimo(Date.valueOf(request.getParameter("data_emprestimo")));
                    em.setData_devolucao(Date.valueOf(request.getParameter("data_devolucao")));
                    em.setId_emprestimo(Integer.parseInt(request.getParameter("id_emprestimo")));
                    emp.alterar(em);
                    response.sendRedirect("emprestimos.jsp");
                }
            } catch (Exception erro) {
                throw new RuntimeException("Erro 25" + erro);
            }
        %>
    </body>
</html>
