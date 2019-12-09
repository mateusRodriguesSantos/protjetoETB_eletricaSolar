/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class TipoDePagamentoDAO extends DataSource{
    
    public void inserir(TipoDePagamento tp) throws Exception{
        this.conectar();
        String sql = "INSERT INTO tipo_de_pagamento (id,nome,descricao,icone) VALUES (?,?,?,?)";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setInt(1,tp.getId());
        st.setString(2, tp.getNome());
        st.setString(3, tp.getDescricao());
        st.setString(4, tp.getIcone());
        st.execute();
        this.desconectar();
    }
    
    public ArrayList<TipoDePagamento> listar() throws Exception{
        this.conectar();
        String sql = "SELECT * FROM tipo_de_pagamento";
        PreparedStatement st = conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        ArrayList<TipoDePagamento> lista = new ArrayList<TipoDePagamento>();
        
        while(rs.next()){
            TipoDePagamento tp = new TipoDePagamento();
            tp.setId(rs.getInt("id"));
            tp.setNome(rs.getString("nome"));
            tp.setDescricao(rs.getString("descricao"));
            tp.setIcone(rs.getString("icone"));
            lista.add(tp);
        }   
        this.desconectar();
        return lista;
    }
    
    public TipoDePagamento carregarPorId(int id) throws Exception{
        this.conectar();
        TipoDePagamento tp = new TipoDePagamento();
        String sql = "SELECT * FROM tipo_de_pagamento WHERE id = ?" ;
        PreparedStatement st = conn.prepareStatement(sql);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        while(rs.next()){
            tp.setId(rs.getInt("id"));
            tp.setNome(rs.getString("nome"));
            tp.setDescricao(rs.getString("descricao"));
            tp.setIcone(rs.getString("icone"));
        }   
        this.desconectar();
        return tp;
    }
    
    public void alterar(TipoDePagamento tp) throws Exception{
        this.conectar();
        String sql = "UPDATE tipo_de_pagamento SET nome=?,descricao=?,icone=? WHERE id = ?" ;
        PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, tp.getNome());
            st.setString(2, tp.getDescricao());
            st.setString(3, tp.getIcone());
            st.setInt(4, tp.getId());
        st.execute();
        this.desconectar();
    }
        
    public void excluir(int id) throws Exception{
        this.conectar();
        String sql = "DELETE FROM tipo_de_pagamento WHERE id=?" ;
        PreparedStatement st = conn.prepareStatement(sql);
        st.setInt(1,id); 
        st.execute();
        this.desconectar();
    }
}
