package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Produto;
import beans.Telefones;
import connection.SingleConnection;

public class DaoTelefones {


	private Connection connection;

	public DaoTelefones() {
		connection = SingleConnection.getConnection();
	}

	public void salvar(Telefones telefones) {
		try {

			String sql = "insert into telefone(numero,tipo, usuario) values ( ?, ?, ?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, telefones.getNumero());
			insert.setString(2, telefones.getTipo());
			insert.setLong(3, telefones.getUsuario());			
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

	public List<Telefones> listar(Long user) throws Exception {
		
		List<Telefones> listar = new ArrayList<Telefones>();

		String sql = "select * from telefone where usuario = " + user;

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		
		while (resultSet.next()) {
			
			Telefones telefones = new Telefones();
			
			telefones.setId(resultSet.getLong("id"));
			telefones.setNumero(resultSet.getString("numero"));
			telefones.setTipo(resultSet.getString("tipo"));
			telefones.setUsuario(Long.parseLong(resultSet.getString("usuario")));

			listar.add(telefones);
		}
		return listar;
	}

	public void deletar(String id) {

		String sql = "delete from telefone where id = '" + id + "'";

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

	public Telefones consultar(String id) throws Exception {

		String sql = "select * from telefone where id = '" + id + "'";
		
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		
		if (resultSet.next()) {
			Telefones telefones = new Telefones();
			
			telefones.setId(resultSet.getLong("id"));
			telefones.setNumero(resultSet.getString("numero"));
			telefones.setTipo(resultSet.getString("tipo"));
			telefones.setUsuario(Long.parseLong(resultSet.getString("usuario")));

			return telefones;

		}

		return null;
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
