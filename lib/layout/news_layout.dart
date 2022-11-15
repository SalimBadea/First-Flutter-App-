import 'package:first_flutter_app/cubit/cubit.dart';
import 'package:first_flutter_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, NewsStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("News App"),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.current_index,
              items: cubit.bottomNavItems,
              onTap: (index){
                cubit.changeBottomNavBar(index);
              },
            ),
            body: cubit.screens[cubit.current_index],
          );
        },
      ),
    );
  }
}
