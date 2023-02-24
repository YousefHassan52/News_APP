import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/cubit/states.dart';
import 'package:news_app2/shared/network/local/cash_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);
  bool isLight=true;
  ThemeMode themeMode=ThemeMode.light;
  Icon icon=Icon(Icons.light_mode);

  void changeAppMode({bool? fromShared}){
    if(fromShared!=null) // not equal to null y3ni we 2na bafta7 el app le 2wel mara
      // yeb2a 5od mn el data el 2na 3mtlha save 2bl ma 2a2fel
      isLight=fromShared;
    else
      isLight=!isLight; // 27na hena 5las dosna fa ba3d ma nedos hanbda2 b2a nefkar 2e7na fe el sob7 2w blel 34an 27ded el mode we el icon

     CacheHelper.putBoolData("isLight", isLight);

      if(isLight==true)
      {
        themeMode=ThemeMode.light;
        icon=Icon(Icons.light_mode);
      }
      else
      {
        themeMode=ThemeMode.dark;
        icon=Icon(Icons.dark_mode);
      }
      emit(AppChangeModeState());


  }


}