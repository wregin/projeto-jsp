package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanCategoria;
import beans.Produto;
import connection.SingleConnection;

public class DaoProduto {


	private Connection connection;

	public DaoProduto() {
		connection = SingleConnection.getConnection();
	}

	public void salvar(Produto produto) {
		try {

			String sql = "insert into produto(nome,quantidade, valor, categoria_id) values ( ?, ?, ?, ?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, produto.getNome());
			insert.setDouble(2, produto.getQuantidade());
			insert.setDouble(3, produto.getValor());	
			insert.setLong(4, produto.getCategoria_id());
			insert.execute();

		} catch (Exception e) {
			try {
				e.printStackTrace();
				connection.rollback();
			} catch (SQLException e1) {

				e1.printStackTrace();
			}
		}
	}

	public List<Produto> listar() throws Exception {
		
		List<Produto> listar = new ArrayList<Produto>();

		String sql = "select * from produto";

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		
		while (resultSet.next()) {
			
			Produto produto = new Produto();
			
			produto.setId(resultSet.getLong("id"));
			produto.setNome(resultSet.getString("nome"));
			produto.setQuantidade(Double.parseDouble(resultSet.getString("quantidade")));
			produto.setValor(Double.parseDouble(resultSet.getString("valor")));
			produto.setCategoria_id(resultSet.getLong("categoria_id"));

			listar.add(produto);
		}
		return listar;
	}
	
	public List<BeanCategoria> listaCategorias() throws Exception {
		List<BeanCategoria> retorno = new ArrayList<BeanCategoria>();
		
		String sql = "select * from categoria";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		
		while(resultSet.next()) {
			
			BeanCategoria categoria = new BeanCategoria();
			categoria.setId(resultSet.getLong("id"));
			categoria.setNome(resultSet.getString("nome"));
			
			retorno.add(categoria);
			
		}
		
		return retorno;
		
	}

	public void deletar(String id) {

		String sql = "delete from produto where id = '" + id + "'";

		try {
			PreparedStatement delete = connection.prepareStatement(sql);
			delete.execute();
		} catch (Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}

	}

	public Produto consultar(String id) throws Exception {

		String sql = "select * from produto where id = '" + id + "'";
		
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		
		if (resultSet.next()) {
			Produto produto = new Produto();
			
			produto.setId(resultSet.getLong("id"));
			produto.setNome(resultSet.getString("nome"));
			produto.setQuantidade(Double.parseDouble(resultSet.getString("quantidade")));
			produto.setValor(Double.parseDouble(resultSet.getString("valor")));
			produto.setCategoria_id(Long.parseLong(resultSet.getString("categoria_id")));

			return produto;

		}

		return null;
	}

	public void atualizar(Produto produto) {
		try {
			String sql = "update produto set nome = ?, quantidade = ?, valor = ?, categoria_id = ? where id = " + produto.getId();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, produto.getNome());
			preparedStatement.setDouble(2, produto.getQuantidade());
			preparedStatement.setDouble(3, produto.getValor());
			preparedStatement.setLong(4, produto.getCategoria_id());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}
	
	public boolean validarProduto(String nome) throws Exception {

		String sql = "select count(1) as qtd from produto where nome = '" + nome + "'";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {

			return resultSet.getInt("qtd") <= 0;

		}

		return false;
	}
//	
//	public boolean validarLoginUpdate(String login, String id) throws Exception {
//
//		if (id == "" || id.isEmpty()) {
//			id = "1";
//		}
//		
//		String sql = "select count(1) as qtd from usuario where login = '" + login + "' and id <> "+ id;
//		//System.out.println(sql);
//		PreparedStatement preparedStatement = connection.prepareStatement(sql);
//		ResultSet resultSet = preparedStatement.executeQuery();
//		if (resultSet.next()) {
//
//			return resultSet.getInt("qtd") <= 0;
//
//		}
//
//		return false;
//	}


	
}
