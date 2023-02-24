import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/search/Search%20screen.dart';
import 'package:news_app2/shared/components/components.dart';
import 'package:news_app2/shared/network/remote/dio_helper.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (context,state){
        var cubitNews=NewsCubit.get(context);
        var cubitApp=AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              cubitApp.changeAppMode();
              cubitNews.reload();

            },icon: cubitApp.icon,),

            title: Container(
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                color: Colors.white
              ),
              child: Text("جرنال ك",
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: (){
                cubitNews.reload();
              }, icon: Icon(Icons.restart_alt)),
              IconButton(onPressed: (){
                navigateTo(context, SearchScreen());

                }, icon: Icon(Icons.search_rounded))
            ],

          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){cubitNews.changeScreen(index);},
            currentIndex: cubitNews.currentIndex,
            items:cubitNews.bottomItems ,
          ),
          body: cubitNews.screens[cubitNews.currentIndex],

      );
    }, listener: (context,state){});
  }
}
