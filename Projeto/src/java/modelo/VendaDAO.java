/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class VendaDAO extends DataSource{
    
    public ArrayList<Venda> listar() throws Exception{
        this.conectar();
        ArrayList<Venda> lista = new ArrayList<Venda>();
        String sql = "SELECT * FROM venda";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        
        while(rs.next()){
            Venda v = new Venda();
            v.setId(rs.getInt("id"));
            v.setData_venda(rs.getDate("data_venda"));
            v.setData_cancelamento(rs.getDate("data_cancelamento"));
            v.setData_pagamento(rs.getDate("data_pagamento"));
            TipoDePagamentoDAO tpDAO = new TipoDePagamentoDAO();
            v.setTipoDePagamento(tpDAO.carregarPorId(rs.getInt("idtipo_de_pagamento")));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
            FuncionarioDAO fDAO = new FuncionarioDAO();
            v.setFuncionario(fDAO.carregarPorId(rs.getInt("id_funcionario")));
            v.setCarrinho(carregaItensVenda(v.getId()));
            lista.add(v);
        }
        this.desconectar();
        return lista;
    }
    
    
    public int inserir(Venda v) throws Exception{
        this.conectar();
        String sql = "INSERT INTO venda (idtipo_de_pagamento,data_venda,id_funcionario,id_cliente) VALUES(?,now(),?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
        pstm.setInt(1, v.getTipoDePagamento().getId());
        pstm.setInt(2, v.getFuncionario().getId());
        pstm.setInt(3, v.getCliente().getId());
        pstm.execute();
        ResultSet rs = pstm.getGeneratedKeys();
        if(rs.next()){
            v.setId(rs.getInt(1));
        }
        for(ItemVenda item:v.getCarrinho()){
            String sql_item = "INSERT INTO item_venda (id_venda,id_produto,quantidade,preco) VALUES(?,?,?,?)";
            PreparedStatement pstm_item = conn.prepareStatement(sql_item);
            pstm_item.setInt(1, v.getId());
            pstm_item.setInt(2, item.getProduto().getId());
            pstm_item.setDouble(3, item.getQuantidade());
            pstm_item.setDouble(4, item.getPreco());
            pstm_item.execute();
        }
        this.desconectar();
        return v.getId();
    }
    
    
    public ArrayList<Venda> listarVendaCliente(String nome) throws Exception{   
        int i=0;
        ArrayList<Cliente> listaCliente = new ArrayList<Cliente>();
        ArrayList<Venda> lista = new ArrayList<Venda>();
        ClienteDAO cDAO = new ClienteDAO();
        listaCliente = cDAO.carregarPorNome(nome);
        
        for(Cliente c:listaCliente){
        this.conectar();    
                String sql = "SELECT * FROM venda WHERE id_cliente=?";
                PreparedStatement pstm = conn.prepareStatement(sql);
                pstm.setInt(1, c.getId());
                ResultSet rs = pstm.executeQuery();
                
                while(rs.next()){
                    Venda v = new Venda();
                    v.setId(rs.getInt("id"));
                    v.setData_venda(rs.getDate("data_venda"));
                    v.setData_cancelamento(rs.getDate("data_cancelamento"));
                    v.setData_pagamento(rs.getDate("data_pagamento"));
                    TipoDePagamentoDAO tpDAO = new TipoDePagamentoDAO();
                    v.setTipoDePagamento(tpDAO.carregarPorId(rs.getInt("idtipo_de_pagamento")));
                    v.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
                    FuncionarioDAO fDAO = new FuncionarioDAO();
                    v.setFuncionario(fDAO.carregarPorId(rs.getInt("id_funcionario")));
                    v.setCarrinho(carregaItensVenda(v.getId()));
                    lista.add(v);
                }
         this.desconectar();       
        }
        return lista;
    }
    
    public ArrayList<Venda> listarPorDataCancelamento(String data_cancelamento) throws Exception{
        this.conectar();
        ArrayList<Venda> lista = new ArrayList<Venda>();
        String sql = "SELECT * FROM venda WHERE data_cancelamento LIKE ? ";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, "%"+data_cancelamento+"%");
        ResultSet rs = pstm.executeQuery();
        
        while(rs.next()){
            Venda v = new Venda();
            v.setId(rs.getInt("id"));
            v.setData_venda(rs.getDate("data_venda"));
            v.setData_cancelamento(rs.getDate("data_cancelamento"));
            v.setData_pagamento(rs.getDate("data_pagamento"));
            TipoDePagamentoDAO tpDAO = new TipoDePagamentoDAO();
            v.setTipoDePagamento(tpDAO.carregarPorId(rs.getInt("idtipo_de_pagamento")));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
            FuncionarioDAO fDAO = new FuncionarioDAO();
            v.setFuncionario(fDAO.carregarPorId(rs.getInt("id_funcionario")));
            v.setCarrinho(carregaItensVenda(v.getId()));
            lista.add(v);
        }
        this.desconectar();
        return lista;
    }
    
    public ArrayList<Venda> listarPorDataVenda(String data_venda) throws Exception{
        this.conectar();
        ArrayList<Venda> lista = new ArrayList<Venda>();
        String sql = "SELECT * FROM venda WHERE data_venda LIKE ? ";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, "%"+data_venda+"%");
        ResultSet rs = pstm.executeQuery();
        
        while(rs.next()){
            Venda v = new Venda();
            v.setId(rs.getInt("id"));
            v.setData_venda(rs.getDate("data_venda"));
            v.setData_cancelamento(rs.getDate("data_cancelamento"));
            v.setData_pagamento(rs.getDate("data_pagamento"));
            TipoDePagamentoDAO tpDAO = new TipoDePagamentoDAO();
            v.setTipoDePagamento(tpDAO.carregarPorId(rs.getInt("idtipo_de_pagamento")));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
            FuncionarioDAO fDAO = new FuncionarioDAO();
            v.setFuncionario(fDAO.carregarPorId(rs.getInt("id_funcionario")));
            v.setCarrinho(carregaItensVenda(v.getId()));
            lista.add(v);
        }
        this.desconectar();
        return lista;
    }
    
    public Venda carregarPorId(int id) throws Exception{
        this.conectar();
        Venda v = new Venda();
        String sql = "SELECT * FROM venda WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            v.setId(rs.getInt("id"));
            v.setData_venda(rs.getDate("data_venda"));
            v.setData_cancelamento(rs.getDate("data_cancelamento"));
            v.setData_pagamento(rs.getDate("data_pagamento"));
            TipoDePagamentoDAO tpDAO = new TipoDePagamentoDAO();
            v.setTipoDePagamento(tpDAO.carregarPorId(rs.getInt("idtipo_de_pagamento")));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
            FuncionarioDAO fDAO = new FuncionarioDAO();
            v.setFuncionario(fDAO.carregarPorId(rs.getInt("id_funcionario")));
            v.setCarrinho(carregaItensVenda(id));
        }
        this.desconectar();
        return v;
    }
    
    public ArrayList<ItemVenda> carregaItensVenda(int id_venda) throws Exception{
        this.conectar();
        ArrayList<ItemVenda> lista = new ArrayList<ItemVenda>();
        String sql = "SELECT * FROM item_venda WHERE id_venda=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_venda);
        ResultSet rs = pstm.executeQuery();
        while(rs.next()){
            ItemVenda item = new ItemVenda();
            item.setId(rs.getInt("id"));
            ProdutoDAO pDAO = new ProdutoDAO();
            item.setProduto(pDAO.carregarPorId(rs.getInt("id_produto")));
            item.setQuantidade(rs.getDouble("quantidade"));
            item.setPreco(rs.getDouble("preco"));
            lista.add(item);
        }
        this.desconectar();
        return lista;
    }
    
    public void cancelarVenda(int id)throws Exception{
        this.conectar();
        String sql = "UPDATE venda SET data_cancelamento=now() WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.executeUpdate();
        this.desconectar();
    }
    
}
