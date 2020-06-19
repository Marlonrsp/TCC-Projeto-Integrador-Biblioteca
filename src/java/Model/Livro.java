package Model;

public class Livro {

    private int id_livro;
    private String titulo_livro;
    private String autor_livro;
    private String editora_livro;
    private String genero_livro;
    private int numPaginas;
    private boolean status;
    
    public int getId_livro() {
        return id_livro;
    }

    public void setId_livro(int id_livro) {
        this.id_livro = id_livro;
    }

    public String getTitulo_livro() {
        return titulo_livro;
    }

    public void setTitulo_livro(String titulo_livro) {
        this.titulo_livro = titulo_livro;
    }

    public String getAutor_livro() {
        return autor_livro;
    }

    public void setAutor_livro(String autor_livro) {
        this.autor_livro = autor_livro;
    }

    public String getEditora_livro() {
        return editora_livro;
    }

    public void setEditora_livro(String editora_livro) {
        this.editora_livro = editora_livro;
    }

    public String getGenero_livro() {
        return genero_livro;
    }

    public void setGenero_livro(String categoria_livro) {
        this.genero_livro = categoria_livro;
    }

    public int getNumPaginas() {
        return numPaginas;
    }

    public void setNum_paginas(int num_paginas) {
        this.numPaginas = num_paginas;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    
    public void verificarDisponibilidade() {
        if (status) {
            System.out.println("Livro Disponivel");
        } else {
            System.out.println("Livro Indisponível!");
        }
    }

}
