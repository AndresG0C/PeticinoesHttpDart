import 'dart:convert';
import 'package:http/http.dart' as http;
import 'User.dart';

void main() async {
  // URL de la API
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  

  // Realizar la petición GET
  final response = await http.get(url);
  print(response);

  // Verificar si la petición fue exitosa
  if (response.statusCode == 200) {
    // Parsear la respuesta JSON a una lista
    List<dynamic> jsonData = json.decode(response.body);

    // Crear una lista de users
    List<User> users = jsonData.map((json) => User.fromJson(json)).toList();

    // Mostrar los datos
    filtroUsername(users);
    usuariosConBiz(users);
  } else {
    // Manejo de errores
    print('Error al obtener los datos: ${response.statusCode}');
  }
}

void filtroUsername(List<User> usuarios){
  print('Usuarios que tienen un username con más de 6 caracteres:');
  usuarios.where((usuario) => usuario.username.length > 6).forEach((user) {
    print('User ID: ${user.id}');
    print('Name: ${user.name}');
    print('username: ${user.username}');
    print('Email: ${user.email}');
    print('---');
  });
}

void usuariosConBiz(List<User> usuarios) {
  int cantidad;
  cantidad = usuarios.where((usuario) => usuario.email.endsWith('@biz')).length;
  print('La cantidad de usuarios que tienen correo electrónico con dominio biz es: $cantidad');
}