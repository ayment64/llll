import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/Category/Presentation/bloc/add_category_bloc.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:llll/Injection_container.dart';

import 'Category.dart';

class CategoryPage extends StatelessWidget {
  final String token;
  final String from;
  final Location location;
  const CategoryPage({Key key,@required this.token, this.from, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("-------------------------------------------------------------------");
    print(token);

    return Scaffold(
      body: BlocProvider(builder: (_)=> sl<AddCategoryBloc>(),child: Category(token:token,from: from,location: location,)),
    );
  }
}
