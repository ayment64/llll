import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/AssociateCategory/Domain/Repositories/Associate_category_location_repository.dart';
import 'package:meta/meta.dart';

class AssociatecatorSubCattolocation
    implements Usescases<bool, AssociatecatorSubCattolocationParams> {
  final AssociateCategoryLocationRepository categoryRepositor;

  AssociatecatorSubCattolocation({@required this.categoryRepositor});

  @override
  Future<Either<Failure, bool>> call(
      AssociatecatorSubCattolocationParams params) async {
    return await categoryRepositor.associatecatorSubCattolocation(params);
  }
}

class AssociatecatorSubCattolocationParams {
  final int subcatid;
  final int catid;
  final int location_id;
  final bool active_cat;
  final String token;

  AssociatecatorSubCattolocationParams({
    @required this.token,
    @required this.subcatid,
    @required this.catid,
    @required this.location_id,
    @required this.active_cat,
  });
}
