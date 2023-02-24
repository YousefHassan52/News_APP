import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/modules/business.dart';
import 'package:news_app2/modules/science.dart';
import 'package:news_app2/modules/sports.dart';
import 'package:news_app2/shared/cubit/states.dart';

import '../network/remote/dio_helper.dart';


class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsInitialState());

  var searchController=new TextEditingController();

  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<BottomNavigationBarItem> bottomItems=[
    BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp),label: "بيزنس"),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: "رياضة"),
    BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label: "طقس و علوم"),  ];
  changeScreen(int index){
    currentIndex=index;
    if(index==1)
      getSportsData();
    else if(index==2)
      getScienceData();
    // print("index ${currentIndex}");
    emit(NewsChangeScreenState());
  }
  List<Widget> screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<dynamic> business=[];
  List<dynamic> sports=[];
  List<dynamic> science=[];
  List<dynamic> search=[];

  // hena 2nta 3ayez temla el ist bs m4 hat return 7aga
  getBusinessData() {
    if (business.length == 0) {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "business",
        "apiKey": "ecbca51d582c43bb98c3b7495c0d0ae0",
      }).then((value) {
        //print(value.data["articles"][0]["title"]);
        business = value.data["articles"];
        print(business[0]["title"]);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    }
  }


  getSportsData(){
      if(sports.length==0)
      {
        emit(NewsGetSportsLoadingState());
        DioHelper.getData(url: "v2/top-headlines", query: {
          "country":"eg",
          "category":"sports",
          "apiKey":"ecbca51d582c43bb98c3b7495c0d0ae0",
        }).then((value) {
          //print(value.data["articles"][0]["title"]);
          sports=value.data["articles"];
          print(sports[0]["title"]);
          emit(NewsGetSportsSuccessState());
        }).catchError((error){
          emit(NewsGetSportsErrorState(error.toString()));

        });
    }
  }


  getScienceData() {
    if (science.length == 0) {
      emit(NewsGetScienceLoadingState());
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "science",
        "apiKey": "ecbca51d582c43bb98c3b7495c0d0ae0",
      }).then((value) {
        //print(value.data["articles"][0]["title"]);
        science = value.data["articles"];
        print(science[0]["title"]);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }
  }


  getSearchData(String value) {
    search=[];
    if (search.length == 0) {
      emit(NewsGetSearchLoadingState());
      DioHelper.getData(url: "v2/everything", query: {
        "q": "$value",
        "apiKey": "ecbca51d582c43bb98c3b7495c0d0ae0",
      }).then((value) {
        //print(value.data["articles"][0]["title"]);
        search = value.data["articles"];
        print(search[0]["title"]);
        emit(NewsGetSearchSuccessState());
      }).catchError((error) {
        emit(NewsGetSearchErrorState(error.toString()));
      });
    }
  }
  void reload(){
    business=[];
    sports=[];
    science=[];
    getBusinessData();
    getSportsData();
    getScienceData();
    emit(NewsreloadingState());
  }


}