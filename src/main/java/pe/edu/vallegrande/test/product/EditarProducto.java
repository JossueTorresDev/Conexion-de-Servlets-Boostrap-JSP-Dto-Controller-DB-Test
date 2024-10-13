package pe.edu.vallegrande.test.product;

import pe.edu.vallegrande.Controller.ProductController;
import pe.edu.vallegrande.dto.Product;

public class EditarProducto {

    public static void main(String[] args) {
        ProductController productController = new ProductController();

        // Datos del producto a actualizar
        Product productoEditado = new Product();
        productoEditado.setId(6); // ID del producto que deseas editar
        productoEditado.setProductName("Vidalito Galletas");
        productoEditado.setDescription("Galletas con chispas de chocolate");
        productoEditado.setPurchasePrice(200.00);
        productoEditado.setSalePrice(350.99);

        productController.editarProducto(productoEditado);
    }
}
