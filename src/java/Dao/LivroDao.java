package Dao;

import Model.Livro;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;

public class LivroDao {

    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Livro> listaLivro = new ArrayList<>();

    public LivroDao() {
        conn = new ConnectionFactory().getConexao();
    }

    public void inserir(Livro livro) {
        String sql = "INSERT INTO livros (titulo_livro, autor_livro,"
                + " editora_livro, genero_livro,"
                + "numPaginas) VALUE (?,?,?,?,?)";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, livro.getTitulo_livro());
            stmt.setString(2, livro.getAutor_livro());
            stmt.setString(3, livro.getEditora_livro());
            stmt.setString(4, livro.getGenero_livro());
            stmt.setInt(5, livro.getNumPaginas());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro Insert Livros: " + erro);
        }
    }

    public void alterar(Livro livro) {
        String sql = "UPDATE livros SET titulo_livro = ?,"
                + "autor_livro = ?, editora_livro = ?,"
                + "genero_livro = ?, numPaginas = ? WHERE id_livro = ?";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, livro.getTitulo_livro());
            stmt.setString(2, livro.getAutor_livro());
            stmt.setString(3, livro.getEditora_livro());
            stmt.setString(4, livro.getGenero_livro());
            stmt.setInt(5, livro.getNumPaginas());
            stmt.setInt(6, livro.getId_livro());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro Update Livros: " + erro);
        }
    }

    public void excluir(int valor) {
        String sql = "DELETE FROM livros WHERE id_livro= " + valor;
        try {
            st = conn.createStatement();
            st.execute(sql);
            st.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro Delete Livros: " + erro);
        }
    }

    public ArrayList<Livro> listarTodosLivro() {
        String sql = "SELECT * FROM livros ";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Livro livro = new Livro();
                livro.setId_livro(rs.getInt("id_livro"));
                livro.setTitulo_livro(rs.getString("titulo_livro"));
                livro.setAutor_livro(rs.getString("autor_livro"));
                livro.setEditora_livro(rs.getString("editora_livro"));
                livro.setGenero_livro(rs.getString("genero_livro"));
                livro.setNum_paginas(rs.getInt("numPaginas"));
                listaLivro.add(livro);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro ListarTodos Livros: " + erro);
        }
        return listaLivro;
    }

    public ArrayList<Livro> listarTodosTitulo(String valor) {
        String sql = "SELECT * FROM livros WHERE titulo_livro LIKE '%" + valor + "%' ";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Livro livro = new Livro();
                livro.setId_livro(rs.getInt("id_livro"));
                livro.setTitulo_livro(rs.getString("titulo_livro"));
                livro.setAutor_livro(rs.getString("autor_livro"));
                livro.setEditora_livro(rs.getString("editora_livro"));
                livro.setGenero_livro(rs.getString("genero_livro"));
                livro.setNum_paginas(rs.getInt("numPaginas"));
                listaLivro.add(livro);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro ListarTodosTitulo Livros: " + erro);
        }
        return listaLivro;
    }
    
   
}
