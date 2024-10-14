package pe.edu.vallegrande.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Order {
    private int id;
    private String name;
    private String phone;
    private String address;
    private String productCodeOrName;
    private int quantity;
    private double price;
    private double subtotal;

    // Constructor completo
    public Order(int id, String name, String phone, String address, String productCodeOrName, int quantity, double price, double subtotal) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.productCodeOrName = productCodeOrName;
        this.quantity = quantity;
        this.price = price;
        this.subtotal = subtotal;
    }

    // Getters y setters...
}

