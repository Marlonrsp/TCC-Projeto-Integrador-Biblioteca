package Dao;

import Model.Emprestimo;
import Model.Multa;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;

public class MultaDao {

    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Multa> listaMulta = new ArrayList<>();

    public MultaDao() {
        conn = new ConnectionFactory().getConexao();
    }
    
    public void multar(){
        Date data_devolucao = null; Date data_emissao = null; float valor = 0; 
        if(data_emissao.after(data_devolucao)){
           valor = (float) (valor * 0.60);
        }
    }
    
    public void inserir(Multa multa) {
        String sql = "INSERT INTO multa (valor,data_emissao, id_emprestimo) VALUE (?,?,?)";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setFloat(1, multa.getValor());
            stmt.setDate(2, (Date) multa.getData_emissao());
            stmt.setInt(3, multa.getId_emprestimo());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro inserir multa: " + erro);
        }
    }

    public void alterar(Multa multa) {
        String sql = "UPDATE multa SET valor = ?, data_emissao = ? id_emprestimo = ? where id_multa = ?";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setFloat(1, multa.getValor());
            stmt.setDate(2, (Date) multa.getData_emissao());
            stmt.setInt(3, multa.getId_emprestimo());
            stmt.setInt(4, multa.getId_multa());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro alterar multa: " + erro);
        }
    }

    public void excluir(int valor) {
        String sql = "DELETE FROM multa where id_multa= " + valor;
        try {
            st = conn.createStatement();
            st.execute(sql);
            st.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro excluir multa: " + erro);
        }
    }

    public ArrayList<Multa> listarTodasMultas() {
        String sql = "SELECT * FROM multa";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Multa multa = new Multa();
                multa.setId_multa(rs.getInt("id_multa"));
                multa.setValor(rs.getFloat("valor"));
                multa.setData_emissao(rs.getDate("data_emissao"));
                multa.setId_emprestimo(rs.getInt("id_emprestimo"));
                listaMulta.add(multa);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro listar todas as multas: " + erro);
        }
        return listaMulta;
    }
    
    public ArrayList<Multa> listarTodosValor(String valor) {
        String sql = "SELECT * FROM multa WHERE valor LIKE '%" + valor + "%' ";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Multa multa = new Multa();
                multa.setId_multa(rs.getInt("id_multa"));
                multa.setValor(rs.getFloat("valor"));
                multa.setData_emissao(rs.getDate("data_emissao"));
                multa.setId_emprestimo(rs.getInt("id_emprestimo"));
                listaMulta.add(multa);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro listar todas as multas pelo valor: " + erro);
        }
        return listaMulta;
    }    
}
