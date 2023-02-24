import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/cubit/cubit.dart';
import 'package:news_app2/cubit/states.dart';
import 'package:news_app2/layout/home_layout.dart';
import 'package:news_app2/shared/cubit/cubit.dart';
import 'package:news_app2/shared/network/local/cash_helper.dart';
import 'package:news_app2/shared/network/remote/dio_helper.dart';
import 'package:news_app2/shared/observer/observer.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isLight=CacheHelper.getBoolData("isLight");

  runApp( MyApp(isLight??true));
}
class MyApp extends StatelessWidget {
  final bool isLight;
  const MyApp(this.isLight);

  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AppCubit()..changeAppMode(fromShared: isLight),),
        BlocProvider(create: (context)=>NewsCubit()..getBusinessData()),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
            builder: (context,state){
              var cubitApp=AppCubit.get(context);
              return  MaterialApp(
                theme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                    backgroundColor: Colors.deepOrange,
                    elevation: 10.0,
                    titleTextStyle: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    iconTheme: IconThemeData(color: Colors.white),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black12,
                      statusBarIconBrightness: Brightness.light,
                    ),


                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.deepOrange,
                    type: BottomNavigationBarType.fixed,
                    elevation: 0.0,
                    backgroundColor: Colors.white,

                  ),
                  textTheme: TextTheme(

                    bodyText1: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    subtitle1: TextStyle(
                      color: Colors.grey,
                        fontSize: 12,
                    ),
                  ),
                ),
                darkTheme: ThemeData(
                  scaffoldBackgroundColor: Colors.black,
                  primarySwatch: Colors.deepOrange,

                  appBarTheme: AppBarTheme(
                    backgroundColor: Colors.black,
                    elevation: 10.0,
                    iconTheme: IconThemeData(color: Colors.deepOrange),
                    titleTextStyle: TextStyle(
                      color: Colors.yellow,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,

                    ),

                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Colors.black,
                    elevation: 0.0,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.white,
                  ),
                  textTheme: TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    subtitle1: TextStyle(
                        color: Colors.deepOrange,
                    fontSize: 12),
                  ),
                ),
                debugShowCheckedModeBanner: false,
                themeMode: cubitApp.themeMode,
                home: Directionality(
                    textDirection: TextDirection.rtl,
                    child: HomeLayout()),


              );},
        listener: (context,state){},
      ),
    );
  }
}
