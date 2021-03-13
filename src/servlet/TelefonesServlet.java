package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanCursoJsp;
import beans.Telefones;
import dao.DaoTelefones;
import dao.DaoUsuario;

@WebServlet("/salvarTelefones")
public class TelefonesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuario daoUsuario = new DaoUsuario();

	private DaoTelefones daoTelefones = new DaoTelefones();

	public TelefonesServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String acao = request.getParameter("acao");

			if (acao.endsWith("addFone")) {

				String user = request.getParameter("user");

				BeanCursoJsp usuario = daoUsuario.consultar(user);

				request.getSession().setAttribute("userEscolhido", usuario);
				request.setAttribute("userEscolhido", usuario);

				RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
				request.setAttribute("telefones", daoTelefones.listar(usuario.getId()));
				// request.setAttribute("msg", "Salvo com sucesso");
				// request.setAttribute("userEscolhido", user);
				view.forward(request, response);

			} else if (acao.endsWith("deleteFone")) {
				String foneId = request.getParameter("telefoneId");
				daoTelefones.deletar(foneId);

				BeanCursoJsp beanCursoJsp = (BeanCursoJsp) request.getSession().getAttribute("userEscolhido");

				RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
				request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));
				view.forward(request, response);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			BeanCursoJsp beanCursoJsp = (BeanCursoJsp) request.getSession().getAttribute("userEscolhido");

			String numero = request.getParameter("numero");

			String tipo = request.getParameter("tipo");

			Telefones telefones = new Telefones();

			telefones.setNumero(numero);
			telefones.setTipo(tipo);
			telefones.setUsuario(beanCursoJsp.getId());

			daoTelefones.salvar(telefones);

			request.getSession().setAttribute("userEscolhido", beanCursoJsp);
			request.setAttribute("userEscolhido", beanCursoJsp);

			RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");

			request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));

			request.setAttribute("msg", "Salvo com sucesso");

			view.forward(request, response);
			

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
