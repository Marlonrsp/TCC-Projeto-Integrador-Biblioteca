package Model;

import java.util.*;

public class LogRenovacao {

    private int id_logRenovacao;
    private Date data_geracao;
    private Date data_Nova_Devolucao;
    private int id_emprestimo;

    public int getId_logRenovacao() {
        return id_logRenovacao;
    }

    public void setId_logRenovacao(int id_logRenovacao) {
        this.id_logRenovacao = id_logRenovacao;
    }

    public Date getData_geracao() {
        return data_geracao;
    }

    public void setData_geracao(Date data_geracao) {
        this.data_geracao = data_geracao;
    }

    public Date getData_Nova_Devolucao() {
        return data_Nova_Devolucao;
    }

    public void setData_Nova_Devolucao(Date data_Nova_Devolucao) {
        this.data_Nova_Devolucao = data_Nova_Devolucao;
    }

    public int getId_emprestimo() {
        return id_emprestimo;
    }

    public void setId_emprestimo(int id_emprestimo) {
        this.id_emprestimo = id_emprestimo;
    }
        

        
        
}