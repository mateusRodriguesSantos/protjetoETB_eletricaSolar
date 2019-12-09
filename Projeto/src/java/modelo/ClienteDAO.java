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
public class ClienteDAO extends DataSource{
    
    public void inserir(Cliente c) throws Exception{
        this.conectar();
        String sql = "INSERT INTO cliente(id,nome,cpf,telefone,endereco) VALUES (?,?,?,?,?)";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setInt(1,c.getId());
        st.setString(2, c.getNome());
        st.setString(3, c.getCpf());
        st.setInt(4, c.getTelefone());
        st.setString(5,c.getEndereco());
        st.execute();
        this.desconectar();
    }
    
    public ArrayList<Cliente> listar() throws Exception{
        this.conectar();
        String sql = "SELECT * FROM cliente";
        PreparedStatement st = conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        
        while(rs.next()){
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setCpf(rs.getString("cpf"));
            c.setTelefone(rs.getInt("telefone"));
            c.setEndereco(rs.getString("endereco"));
            lista.add(c);
        }   
        this.desconectar();
        return lista;
    }
    
    public ArrayList<Cliente> carregarPorNome(String nome) throws Exception{
        this.conectar();
        String sql = "SELECT * FROM cliente WHERE nome LIKE ?" ;
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, "%"+nome+"%");
        ResultSet rs = st.executeQuery();
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        
        while(rs.next()){            
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setCpf(rs.getString("cpf"));
            c.setTelefone(rs.getInt("telefone"));
            c.setEndereco(rs.getString("endereco"));
            lista.add(c);
        }   
        this.desconectar();
        return lista;
    }
    
    public Cliente carregarPorId(int id) throws Exception{
        this.conectar();
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE id = ?" ;
        PreparedStatement st = conn.prepareStatement(sql);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        while(rs.next()){
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setCpf(rs.getString("cpf"));
            c.setTelefone(rs.getInt("telefone"));
            c.setEndereco(rs.getString("endereco"));
        }   
        this.desconectar();
        return c;
    }
    
    public void alterar(Cliente c) throws Exception{
        this.conectar();
        String sql = "UPDATE cliente SET nome=?,cpf=?,telefone=?,endereco=? WHERE id = ?" ;
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, c.getNome());
        st.setString(2, c.getCpf());
        st.setInt(3, c.getTelefone());
        st.setString(4, c.getEndereco());
        st.setInt(5,c.getId()); 
        st.execute();
        this.desconectar();
    }
        
    public void excluir(int id) throws Exception{
        this.conectar();
        String sql = "DELETE FROM cliente WHERE id=?" ;
        PreparedStatement st = conn.prepareStatement(sql);
        st.setInt(1,id); 
        st.execute();
        this.desconectar();
    }
}
