package pe.edu.vallegrande.servlet;

import pe.edu.vallegrande.Controller.OrderController;
import pe.edu.vallegrande.dto.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

    private OrderController orderController = new OrderController();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            // Eliminar pedido
            int orderId = Integer.parseInt(request.getParameter("id"));
            orderController.eliminarPedido(orderId);
            response.sendRedirect("listadoOrder.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Agregar un nuevo pedido
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String productCodeOrName = request.getParameter("productCodeOrName");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            double subtotal = Double.parseDouble(request.getParameter("subtotal"));

            Order nuevoPedido = new Order();
            nuevoPedido.setName(name);
            nuevoPedido.setPhone(phone);
            nuevoPedido.setAddress(address);
            nuevoPedido.setProductCodeOrName(productCodeOrName);
            nuevoPedido.setQuantity(quantity);
            nuevoPedido.setPrice(price);
            nuevoPedido.setSubtotal(subtotal);

            orderController.agregarPedido(nuevoPedido);
            response.sendRedirect("listadoOrder.jsp");

        } else if ("edit".equals(action)) {
            // Editar un pedido existente
            int orderId = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String productCodeOrName = request.getParameter("productCodeOrName");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            double subtotal = Double.parseDouble(request.getParameter("subtotal"));

            Order pedidoEditado = new Order();
            pedidoEditado.setId(orderId);
            pedidoEditado.setName(name);
            pedidoEditado.setPhone(phone);
            pedidoEditado.setAddress(address);
            pedidoEditado.setProductCodeOrName(productCodeOrName);
            pedidoEditado.setQuantity(quantity);
            pedidoEditado.setPrice(price);
            pedidoEditado.setSubtotal(subtotal);

            orderController.editarPedido(pedidoEditado);
            response.sendRedirect("listadoOrder.jsp");
        }
    }
}
