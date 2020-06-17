import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CategoryData extends Equatable {
  final int id;
  final String name;
  final int nbClick;
  final int isDeleted;
  final int isAccepted;

  CategoryData(
      {@required this.id,
      @required this.name,
      @required this.nbClick,
      @required this.isDeleted,
      @required this.isAccepted});
}
