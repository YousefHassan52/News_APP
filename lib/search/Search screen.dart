import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/shared/components/components.dart';
import 'package:news_app2/shared/cubit/cubit.dart';
import 'package:news_app2/shared/cubit/states.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(builder: (context,state){
      var list=NewsCubit.get(context).search;
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              defaultTextFormField(
                onChange: (String value){
                  NewsCubit.get(context).getSearchData(value);
                  print(value);

                },
                  controller:NewsCubit.get(context).searchController,
                  validate: (value){
                    if(value ==null || value.isEmpty)
                      return "اكتب أي حاجة تبحث عنها يا صاحبي";
                  },
                  text: "بحث",
                  prefixIcon: Icons.search,
                  keyboardType: TextInputType.text,
              ),
              Expanded(child: ScreenBuilder(list,isSearchScreen: true)),
            ],

          ),
        ),
      );
    }, listener: (context,state){});
  }
}
