import 'package:llll/Core/Error/Exeptions.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:llll/Core/Platform/Network_info.dart';
import 'package:llll/Features/My_team/Data/DataSource/My_team_remote_data_source.dart';
import 'package:llll/Features/My_team/Domain/Repositories/My_team_repository.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/SendInvite.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/GetTeam.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/GetPartnerProfile.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/GetPartnerDocuments.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/FindUser.dart';
import 'package:meta/meta.dart';

class MyTeamRepositoryImpl implements MyTeamRepository {
  final MyTeamRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  var response;

  MyTeamRepositoryImpl(
      {@required this.remoteDataSource, @required this.networkInfo});
  @override
  Future<Either<Failure, Profile>> findUser(FindUserParams params) async {
    try {
      networkInfo.isConnected;
      response = await remoteDataSource.findUser(params);
      return Right(response);
    } on NoSuchUserExeption {
      return Left(NoSuchUserFailure());
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Profile>> getPartnerDocuments(
      GetPartnerDocumentsParams params) {
    // TODO: implement getPartnerDocuments
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Profile>> getPartnerProfile(
      GetPartnerProfileParams params) {
    // TODO: implement getPartnerProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Profile>>> getTeam(GetTeamParams params) async {
    try {
      networkInfo.isConnected;
      response = await remoteDataSource.getTeam(params);
      return Right(response);
    } on NoSuchUserExeption {
      return Left(NoSuchUserFailure());
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> sendInvite(SendInviteParams params) async {
    try {
      networkInfo.isConnected;
      response = await remoteDataSource.sendInvite(params);
      return Right(response);
    } on NoSuchUserExeption {
      return Left(NoSuchUserFailure());
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }
}
