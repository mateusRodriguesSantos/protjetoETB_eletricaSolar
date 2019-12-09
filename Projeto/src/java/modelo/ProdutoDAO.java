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
public class ProdutoDAO extends DataSource{
        public void inserir(Produto p) throws Exception{
        this.conectar();
        String sql = "INSERT INTO produto(nome,marca,descricao,preco_un,qtdEstoque,link_imagem) VALUES (?,?,?,?,?,?)";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, p.getNome());
        st.setString(2, p.getMarca());
        st.setString(3, p.getDescricao());
        st.setDouble(4,p.getPreco_un());
        st.setDouble(5,p.getQtdEstoque());
        st.setString(6,p.getLink_imagem());
        st.execute();
        this.desconectar();
    }
    
    public ArrayList<Produto> listar() throws Exception{
        this.conectar();
        String sql = "SELECT * FROM produto";
        PreparedStatement st = conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        ArrayList<Produto> lista = new ArrayList<Produto>();
        
        while(rs.next()){
            Produto p = new Produto();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setMarca(rs.getString("marca"));
            p.setDescricao(rs.getString("descricao"));
            p.setPreco_un(rs.getDouble("preco_un"));
            p.setQtdEstoque(rs.getDouble("qtdEstoque"));
            p.setLink_imagem(rs.getString("link_imagem"));
            lista.add(p);
        }   
        this.desconectar();
        return lista;
    }
    
    public Produto carregarPorId(int id) throws Exception{
        this.conectar();
        Produto p = new Produto();
        String sql = "SELECT * FROM produto WHERE id = ?" ;
        PreparedStatement st = conn.prepareStatement(sql);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        while(rs.next()){
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setMarca(rs.getString("marca"));
            p.setDescricao(rs.getString("descricao"));
            p.setPreco_un(rs.getDouble("preco_un"));
            p.setQtdEstoque(rs.getDouble("qtdEstoque"));
            p.setLink_imagem(rs.getString("link_imagem"));
        }   
        this.desconectar();
        return p;
    }
    
    public ArrayList<Produto> carregarPorNome(String nome) throws Exception{
        this.conectar();
        ArrayList<Produto> lista = new ArrayList<Produto>();
        String sql = "SELECT * FROM produto WHERE nome like ?" ;
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, '%'+nome+'%');
        ResultSet rs = st.executeQuery();
        while(rs.next()){
            Produto p = new Produto();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setMarca(rs.getString("marca"));
            p.setDescricao(rs.getString("descricao"));
            p.setPreco_un(rs.getDouble("preco_un"));
            p.setQtdEstoque(rs.getDouble("qtdEstoque"));
            p.setLink_imagem(rs.getString("link_imagem"));
            lista.add(p);
        }   
        this.desconectar();
        return lista;
    }
    
    public void alterar(Produto p) throws Exception{
        this.conectar();
        String sql = "UPDATE produto SET nome=?,marca=?,descricao=?,preco_un=?,qtdEstoque=?,link_imagem=? WHERE id=?" ;
        PreparedStatement st = conn.prepareStatement(sql);    
        st.setString(1, p.getNome());
        st.setString(2, p.getMarca());
        st.setString(3, p.getDescricao());
        st.setDouble(4,p.getPreco_un());
        st.setDouble(5,p.getQtdEstoque());
        st.setString(6,p.getLink_imagem());
        st.setInt(7,p.getId());
        st.execute();
        this.desconectar();
    }
    
    public void baixaNoEstoque(ArrayList<ItemVenda> carrinho) throws Exception{    
        for(ItemVenda item:carrinho){
        Produto p = new Produto();
        p = carregarPorId(item.getProduto().getId());
        this.conectar();
            String sql = "UPDATE produto SET qtdEstoque=? WHERE id=?" ;
            PreparedStatement st = conn.prepareStatement(sql);    
            st.setDouble(1, p.getQtdEstoque() - item.getQuantidade());
            st.setInt(2, item.getProduto().getId());
            st.execute();
        this.desconectar();
        }   
    }
    
    public void altaNoEstoque(ArrayList<ItemVenda> carrinho) throws Exception{    
        for(ItemVenda item:carrinho){
        Produto p = new Produto();
        p = carregarPorId(item.getProduto().getId());
        this.conectar();
            String sql = "UPDATE produto SET qtdEstoque=? WHERE id=?" ;
            PreparedStatement st = conn.prepareStatement(sql);    
            st.setDouble(1, p.getQtdEstoque() + item.getQuantidade());
            st.setInt(2, item.getProduto().getId());
            st.execute();
        this.desconectar();
        }   
    }
        
    public void excluir(int id) throws Exception{
        this.conectar();
        String sql = "DELETE FROM produto WHERE id=?" ;
        PreparedStatement st = conn.prepareStatement(sql);
        st.setInt(1,id); 
        st.execute();
        this.desconectar();
    }
}
