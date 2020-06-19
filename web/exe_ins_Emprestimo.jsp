<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="Model.Emprestimo"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Exemplares"%>
<%@page import="Dao.EmprestimoDao"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrando Emprestimo</title>
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

            try {
                if (    data_emprestimo.equals("")
                        || data_devolucao.equals("")) {
                    out.print("<script>alert('Campos obrigatórios!');</script>");
                    response.sendRedirect("emprestimos.jsp");
                } else {
                    em.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));
                    em.setId_exemplares(Integer.parseInt(request.getParameter("id_exemplares")));
                    em.setCod_Controle_Exemplar(Integer.parseInt(request.getParameter("cod_Controle_Exemplar")));
                    em.setData_emprestimo(Date.valueOf(request.getParameter("data_emprestimo")));
                    em.setData_devolucao(Date.valueOf(request.getParameter("data_devolucao")));
                    emp.inserir(em);
                    out.print("<script>alert('Emprestimo feito com Sucesso!');</script>");
                    out.print("<script>window.location.href='emprestimos.jsp'</script>");
                }
            } catch (Exception erro) {
                throw new RuntimeException("Erro realizar Emprestimo: " + erro);
            }
        %>
    </body>
</html>
