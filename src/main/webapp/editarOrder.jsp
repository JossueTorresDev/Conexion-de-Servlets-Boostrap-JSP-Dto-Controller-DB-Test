<%@ page import="pe.edu.vallegrande.dto.Order" %>
<%@ page import="pe.edu.vallegrande.Controller.OrderController" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Editar Pedido</title>

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
            margin-left: 250px;
        }

        /* Navbar */
        .navbar {
            background-color: #343a40;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Card Shadows */
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Form input styles */
        .form-control {
            border-radius: 5px;
            padding: 10px;
            font-size: 1rem;
        }

        .form-label {
            font-weight: bold;
            font-size: 1rem;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            padding: 10px 20px;
            font-size: 1rem;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            padding: 10px 20px;
            font-size: 1rem;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            padding: 10px 20px;
            font-size: 1rem;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            padding: 10px 20px;
            font-size: 1rem;
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
            <a href="listadoOrder.jsp" class="list-group-item list-group-item-action active">Pedidos</a>
            <a href="nuevaMarca.jsp" class="list-group-item list-group-item-action">Marcas</a>
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
            <h1 class="mt-4">Editar Pedido</h1>

            <!-- Cargar datos del pedido -->
            <%
                int orderId = Integer.parseInt(request.getParameter("id"));
                OrderController orderController = new OrderController();
                Order order = orderController.buscarPedidoPorId(orderId);
            %>

            <!-- Formulario para editar el pedido -->
            <div class="card mb-4">
                <div class="card-header">
                    Editar Pedido
                </div>
                <div class="card-body">
                    <form action="OrderServlet" method="post">
                        <input type="hidden" name="action" value="edit">
                        <input type="hidden" name="id" value="<%= order.getId() %>">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="name" class="form-label">Nombre del Cliente</label>
                                <input type="text" class="form-control" id="name" name="name" value="<%= order.getName() %>" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="phone" class="form-label">Teléfono</label>
                                <input type="text" class="form-control" id="phone" name="phone" value="<%= order.getPhone() %>" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="address" class="form-label">Dirección</label>
                                <input type="text" class="form-control" id="address" name="address" value="<%= order.getAddress() %>" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="productCodeOrName" class="form-label">Producto</label>
                                <input type="text" class="form-control" id="productCodeOrName" name="productCodeOrName" value="<%= order.getProductCodeOrName() %>" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 mb-3">
                                <label for="quantity" class="form-label">Cantidad</label>
                                <input type="number" class="form-control" id="quantity" name="quantity" value="<%= order.getQuantity() %>" required>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="price" class="form-label">Precio</label>
                                <input type="number" step="0.01" class="form-control" id="price" name="price" value="<%= order.getPrice() %>" required>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="subtotal" class="form-label">Subtotal</label>
                                <input type="number" step="0.01" class="form-control" id="subtotal" name="subtotal" value="<%= order.getSubtotal() %>" required>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success">Guardar Cambios</button>
                        <a href="listadoOrder.jsp" class="btn btn-secondary">Cancelar</a>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
