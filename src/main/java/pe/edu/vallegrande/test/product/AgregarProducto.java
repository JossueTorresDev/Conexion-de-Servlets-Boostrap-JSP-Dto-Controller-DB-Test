package pe.edu.vallegrande.test.product;

import pe.edu.vallegrande.Controller.ProductController;
import pe.edu.vallegrande.dto.Product;

public class AgregarProducto {

    public static void main(String[] args) {
        ProductController productController = new ProductController();

        // Crear un nuevo producto
        Product nuevoProducto = new Product();
        nuevoProducto.setProductName("mondonguito");
        nuevoProducto.setDescription("Monitor de 24 pulgadas, resolución Full HD");
        nuevoProducto.setPurchasePrice(120.50);
        nuevoProducto.setSalePrice(200.99);

        productController.agregarProducto(nuevoProducto);
    }
}
