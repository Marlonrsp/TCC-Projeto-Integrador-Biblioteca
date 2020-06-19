package Dao;

import Model.Emprestimo;
import Model.LogRenovacao;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;

public class LogRenovacaoDao {

	private Connection conn;
	private PreparedStatement stmt;
	private Statement st;
	private ResultSet rs;
	private ArrayList<LogRenovacao> listaRenovar = new ArrayList<>();

	public LogRenovacaoDao() {
		conn = new ConnectionFactory().getConexao();
	}

	public void inserir(LogRenovacao renovar) {
		String sql = "INSERT INTO LogRenovacao (id_emprestimo, data_geracao, data_Nova_Devolucao)" + "VALUES (?,?,?)";
		try {
			stmt = conn.prepareStatement(sql);
                        stmt.setInt(1, renovar.getId_emprestimo());
			stmt.setDate(2, (Date) (renovar.getData_geracao()));
			stmt.setDate(3, (Date) (renovar.getData_Nova_Devolucao()));
			stmt.execute();
			stmt.close();
		} catch (Exception erro) {
			throw new RuntimeException("Erro Insert LogRenovacao: " + erro);
		}
	}

	public void alterar(LogRenovacao renovar) {
		String sql = "UPDATE LogRenovacao SET data_Nova_Devolucao WHERE id_logRenovacao = ?";
		try {
			stmt = conn.prepareStatement(sql);
            stmt.setInt(1, renovar.getId_emprestimo());
			stmt.setDate(2, (Date) (renovar.getData_geracao()));
			stmt.setDate(3, (Date) (renovar.getData_Nova_Devolucao()));
			stmt.setInt(4, renovar.getId_logRenovacao());
			stmt.execute();
			stmt.close();
		} catch (Exception erro) {
			throw new RuntimeException("Erro Update LogRenovacao: " + erro);
		}
	}

	public void excluir(int valor) {
		String sql = "DELETE FROM LogRenovacao WHERE id_logRenovacao= " + valor;
		try {
			st = conn.createStatement();
			st.execute(sql);
			st.close();
		} catch (Exception erro) {
			throw new RuntimeException("Erro Delete LogRenovacao: " + erro);
		}
	}

	public ArrayList<LogRenovacao> listarTodosLogRenovacao() {
		String sql = "SELECT * FROM LogRenovacao";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				LogRenovacao renovar = new LogRenovacao();
				renovar.setId_logRenovacao(rs.getInt("id_logRenovacao"));
                                renovar.setId_emprestimo(rs.getInt("id_emprestimo"));
				renovar.setData_geracao(rs.getDate("data_geracao"));
				renovar.setData_Nova_Devolucao(rs.getDate("data_Nova_Devolucao"));
				listaRenovar.add(renovar);
			}
		} catch (Exception erro) {
			throw new RuntimeException("Erro ListarTodos LogRenovacao: " + erro);
		}
		return listaRenovar;
	}

	public ArrayList<LogRenovacao> listarTodosIdEmprestimo(String valor) {
		String sql = "SELECT * FROM LogRenovacao WHERE id_emprestimo LIKE '%" + valor + "%' ";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				LogRenovacao renovar = new LogRenovacao();
				renovar.setId_logRenovacao(rs.getInt("id_logRenovacao"));
                                renovar.setId_emprestimo(rs.getInt("id_emprestimo"));
				renovar.setData_geracao(rs.getDate("data_geracao"));
				renovar.setData_Nova_Devolucao(rs.getDate("data_Nova_Devolucao"));
				listaRenovar.add(renovar);
			}

		} catch (Exception erro) {
			throw new RuntimeException("Erro ListarTodosData LogRenovacao: " + erro);
		}
		return listaRenovar;
	}
}
