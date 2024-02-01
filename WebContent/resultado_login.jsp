<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Mostrar</title>
</head>
<body bgcolor="#FFA07A"> <!-- Aca se esta cambiando el color del body con el atributo bgcolor. -->
<!-- FORMA 1. -->
<%
/*
String usuario = request.getParameter("usuario");
String clave = request.getParameter("clave");
	
//1. Conectarse a la base de datos (Este paso puede generar un excepción).
Class.forName("com.mysql.cj.jdbc.Driver"); //Aca se esta estableciendo el driver a utilizar (Esta instrucción inicia el driver con el método estático forName).
Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbformulariobd","root","root"); //Esta instrucción conecta el programa a la base de datos (El primer parámetro es la ruta, el segundo el usuario y el tereco la contraseña).
		
//2. Definir la sentencia sql (INSERT) (Este paso puede generar un excepción).
String sql = "SELECT * FROM usuario";
Statement st = conexion.createStatement(); //Aca se crea el Statement (El método crateStatement retorna un objeti de la clase Statement, dicho objeto es necesario para ejecutar la sentencia sql).
		
//3. Ejecutar el SQL (Este paso puede generar un excepción).
ResultSet rs = st.executeQuery(sql); //Aca se trae la tabla y se almacena en el objeto.
		
		
boolean validado = false;
while (rs.next()) { //El método next busca si hay una fila abajo (Mientras haya una fila abajo, el bucle no se termina).

	if (rs.getString("usuario").equals(usuario) && rs.getString("clave").equals(clave)) {
		validado = true;
		out.println("Estas logeado");
		break;
	}
}
		
if (validado == false) {
	out.println("No estas logeado");
}
		
rs.close(); //Se cierra el puntero.
		
//4. Desconectarse (Este paso puede generar un excepción).
conexion.close(); //Esta instrucción le pide al dbms que nos desconecte.
*/
%>

<!-- FORMA 2. -->
<%
String usuario = request.getParameter("usuario");
String clave = request.getParameter("clave");
	
//1. Conectarse a la base de datos (Este paso puede generar un excepción).
Class.forName("com.mysql.cj.jdbc.Driver"); //Aca se esta estableciendo el driver a utilizar (Esta instrucción inicia el driver con el método estático forName).
Connection conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbformulariobd", "root", "root"); //Esta instrucción conecta el programa a la base de datos (El primer parámetro es la ruta, el segundo el usuario y el tereco la contraseña).
		
//2. Definir la sentencia sql (INSERT) (Este paso puede generar un excepción).
String sql = "SELECT * FROM usuario WHERE usuario=" + "'" + usuario + "'" + " AND " + "clave=" + "'" + clave + "'";
PreparedStatement st = conexion.prepareStatement(sql); //Aca se prepara el Statement (Preparar un Statement evita inyecciones SQL).
		
//3. Ejecutar el SQL (Este paso puede generar un excepción).
ResultSet rs = st.executeQuery(sql); //Aca se ejecuta el SQL, se trae la tabla y se almacena en el objeto.
		
if (rs.absolute(1) == true) { //Esta condición indica que si el ResulSet retorna un registro se cumple la condición (0==false/1==true).
	out.println("Estas logeado");
}
else {
	out.println("No estas logeado");
}
		
rs.close(); //Se cierra el puntero.
		
//4. Desconectarse (Este paso puede generar un excepción).
conexion.close(); //Esta instrucción le pide al dbms que nos desconecte.	
%>
	<center>
		<nav>
			<p>
				<a href="index.html">Inicio</a> <a href="formulario_login.html">Logearse</a>
				<a href="formulario_registro.html">Registrarse</a> 
				<a href="resultado_mostrar.jsp">Mostrar</a>
			</p>
		</nav>
	</center>
</body>
</html>