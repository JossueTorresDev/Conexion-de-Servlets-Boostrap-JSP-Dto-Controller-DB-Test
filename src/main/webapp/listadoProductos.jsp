<%@ page import="pe.edu.vallegrande.dto.Product" %>
<%@ page import="pe.edu.vallegrande.Controller.ProductController" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Listado de Productos</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <!-- Custom CSS -->
    <style>
        /* General Styles */
        body, html {
            height: 100%;
        }

        #wrapper {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        #sidebar-wrapper {
            min-width: 250px;
            max-width: 250px;
            background-color: #1e2125;
            padding-top: 20px;
            position: fixed;
            height: 100%;
        }

        #sidebar-wrapper .list-group-item {
            background-color: #1e2125;
            color: #c9c9c9;
            border: none;
            padding: 15px;
            font-size: 1.1em;
        }

        #sidebar-wrapper .list-group-item:hover {
            background-color: #343a40;
            color: #fff;
        }

        #sidebar-wrapper .list-group-item.active {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        /* Page Content */
        #page-content-wrapper {
            width: 100%;
            padding: 20px;
            margin-left: 250px; /* Make room for the sidebar */
        }

        /* Navbar */
        .navbar {
            background-color: #343a40;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Table Styles */
        .table {
            border-collapse: separate;
            border-spacing: 0 15px;
        }

        .table td, .table th {
            padding: 12px;
            vertical-align: middle;
        }

        .table thead th {
            background-color: #007bff;
            color: white;
            border: none;
        }

        .table tbody tr {
            background-color: #f8f9fa;
            border-radius: 12px;
        }

        .table tbody tr:hover {
            background-color: #e9ecef;
        }

        .table tbody td {
            border-top: none;
            border-bottom: none;
        }

        /* Card Shadows */
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>

<!-- Sidebar -->
<div id="wrapper">
    <div id="sidebar-wrapper" class="bg-dark">
        <div class="sidebar-heading text-center py-4 text-light fs-4 fw-bold">
            <i class="fas fa-shopping-cart me-2"></i>AkiExpress
        </div>
        <div class="list-group list-group-flush">
            <a href="listadoProductos.jsp" class="list-group-item list-group-item-action active">Inicio</a>
            <a href="listadoProductos.jsp" class="list-group-item list-group-item-action">Producto</a>
            <a href="listadoProductos.jsp" class="list-group-item list-group-item-action">Listado de Productos</a>
            <a href="listadoOrder.jsp" class="list-group-item list-group-item-action">Order</a>
        </div>
    </div>

    <!-- Page Content -->
    <div id="page-content-wrapper">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand ms-3" href="#">AkiExpress</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">Salir</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Content -->
        <div class="container-fluid px-4">
            <h1 class="mt-4">Listado de Productos</h1>

            <!-- Card para agregar un nuevo producto -->
            <div class="card mb-4">
                <div class="card-header">
                    Registrar Producto
                </div>
                <div class="card-body">
                    <form action="ProductServlet" method="post">
                        <input type="hidden" name="action" value="add">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="productName">Nombre del Producto</label>
                                <input type="text" class="form-control" id="productName" name="productName" placeholder="Nombre del producto" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="description">Descripción</label>
                                <input type="text" class="form-control" id="description" name="description" placeholder="Descripción del producto" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="purchasePrice">Precio de Compra</label>
                                <input type="number" step="0.01" class="form-control" id="purchasePrice" name="purchasePrice" placeholder="Precio de compra" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="salePrice">Precio de Venta</label>
                                <input type="number" step="0.01" class="form-control" id="salePrice" name="salePrice" placeholder="Precio de venta" required>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success">Agregar Producto</button>
                    </form>
                </div>
            </div>

            <!-- Card para listado de productos -->
            <div class="card mb-4">
                <div class="card-header">
                    Productos
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Precio de Compra</th>
                                <th>Precio de Venta</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                ProductController productController = new ProductController();
                                List<Product> products = productController.listarTodos();

                                if (products.isEmpty()) {
                            %>
                            <tr>
                                <td colspan="6" class="text-center">No hay productos disponibles por el momento.</td>
                            </tr>
                            <%
                            } else {
                                for (Product product : products) {
                            %>
                            <tr>
                                <td><%= product.getId() %></td>
                                <td><%= product.getProductName() %></td>
                                <td><%= product.getDescription() %></td>
                                <td><%= product.getPurchasePrice() %></td>
                                <td><%= product.getSalePrice() %></td>
                                <td>
                                    <!-- Botón Editar -->
                                    <a href="editarProducto.jsp?id=<%= product.getId() %>" class="btn btn-primary btn-sm">Editar</a>
                                    <!-- Botón Eliminar -->
                                    <a href="ProductServlet?action=delete&id=<%= product.getId() %>" class="btn btn-danger btn-sm">Eliminar</a>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
