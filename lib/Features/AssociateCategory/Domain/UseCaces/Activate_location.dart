import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/AssociateCategory/Domain/Repositories/Associate_category_location_repository.dart';
import 'package:meta/meta.dart';

class Activatelocation implements Usescases<bool, ActivatelocationParams> {
  final AssociateCategoryLocationRepository categoryRepositor;

  Activatelocation({@required this.categoryRepositor});

  @override
  Future<Either<Failure, bool>> call(ActivatelocationParams params) async {
    return await categoryRepositor.activatelocation(params);
  }
}

class ActivatelocationParams {
  final String token;
  final int id;
  final bool isactive;

  ActivatelocationParams(this.token, this.id, this.isactive);
}
