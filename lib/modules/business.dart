import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/shared/components/components.dart';
import 'package:news_app2/shared/cubit/cubit.dart';
import 'package:news_app2/shared/cubit/states.dart';
class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
      builder: (context,state){
          var list=NewsCubit.get(context).business;
          return ScreenBuilder(list);
      },

    );
  }
}
