import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/AssociateCategory/Presentation/bloc/associate_category_bloc.dart';

import 'package:llll/Injection_container.dart';

import 'Associate_category.dart';



class AssociateCategoryPage extends StatelessWidget {
  final String token;
  final String from;
  const AssociateCategoryPage({Key key,@required this.token, this.from}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("-------------------------------------------------------------------");
    print(token);

    return Scaffold(
      body: BlocProvider(builder: (_)=> sl<AssociateCategoryBloc>(),child: AssociateCategory(token:token,from: from,)),
    );
  }
}
