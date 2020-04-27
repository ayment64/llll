import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/Sign_in/Domain/Repositories/User_Repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Register implements Usescases<String, Paramsre> {
  final UserRepository userRepository;

  Register(this.userRepository);

  @override
  Future<Either<Failure, String>> call(Paramsre params) async {
    return await userRepository.register(params);
  }
}

class Paramsre extends Equatable {
  final String username;
  final String password;
  final String email;
  final String passwordconfirmation;

  Paramsre({@required this.email,@required this.passwordconfirmation, @required this.username, @required this.password})
      : super([username, password]);
}
