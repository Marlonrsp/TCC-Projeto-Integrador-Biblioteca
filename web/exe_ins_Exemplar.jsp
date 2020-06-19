<%@page import="Dao.ExemplaresDao"%>
<%@page import="Model.Exemplares"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Exemplares exe = new Exemplares();
            ExemplaresDao exem = new ExemplaresDao();

            int cod_Controle_Exemplar = Integer.parseInt(request.getParameter("cod_Controle_Exemplar"));
            int id_livro = Integer.parseInt(request.getParameter("id_livro"));

            try {
                if (request.getParameter("cod_Controle_Exemplar").equals("")
                        || request.getParameter("id_livro").equals("")) {
                    out.print("<script>alert('Campos obrigatórios!');</script>");
                    response.sendRedirect("exemplares.jsp");
                } else {
                    exe.setCod_Controle_Exemplar(Integer.parseInt(request.getParameter("cod_Controle_Exemplar")));
                    exe.setId_livro(Integer.parseInt(request.getParameter("id_livro")));
                    exem.inserir(exe);
                    out.print("<script>alert('Exemplar cadastrado com Sucesso!');</script>");
                    out.print("<script>window.location.href='exemplares.jsp'</script>");
                }
            } catch (Exception erro) {
                throw new RuntimeException("Erro executa inserir Exemplar: " + erro);
            }

        %>
    </body>
</html>
