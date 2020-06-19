<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.UsuarioDao"%>
<%@page import="Model.Usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            try {
                UsuarioDao uso = new UsuarioDao();
                int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
                uso.excluir(id_usuario);
                out.print("<script>alert('Registro de usuário foi excluído');</script>");
                out.print("<script>window.location.href='listaUsuarios.jsp'</script>");
            } catch (Exception erro) {
                throw new RuntimeException("Erro executa_excluir_usuario: " + erro);
            }
        %>
    </body>
</html>
