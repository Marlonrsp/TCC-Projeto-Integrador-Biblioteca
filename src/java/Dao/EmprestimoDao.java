package Dao;

import Model.Emprestimo;
import Model.Exemplares;
import Model.Usuario;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;



public class EmprestimoDao {

    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Emprestimo> listaEmprestimo = new ArrayList<>();

    public EmprestimoDao() {
        conn = new ConnectionFactory().getConexao();
    }
    
    
    public void inserir(Emprestimo emprestimo) {
        String sql = "INSERT INTO emprestimo (id_usuario, id_exemplares,cod_Controle_Exemplar, data_emprestimo, data_devolucao)"
                + "VALUES (?,?,?,?,?)";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, emprestimo.getId_usuario());
            stmt.setInt(2, emprestimo.getId_exemplares());
            stmt.setInt(3, emprestimo.getCod_Controle_Exemplar());
            stmt.setDate(4, (Date) emprestimo.getData_emprestimo());
            stmt.setDate(5, (Date) emprestimo.getData_devolucao());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro Insert Emprestimo: " + erro);
        }
    }

    public void alterar(Emprestimo emprestimo) {
        String sql = "UPDATE emprestimo SET id_usuario = ?, id_exemplares = ?, cod_Controle_Exemplar = ?"
                + "data_emprestimo = ?"
                + ", data_devolucao = ? WHERE id_emprestimo = ?";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, emprestimo.getId_usuario());
            stmt.setInt(2, emprestimo.getId_exemplares());
            stmt.setInt(3, emprestimo.getCod_Controle_Exemplar());
            stmt.setDate(4, (Date) emprestimo.getData_emprestimo());
            stmt.setDate(5, (Date) emprestimo.getData_devolucao());
            stmt.setInt(6, emprestimo.getId_emprestimo());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro Update Emprestimo: " + erro);
        }
    }

    public void excluir(int valor) {
        String sql = "DELETE FROM emprestimo WHERE id_emprestimo= " + valor;
        try {
            st = conn.createStatement();
            st.execute(sql);
            st.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro Delete Emprestimo: " + erro);
        }
    }

    public ArrayList<Emprestimo> listarTodosEmprestimo() {
        String sql = "SELECT * FROM emprestimo ";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Emprestimo emprestimo = new Emprestimo();
                emprestimo.setId_emprestimo(rs.getInt("id_emprestimo"));
                emprestimo.setId_usuario(rs.getInt("id_usuario"));
                emprestimo.setId_exemplares(rs.getInt("id_exemplares"));
                emprestimo.setCod_Controle_Exemplar(rs.getInt("cod_Controle_Exemplar"));
                emprestimo.setData_emprestimo(rs.getDate("data_emprestimo"));
                emprestimo.setData_devolucao(rs.getDate("data_devolucao"));
                listaEmprestimo.add(emprestimo);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro ListarTodos Emprestimo" + erro);
        }
        return listaEmprestimo;
    }

    public ArrayList<Emprestimo> listarTodosData(String valor) {
        String sql = "SELECT * FROM emprestimo WHERE id_exemplares LIKE '%" + valor + "%' ";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Emprestimo emprestimo = new Emprestimo();
                emprestimo.setId_emprestimo(rs.getInt("id_emprestimo"));
                emprestimo.setId_usuario(rs.getInt("id_usuario"));
                emprestimo.setId_exemplares(rs.getInt("id_exemplares"));
                emprestimo.setCod_Controle_Exemplar(rs.getInt("cod_Controle_Exemplar"));
                emprestimo.setData_emprestimo(rs.getDate("data_emprestimo"));
                emprestimo.setData_devolucao(rs.getDate("data_devolucao"));
                listaEmprestimo.add(emprestimo);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro ListarTodosExemplares do Emprestimo: " + erro);
        }
        return listaEmprestimo;
    }
 
    public boolean verificarEmprestimo(int limite_livros, int id_emprestimo, int id_usuario) throws Exception {
        String sql = "SELECT * FROM emprestimo WHERE id_empretimo = '" + id_emprestimo + "' and id_usuario = '" + id_usuario + "' ";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        if (limite_livros <= 3) {
            System.out.println("Emprestimo feito com sucesso");
        } else {
            System.out.println("A reserva de exemplares emprestados atingiu o limite");
        }
        return false;
    }
    
}
