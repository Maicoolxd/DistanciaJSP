<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calcular Distancia Recorrida</title>
</head>
<body>
<h2>Calcular la Distancia Recorrida</h2>
<form method="post">
    <label for="velocidadInicial">Velocidad Inicial (m/s):</label>
    <input type="text" id="velocidadInicial" name="velocidadInicial"><br><br>
    <label for="velocidadFinal">Velocidad Final (m/s):</label>
    <input type="text" id="velocidadFinal" name="velocidadFinal"><br><br>
    <label for="tiempo">Tiempo (s):</label>
    <input type="text" id="tiempo" name="tiempo"><br><br>
    <input type="submit" value="Calcular">
</form>

<%
    // Obtener los parámetros del formulario
    String velocidadInicialStr = request.getParameter("velocidadInicial");
    String velocidadFinalStr = request.getParameter("velocidadFinal");
    String tiempoStr = request.getParameter("tiempo");

    if (velocidadInicialStr != null && !velocidadInicialStr.isEmpty() &&
            velocidadFinalStr != null && !velocidadFinalStr.isEmpty() &&
            tiempoStr != null && !tiempoStr.isEmpty()) {
        try {
            int velocidadInicial = Integer.parseInt(velocidadInicialStr);
            int velocidadFinal = Integer.parseInt(velocidadFinalStr);
            int tiempo = Integer.parseInt(tiempoStr);

            // Calcular la distancia recorrida en metros
            int distanciaMetros = ((velocidadInicial + velocidadFinal) / 2) * tiempo;

            // Calcular la distancia en kilómetros
            double distanciaKilometros = distanciaMetros / 1000.0;
%>
<p>La distancia recorrida es: <%= distanciaMetros %> metros (o <%= distanciaKilometros %> kilómetros).</p>
<%
        } catch (NumberFormatException e) {
            out.println("<p>Por favor, ingrese valores numéricos válidos.</p>");
        }
    }
%>
</body>
</html>
