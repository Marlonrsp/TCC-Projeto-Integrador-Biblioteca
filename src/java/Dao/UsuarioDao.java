package Dao;

import Model.Usuario;
import java.util.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.time.LocalDate;

public class UsuarioDao {

    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;
    private Statement st;
    private ArrayList<Usuario> listaUsuario = new ArrayList<>();

    public UsuarioDao() {
        conn = new ConnectionFactory().getConexao();
    }

    public void inserir(Usuario usuario) {       
        String sql = "INSERT INTO usuario (nome_usuario,telefone_usuario,"
                + "dataNascimento_usuario, "
                + "endereco_usuario, email_usuario, senha_usuario) "
                + "VALUES (?,?,?,?,?,?)";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getNome_usuario());
            stmt.setString(2, usuario.getTelefone_usuario());
            stmt.setDate(3, (Date) usuario.getDataNascimento_usuario());
            stmt.setString(4, usuario.getEndereco_usuario());
            stmt.setString(5, usuario.getEmail_usuario());
            stmt.setString(6, usuario.getSenha_usuario());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro Insert Usuario: " + erro);
        }
    }

    public void alterar(Usuario usuario) {
        String sql = "UPDATE usuario SET nome_usuario = ?,telefone_usuario = ?,"
                + "dataNascimento_usuario = ?, endereco_usuario = ?,"
                + "email_usuario = ?, senha_usuario = ? WHERE id_usuario = ?";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getNome_usuario());
            stmt.setString(2, usuario.getTelefone_usuario());
            stmt.setDate(3, (Date) (usuario.getDataNascimento_usuario()));
            stmt.setString(4, usuario.getEndereco_usuario());
            stmt.setString(5, usuario.getEmail_usuario());
            stmt.setString(6, usuario.getSenha_usuario());
            stmt.setInt(7, usuario.getId_usuario());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro Update Usuario: " + erro);
        }
    }
    
    public boolean autenticarLogin(String email_usuario, String senha_usuario) throws Exception {
        String sql = "SELECT * FROM usuario WHERE email_usuario = '" + email_usuario + "' and senha_usuario = '"
                + senha_usuario + "'";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return true;
        } else {
            return false;
        }
    }

    public void excluir(int valor) {
        String sql = "DELETE FROM usuario WHERE id_usuario= " + valor;
        try {
            st = conn.createStatement();
            st.execute(sql);
            st.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro Delete usuario : " + erro);
        }
    }

    public ArrayList listarTodosUsuario() {
        String sql = "SELECT * FROM usuario";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setNome_usuario(rs.getString("nome_usuario"));
                usuario.setTelefone_usuario(rs.getString("telefone_usuario"));
                usuario.setDataNascimento_usuario(rs.getDate("dataNascimento_usuario"));
                usuario.setEndereco_usuario(rs.getString("endereco_usuario"));
                usuario.setEmail_usuario(rs.getString("email_usuario"));
                listaUsuario.add(usuario);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro ListarTodos Usuario: " + erro);
        }
        return listaUsuario;
    }

    public ArrayList listarTodosNome(String valor) {
        String sql = "SELECT * FROM usuario WHERE nome_usuario LIKE '%" + valor + "%' ";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setNome_usuario(rs.getString("nome_usuario"));
                usuario.setTelefone_usuario(rs.getString("telefone_usuario"));
                usuario.setDataNascimento_usuario(rs.getDate("dataNascimento_usuario"));
                usuario.setEndereco_usuario(rs.getString("endereco_usuario"));
                usuario.setEmail_usuario(rs.getString("email_usuario"));
                listaUsuario.add(usuario);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro ListarTodosNome Usuario: " + erro);
        }
        return listaUsuario;
    }

           


           
}
