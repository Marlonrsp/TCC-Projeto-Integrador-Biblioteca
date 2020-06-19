package Dao;

import Model.Exemplares;
import Model.Livro;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;

public class ExemplaresDao {

    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Exemplares> listaExemplares = new ArrayList<>();

    public ExemplaresDao() {
        conn = new ConnectionFactory().getConexao();
    }

    public void inserir(Exemplares exemplar) {
        String sql = "INSERT INTO exemplares (cod_Controle_Exemplar, id_livro) VALUES (?,?)";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, exemplar.getCod_Controle_Exemplar());
            stmt.setInt(2, exemplar.getId_livro());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro Insert Exemplares: " + erro);
        }
    }

    public void alterar(Exemplares exemplar) {
        String sql = "UPDATE exemplares SET cod_Controle_Exemplar = ? WHERE id_exemplares = ?";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, exemplar.getCod_Controle_Exemplar());
            stmt.setInt(2, exemplar.getId_exemplares());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro UPDATE Exemplares: " + erro);
        }
    }

    public void excluir(int valor) {
        String sql = "DELETE FROM exemplares WHERE id_exemplares= " + valor;
        try {
            st = conn.createStatement();
            st.execute(sql);
            st.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro DELETE Exemplares: " + erro);
        }
    }
    
    public ArrayList<Exemplares> ListarTodos(){
        String sql = "SELECT * FROM exemplares";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Exemplares exemplar = new Exemplares();
                exemplar.setId_exemplares(rs.getInt("id_exemplares"));
                exemplar.setCod_Controle_Exemplar(rs.getInt("cod_Controle_Exemplar"));
                exemplar.setId_livro(rs.getInt("id_livro"));
                listaExemplares.add(exemplar);
            }
        }catch(Exception erro){
            throw new RuntimeException("Erro ListarTodos Exemplares: " + erro);
        }
        return listaExemplares;
    }
    
    public ArrayList<Exemplares> ListarTodosCodigoExemplar(String valor){
        String sql = "SELECT * FROM exemplares where cod_Controle_Exemplar LIKE '%" + valor + "%' ";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Exemplares exemplar = new Exemplares();
                exemplar.setId_exemplares(rs.getInt("id_exemplares"));
                exemplar.setCod_Controle_Exemplar(rs.getInt("cod_Controle_Exemplar"));
                exemplar.setId_livro(rs.getInt("id_livro"));
                listaExemplares.add(exemplar);
            }
        }catch(Exception erro){
            throw new RuntimeException("Erro ListarTodosCodigoExemplar: " + erro);
        }
        return listaExemplares;
    }
 
}
