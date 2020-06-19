package Model;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Emprestimo {

    private int id_emprestimo;
    private Date data_emprestimo;
    private Date data_devolucao;
    private int limite_livos;
    private int id_usuario;
    private int id_exemplares;
    private int cod_Controle_Exemplar;

    
    public int getId_emprestimo() {
        return id_emprestimo;
    }

    public void setId_emprestimo(int id_emprestimo) {
        this.id_emprestimo = id_emprestimo;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_exemplares() {
        return id_exemplares;
    }

    public void setId_exemplares(int id_exemplares) {
        this.id_exemplares = id_exemplares;
    }

    public int getCod_Controle_Exemplar() {
        return cod_Controle_Exemplar;
    }

    public void setCod_Controle_Exemplar(int cod_Controle_Exemplar) {
        this.cod_Controle_Exemplar = cod_Controle_Exemplar;
    }
    /**
     *${date}${time}
     * @return 
     */
    public Date getData_emprestimo() {
        return data_emprestimo;
    }
    /**
     *${date}${time}
     * @param data_emprestimo
     */
    public void setData_emprestimo(Date data_emprestimo) {
        this.data_emprestimo = data_emprestimo;
    }
    /**
     *${date}${time}
     * @return 
     */
    public Date getData_devolucao() {
        return data_devolucao;
    }
    /**
     *${date}${time}
     * @param data_devolucao
     */
    public void setData_devolucao(Date data_devolucao) {
        this.data_devolucao = data_devolucao;
    }

    public int getLimite_livos() {
        return limite_livos;
    }

    public void setLimite_livos(int limite_livos) {
        this.limite_livos = limite_livos;
    }
      
    
}
