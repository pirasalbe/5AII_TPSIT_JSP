/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Jamazon;

/**
 *
 * @author pirasalbe
 */
public class prodotto {
    public int cod;
    public String nome;
    public String descrizione;
    public float prezzo;
    
    public prodotto(int cod, String nome, String descrizione, float prezzo){
        this.cod=cod;
        this.nome=nome;
        this.descrizione=descrizione;
        this.prezzo=prezzo;
    }
}
