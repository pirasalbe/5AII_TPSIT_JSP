/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Jamazon;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pirasalbe
 */
public class ordine {
    public int cod;
    public String cf;
    public String indirizzo;
    public String pagamento;
    public Date data;
    public List<prodotto> prodotti = new ArrayList<>();
    
    public ordine(int cod, String cf, String indirizzo, String pagamento, Date data){
        this.cod=cod;
        this.cf=cf;
        this.indirizzo=indirizzo;
        this.pagamento=pagamento;
        this.data=data;
    }
}
