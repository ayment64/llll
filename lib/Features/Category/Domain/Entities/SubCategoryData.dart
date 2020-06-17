import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SubCategoryData extends Equatable {
  final int id;
  final String name;

  final int isDeleted;

  SubCategoryData({
    @required this.id,
    @required this.name,
    @required this.isDeleted,
  });
}
