<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Login - AkiExpress</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f4f7f6;
            font-family: 'Arial', sans-serif;
        }

        .login-container {
            margin-top: 5%;
            padding: 30px;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .login-btn {
            background-color: #007bff;
            border: none;
        }

        .login-btn:hover {
            background-color: #0056b3;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: none;
        }

        .form-header {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 20px;
            color: #333;
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="login-container">
                <h2 class="form-header text-center">Inicio de Sesión</h2>

                <!-- Login Form -->
                <form action="listadoProductos.jsp" method="post">
                    <div class="form-group">
                        <label for="username">Usuario</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Ingresa tu usuario" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Contraseña</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Ingresa tu contraseña" required>
                    </div>

                    <!-- Login Button -->
                    <button type="submit" class="btn btn-primary btn-block login-btn">Ingresar</button>

                    <!-- Error Message (optional) -->
                    <div class="form-footer">
                        <%
                            String error = (String) request.getAttribute("error");
                            if (error != null) {
                        %>
                        <div class="alert alert-danger mt-3">
                            <%= error %>
                        </div>
                        <% } %>
                    </div>
                </form>

                <!-- Footer Links -->
                <div class="form-footer">
                    <p>¿No tienes cuenta? <a href="register.jsp">Regístrate</a></p>
                    <p><a href="forgotPassword.jsp">¿Olvidaste tu contraseña?</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
