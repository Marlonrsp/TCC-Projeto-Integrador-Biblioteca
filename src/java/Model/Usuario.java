package Model;

import java.util.Date;
import java.util.Objects;

public class Usuario {

    private int id_usuario;
    private String nome_usuario;
    private String telefone_usuario;
    private Date dataNascimento_usuario;
    private String endereco_usuario;
    private String email_usuario;
    private String senha_usuario;
    private int tipoUsuario;
    
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNome_usuario() {
        return nome_usuario;
    }

    public void setNome_usuario(String nome_usuario) {
        this.nome_usuario = nome_usuario;
    }

    public String getTelefone_usuario() {
        return telefone_usuario;
    }

    public void setTelefone_usuario(String telefone_usuario) {
        this.telefone_usuario = telefone_usuario;
    }

    public Date getDataNascimento_usuario() {
        return dataNascimento_usuario;
    }

    public void setDataNascimento_usuario(Date dataNascimento_usuario) {
        this.dataNascimento_usuario = dataNascimento_usuario;
    }

    public String getEndereco_usuario() {
        return endereco_usuario;
    }

    public void setEndereco_usuario(String endereco_usuario) {
        this.endereco_usuario = endereco_usuario;
    }

    public String getEmail_usuario() {
        return email_usuario;
    }

    public void setEmail_usuario(String email_usuario) {
        this.email_usuario = email_usuario;
    }

    public String getSenha_usuario() {
        return senha_usuario;
    }

    public void setSenha_usuario(String senha_usuario) {
        this.senha_usuario = senha_usuario;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id_usuario=" + id_usuario + ", nome_usuario=" + nome_usuario + ", telefone_usuario=" + telefone_usuario + ", dataNascimento_usuario=" + dataNascimento_usuario + ", endereco_usuario=" + endereco_usuario + ", email_usuario=" + email_usuario + ", senha_usuario=" + senha_usuario + ", tipoUsuario=" + tipoUsuario + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 53 * hash + this.id_usuario;
        hash = 53 * hash + Objects.hashCode(this.nome_usuario);
        hash = 53 * hash + Objects.hashCode(this.telefone_usuario);
        hash = 53 * hash + Objects.hashCode(this.dataNascimento_usuario);
        hash = 53 * hash + Objects.hashCode(this.endereco_usuario);
        hash = 53 * hash + Objects.hashCode(this.email_usuario);
        hash = 53 * hash + Objects.hashCode(this.senha_usuario);
        hash = 53 * hash + this.tipoUsuario;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Usuario other = (Usuario) obj;
        if (this.id_usuario != other.id_usuario) {
            return false;
        }
        if (this.tipoUsuario != other.tipoUsuario) {
            return false;
        }
        if (!Objects.equals(this.nome_usuario, other.nome_usuario)) {
            return false;
        }
        if (!Objects.equals(this.telefone_usuario, other.telefone_usuario)) {
            return false;
        }
        if (!Objects.equals(this.endereco_usuario, other.endereco_usuario)) {
            return false;
        }
        if (!Objects.equals(this.email_usuario, other.email_usuario)) {
            return false;
        }
        if (!Objects.equals(this.senha_usuario, other.senha_usuario)) {
            return false;
        }
        if (!Objects.equals(this.dataNascimento_usuario, other.dataNascimento_usuario)) {
            return false;
        }
        return true;
    }

  

}
