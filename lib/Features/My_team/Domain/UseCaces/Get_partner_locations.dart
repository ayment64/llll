import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/My_team/Domain/Repositories/My_team_repository.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:meta/meta.dart';

class GetPartnerLocations implements Usescases<List<Location>, GetPartnerLocationParams> {
  final MyTeamRepository categoryRepositor;

  GetPartnerLocations({@required this.categoryRepositor});

  @override
  Future<Either<Failure, List<Location>>> call(GetPartnerLocationParams params) async {
    return await categoryRepositor.getPartnerLocations(params);
  }
}

class GetPartnerLocationParams {
  final String token;
  final int id;


  GetPartnerLocationParams({this.token,this.id});
}
