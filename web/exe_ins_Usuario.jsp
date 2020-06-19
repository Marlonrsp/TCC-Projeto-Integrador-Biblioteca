<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Usuario"%>
<%@page import="Dao.UsuarioDao"%>
<%@page import="java.sql.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            try {
                Usuario usu = new Usuario();
                UsuarioDao usd = new UsuarioDao();

                String nome_usuario = request.getParameter("nome_usuario");
                String telefone_usuario = request.getParameter("telefone_usuario");
                String dataNascimento_usuario = request.getParameter("dataNascimento_usuario");
                String endereco_usuario = request.getParameter("endereco_usuario");
                String email_usuario = request.getParameter("email_usuario");
//              String senha_usuario = request.getParameter("senha_usuario");

                if (nome_usuario.equals("")
                        || telefone_usuario.equals("")
                        || dataNascimento_usuario.equals("")
                        || endereco_usuario.equals("")
                        || email_usuario.equals("") /*||senha_usuario.equals("")*/) {
                    out.print("<script>alert('Campos Obrigatórios!');</script>");
                    response.sendRedirect("index.jsp");
                } else {
                    usu.setNome_usuario(request.getParameter("nome_usuario"));
                    usu.setTelefone_usuario(request.getParameter("telefone_usuario"));
                    usu.setDataNascimento_usuario(Date.valueOf(request.getParameter("dataNascimento_usuario")));
                    usu.setEndereco_usuario(request.getParameter("endereco_usuario"));
                    usu.setEmail_usuario(request.getParameter("email_usuario"));
//                  usu.setSenha_usuario(request.getParameter("senha_usuario"));
                    usd.inserir(usu);
                    out.print("<script>alert('Cadastrado com sucesso');</script>");
                    out.print("<script>window.location.href='listaUsuarios.jsp'</script>");
                }
            } catch (Exception erro) {
                throw new RuntimeException("Erro executa inserir Usuario: " + erro);
            }
        %>
    </body>
</html>
