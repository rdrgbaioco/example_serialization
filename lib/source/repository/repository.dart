import 'dart:async';
import 'package:dio/dio.dart';
import 'package:example_serialization/source/models/user.dart';
import 'package:example_serialization/source/repository/repository_impl.dart';
import 'package:example_serialization/source/request/request.dart';

class RepositoryImpl extends Repository {

  @override
  FutureOr<List<User>> getAllUsers() async  {
    final client = HttpClient(httpClient: Dio());

    /// Get the response from the API
    List<dynamic> request = await client.get(
      path: "https://63e1040559bb472a742e994f.mockapi.io/api/serialization/users",
    );

    /// Map the response to a list of users
    List<User> users = request.map<User>((e) => User.fromJson(e)).toList();

    /// Return the serialized list of users
    return users;
  }
}