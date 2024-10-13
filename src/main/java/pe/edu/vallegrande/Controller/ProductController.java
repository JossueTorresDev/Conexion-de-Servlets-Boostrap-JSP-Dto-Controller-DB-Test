package pe.edu.vallegrande.Controller;

import pe.edu.vallegrande.dto.Product;
import pe.edu.vallegrande.db.ConexionDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductController {

    /* Listar todos los productos */
    public List<Product> listarTodos() {
        List<Product> productList = new ArrayList<>();
        try (Connection connection = ConexionDB.getConnection();
             Statement stmt = connection.createStatement()) {

            String query = "SELECT * FROM products";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("product_name"),
                        rs.getString("description"),
                        rs.getDouble("purchase_price"),
                        rs.getDouble("sale_price")
                );
                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }

    /* Agregar un nuevo producto */
    public void agregarProducto(Product product) {
        String query = "INSERT INTO products (product_name, description, purchase_price, sale_price) VALUES (?, ?, ?, ?)";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, product.getProductName());
            pstmt.setString(2, product.getDescription());
            pstmt.setDouble(3, product.getPurchasePrice());
            pstmt.setDouble(4, product.getSalePrice());

            pstmt.executeUpdate();
            System.out.println("Producto creado exitosamente.");
        } catch (Exception e) {
            System.out.println("Error al crear el producto.");
            e.printStackTrace();
        }
    }

    /* Editar un producto existente */
    public void editarProducto(Product product) {
        String query = "UPDATE products SET product_name = ?, description = ?, purchase_price = ?, sale_price = ? WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, product.getProductName());
            pstmt.setString(2, product.getDescription());
            pstmt.setDouble(3, product.getPurchasePrice());
            pstmt.setDouble(4, product.getSalePrice());
            pstmt.setInt(5, product.getId());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Producto actualizado exitosamente.");
            } else {
                System.out.println("No se encontró un producto con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al actualizar el producto.");
            e.printStackTrace();
        }
    }

    public Product buscarProductoPorId(int id) {
        Product product = null;
        String query = "SELECT * FROM products WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                product = new Product(
                        rs.getInt("id"),
                        rs.getString("product_name"),
                        rs.getString("description"),
                        rs.getDouble("purchase_price"),
                        rs.getDouble("sale_price")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }


    /* Eliminar un producto */
    public void eliminarProducto(int id) {
        String query = "DELETE FROM products WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Producto eliminado exitosamente.");
            } else {
                System.out.println("No se encontró un producto con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al eliminar el producto.");
            e.printStackTrace();
        }
    }
}
