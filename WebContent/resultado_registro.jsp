<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro BD</title>
</head>
<body bgcolor="#FFA07A"> <!-- Aca se esta cambiando el color del body con el atributo bgcolor. -->
<%
//Aca se estan trayendo los datos del formulario.
String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
String usuario = request.getParameter("usuario");
String clave = request.getParameter("clave");
String pais = request.getParameter("pais");
String tecnologia = request.getParameter("tecnologia");
		
//1. Conectarse a la base de datos (Este paso puede generar un excepci�n).
Class.forName("com.mysql.cj.jdbc.Driver"); //Aca se esta estableciendo el driver a utilizar (Esta instrucci�n inicia el driver con el m�todo est�tico forName).
Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbformulariobd", "root", "root"); //Esta instrucci�n conecta el programa a la base de datos (El primer par�metro es la ruta, el segundo el usuario y el tereco la contrase�a).
		
//2. Definir la sentencia sql (INSERT) (Este paso puede generar un excepci�n).
String sql = "INSERT INTO usuario" + "(nombre,apellido,usuario,clave,pais,tecnologia)" + " VALUES('" + nombre + "','" + apellido + "',+'" + usuario + "','" + clave + "','" + pais + "','" + tecnologia + "')"; //Los ID Autoincrementales no van aca, ya que el dbms asigna su valor.
Statement st = conexion.createStatement(); //Aca se crea el Statement (El m�todo crateStatement retorna un objeti de la clase Statement, dicho objeto es necesario para ejecutar la sentencia sql).
		
//3. Ejecutar el SQL (Este paso puede generar un excepci�n).
st.executeUpdate(sql); //Se utiliza el objeto de tipo Statement para ejecutar la sentencia sql.
		
//4. Desconectarse (Este paso puede generar un excepci�n).
conexion.close(); //Esta instrucci�n le pide al dbms que nos desconecte.
		
out.println("Registro exitoso");		
%>

	<center>
		<nav>
			<p>
				<a href="index.html">Inicio</a> <a href="formulario_login.html">Logearse</a>
				<a href="formulario_registro.html">Registrarse</a> <a
					href="resultado_mostrar.jsp">Mostrar</a>
			</p>
		</nav>
	</center>
</body>
</html>