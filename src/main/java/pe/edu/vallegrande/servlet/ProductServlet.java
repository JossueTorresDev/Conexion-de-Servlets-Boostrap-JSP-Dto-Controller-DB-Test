package pe.edu.vallegrande.Servlet;

import pe.edu.vallegrande.Controller.ProductController;
import pe.edu.vallegrande.dto.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

    private ProductController productController = new ProductController();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            // Eliminar producto
            int productId = Integer.parseInt(request.getParameter("id"));
            productController.eliminarProducto(productId);
            response.sendRedirect("listadoProductos.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Agregar un nuevo producto
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            double purchasePrice = Double.parseDouble(request.getParameter("purchasePrice"));
            double salePrice = Double.parseDouble(request.getParameter("salePrice"));

            Product nuevoProducto = new Product();
            nuevoProducto.setProductName(productName);
            nuevoProducto.setDescription(description);
            nuevoProducto.setPurchasePrice(purchasePrice);
            nuevoProducto.setSalePrice(salePrice);

            productController.agregarProducto(nuevoProducto);
            response.sendRedirect("listadoProductos.jsp");

        } else if ("edit".equals(action)) {
            // Editar un producto existente
            int productId = Integer.parseInt(request.getParameter("id"));
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            double purchasePrice = Double.parseDouble(request.getParameter("purchasePrice"));
            double salePrice = Double.parseDouble(request.getParameter("salePrice"));

            Product productoEditado = new Product();
            productoEditado.setId(productId);
            productoEditado.setProductName(productName);
            productoEditado.setDescription(description);
            productoEditado.setPurchasePrice(purchasePrice);
            productoEditado.setSalePrice(salePrice);

            productController.editarProducto(productoEditado);
            response.sendRedirect("listadoProductos.jsp");
        }
    }
}
