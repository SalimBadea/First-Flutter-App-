import 'package:first_flutter_app/cubit/states.dart';
import 'package:first_flutter_app/modules/business/business_screen.dart';
import 'package:first_flutter_app/modules/science/science_screen.dart';
import 'package:first_flutter_app/modules/sports/sports_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<NewsStates> {
  AppCubit() : super(NewsInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int current_index = 0;

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen()
  ];

  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_rounded),
      label: "Business"
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_esports_rounded),
      label: "Sports"
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_rounded),
      label: "Science"
    ),
  ];
  void changeBottomNavBar(int index){
    current_index = index;
    emit(NewsBottomNavState());
  }

}
