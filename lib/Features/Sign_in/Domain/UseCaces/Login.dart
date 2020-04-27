import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/Sign_in/Domain/Repositories/User_Repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Login implements Usescases<String, Params> {
  final UserRepository userRepository;

  Login(this.userRepository);

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await userRepository.login(params.username, params.password);
  }
}

class Params extends Equatable {
  final String username;
  final String password;

  Params({@required this.username, @required this.password})
      : super([username, password]);
}
