<%@page import="Dao.MultaDao"%>
<%@page import="Model.Multa"%>
<%@page import="java.sql.Date"%>
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
                Multa mul = new Multa();
                MultaDao mut = new MultaDao();

                float valor = Float.parseFloat(request.getParameter("valor"));
                String data_emissao = request.getParameter("data_emissao");
                int id_emprestimo = Integer.parseInt(request.getParameter("id_emprestimo"));
                int id_multa = Integer.parseInt(request.getParameter("id_multa"));

                if (data_emissao.equals("")) {
                    out.print("<script>alert('Campos obrigatórios!');</script>");
                    response.sendRedirect("index.jsp");
                } else {
                    mul.setValor(Float.parseFloat(request.getParameter("valor")));
                    mul.setData_emissao(Date.valueOf(request.getParameter("data_emissao")));
                    mul.setId_emprestimo(Integer.parseInt(request.getParameter("id_emprestimo")));
                    mul.setId_multa(Integer.parseInt(request.getParameter("id_multa")));
                    mut.alterar(mul);
                    out.print("<script>alert('Atualizado com sucesso');</script>");
                    out.print("<script>window.location.href='index.jsp'</script>");
                }
            } catch (Exception erro) {
                throw new RuntimeException("Erro ao executar alterar Multa: " + erro);
            }

        %>
    </body>
</html>
