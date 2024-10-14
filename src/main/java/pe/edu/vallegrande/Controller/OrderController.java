package pe.edu.vallegrande.Controller;

import pe.edu.vallegrande.dto.Order;
import pe.edu.vallegrande.db.ConexionDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderController {

    /* Listar todos los pedidos */
    public List<Order> listarTodos() {
        List<Order> orderList = new ArrayList<>();
        try (Connection connection = ConexionDB.getConnection();
             Statement stmt = connection.createStatement()) {

            String query = "SELECT * FROM orders";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Order order = new Order(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("productCodeOrName"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getDouble("subtotal")
                );
                orderList.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderList;
    }

    /* Agregar un nuevo pedido */
    public void agregarPedido(Order order) {
        String query = "INSERT INTO orders (name, phone, address, productCodeOrName, quantity, price, subtotal) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, order.getName());
            pstmt.setString(2, order.getPhone());
            pstmt.setString(3, order.getAddress());
            pstmt.setString(4, order.getProductCodeOrName());
            pstmt.setInt(5, order.getQuantity());
            pstmt.setDouble(6, order.getPrice());
            pstmt.setDouble(7, order.getSubtotal());

            pstmt.executeUpdate();
            System.out.println("Pedido creado exitosamente.");
        } catch (Exception e) {
            System.out.println("Error al crear el pedido.");
            e.printStackTrace();
        }
    }

    /* Editar un pedido existente */
    public void editarPedido(Order order) {
        String query = "UPDATE orders SET name = ?, phone = ?, address = ?, productCodeOrName = ?, quantity = ?, price = ?, subtotal = ? WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, order.getName());
            pstmt.setString(2, order.getPhone());
            pstmt.setString(3, order.getAddress());
            pstmt.setString(4, order.getProductCodeOrName());
            pstmt.setInt(5, order.getQuantity());
            pstmt.setDouble(6, order.getPrice());
            pstmt.setDouble(7, order.getSubtotal());
            pstmt.setInt(8, order.getId());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Pedido actualizado exitosamente.");
            } else {
                System.out.println("No se encontró un pedido con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al actualizar el pedido.");
            e.printStackTrace();
        }
    }

    /* Buscar un pedido por ID */
    public Order buscarPedidoPorId(int id) {
        Order order = null;
        String query = "SELECT * FROM orders WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                order = new Order(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("productCodeOrName"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getDouble("subtotal")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    /* Eliminar un pedido */
    public void eliminarPedido(int id) {
        String query = "DELETE FROM orders WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Pedido eliminado exitosamente.");
            } else {
                System.out.println("No se encontró un pedido con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al eliminar el pedido.");
            e.printStackTrace();
        }
    }
}
