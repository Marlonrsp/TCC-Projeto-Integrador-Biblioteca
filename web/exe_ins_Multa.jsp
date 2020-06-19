<%@page import="java.sql.Date"%>
<%@page import="Dao.MultaDao"%>
<%@page import="Model.Multa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserindo Multa</title>
    </head>
    <body>
        <%
            try {
                Multa mul = new Multa();
                MultaDao mut = new MultaDao();

                float valor = Float.parseFloat(request.getParameter("valor"));
                String data_emissao = request.getParameter("data_emissao");
                int id_emprestimo = Integer.parseInt(request.getParameter("id_emprestimo"));

                if (data_emissao.equals("")) {
                    out.print("<script>alert('Campos Obrigatórios!');</script>");
                    response.sendRedirect("multasEmp.jsp");
                } else {
                    mul.setValor(Float.parseFloat(request.getParameter("valor")));
                    mul.setData_emissao(Date.valueOf(request.getParameter("data_emissao")));
                    mul.setId_emprestimo(Integer.parseInt(request.getParameter("id_emprestimo")));
                    mut.inserir(mul);
                    out.print("<script>alert('Multa atribuída com sucesso');</script>");
                    out.print("<script>window.location.href='multasEmp.jsp'</script>");
                }
            } catch (Exception erro) {
                throw new RuntimeException("Erro ao executar inserir Multa: " + erro);
            }

        %>
    </body>
</html>
