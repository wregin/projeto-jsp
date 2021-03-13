package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Produto;
import dao.DaoProduto;


@WebServlet("/salvarProduto")
public class ServletProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoProduto daoProduto = new DaoProduto();

	public ServletProduto() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String acao = request.getParameter("acao");

			String produto = request.getParameter("produto");
			
			RequestDispatcher view = request.getRequestDispatcher("/cadastroProduto.jsp");

			if (acao.equalsIgnoreCase("delete")) {
				
				daoProduto.deletar(produto);

				request.setAttribute("produtos", daoProduto.listar());

			} else if (acao.equalsIgnoreCase("editar")) {
				
				Produto prod = daoProduto.consultar(produto);

				request.setAttribute("produto", prod);

			} else if (acao.equalsIgnoreCase("Listartodos")) {
				
				request.setAttribute("produtos", daoProduto.listar());
				
			}
			

			request.setAttribute("categorias", daoProduto.listaCategorias());
			view.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao != null && acao.equalsIgnoreCase("reset")) {
			try {
				RequestDispatcher view = request.getRequestDispatcher("/cadastroProduto.jsp");
				request.setAttribute("produtos", daoProduto.listar());
				view.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {

			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String valorTemp = request.getParameter("valor");
			String categoria = request.getParameter("categoria_id");
			
			valorTemp = valorTemp.replaceAll("\\.", "");
			valorTemp = valorTemp.replaceAll("\\,", ".");
			
			
			double quantidade = Double.parseDouble(request.getParameter("quantidade"));
			double valor = Double.parseDouble(valorTemp);

			Produto produto = new Produto();
			produto.setId(!id.isEmpty() ? Long.parseLong(id) : null);
			produto.setNome(nome);
			produto.setQuantidade(quantidade);
			produto.setValor(valor);
			produto.setCategoria_id(Long.parseLong(categoria));
			

			try {

				String msg = null;
				boolean podeInserir = true;
				boolean inserido = false;

				if (id == null || id.isEmpty() && !daoProduto.validarProduto(nome)) {
					// request.setAttribute("msg", "Login do usuário já existe, escolha outro!");
					msg = "Produto já existe!";
					podeInserir = false;
				} 
				
				if (msg != null) {
					request.setAttribute("msg", msg);
				}

				if (id == null || id.isEmpty() && daoProduto.validarProduto(nome) && podeInserir) {

					daoProduto.salvar(produto);
					inserido = true;

				}
				
				if (id != null && !id.isEmpty() && podeInserir && !daoProduto.validarProduto(nome)) {

					daoProduto.atualizar(produto);
				} else if (!inserido){
					msg = "Produto já existe, escolha outro!";
					podeInserir = false;
					request.setAttribute("msg", msg);
				}
				
				if (!podeInserir) {
					request.setAttribute("produtos", produto);
				}

				RequestDispatcher view = request.getRequestDispatcher("/cadastroProduto.jsp");
				request.setAttribute("produtos", daoProduto.listar());
				request.setAttribute("categorias", daoProduto.listaCategorias());
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
