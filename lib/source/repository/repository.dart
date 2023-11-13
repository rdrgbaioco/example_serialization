import 'dart:async';
import 'package:example_serialization/source/models/user.dart';

abstract class Repository {

  FutureOr<List<User>> getAllUsers();

}