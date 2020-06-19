<%@page import="Dao.ExemplaresDao"%>
<%@page import="Model.Exemplares"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            Exemplares exe = new Exemplares();
            ExemplaresDao exem = new ExemplaresDao();

            int cod_Controle_Exemplar = Integer.parseInt(request.getParameter("cod_Controle_Exemplar"));
            int id_exemplares = Integer.parseInt(request.getParameter("id_exemplares"));

            try {
                if (request.getParameter("cod_Controle_Exemplar").equals("")) {
                    out.print("<script>alert('Campos obrigatórios!');</script>");
                    response.sendRedirect("exemplares.jsp");
                } else {
                    exe.setCod_Controle_Exemplar(Integer.parseInt(request.getParameter("cod_Controle_Exemplar")));
                    exe.setId_exemplares(Integer.parseInt(request.getParameter("id_exemplares")));
                    exem.alterar(exe);
                    response.sendRedirect("exemplares.jsp");
                }
            } catch (Exception erro) {
                throw new RuntimeException("Erro executa alterar Exemplares: " + erro);
            }
        %>
    </body>
</html>
