import 'package:dio/dio.dart';
import 'package:todo_app_api/model/todo_model.dart';

class TodoService {
  final Dio _dio = Dio();
  final String _url = 'https://65decaf1ff5e305f32a076a3.mockapi.io/todo';

  Future<List<TodoModel>> fetchTodo() async {
    try {
      final Response response = await _dio.get(_url);
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => TodoModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load ');
      }
    } catch (error) {
      throw Exception('Failed to load  : $error');
    }
  }

  Future<void> addTodo(TodoModel value) async {
    try {
      await _dio.post(_url, data: value.toJson());
    } catch (error) {
      throw Exception('Error on adding :$error');
    }
  }

  Future<void> updateTodo(TodoModel value, String id) async {
    try {
      await _dio.put('$_url/$id', data: value.toJson());
    } catch (error) {
      throw Exception('Error on updating  : $error');
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      await _dio.delete('$_url/$id');
    } catch (error) {
      throw Exception('Error while deleting : $error');
    }
  }
}