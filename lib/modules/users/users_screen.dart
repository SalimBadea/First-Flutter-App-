import 'package:flutter/material.dart';

import '../../models/users.dart';

class UsersScreen extends StatelessWidget {

  List<UserModel> users = [
    UserModel(id: 1, name: 'Salem Badiea', phone: '+201068996991'),
    UserModel(id: 2, name: 'Mohammed', phone: '+201068996992'),
    UserModel(id: 3, name: 'Alfakharany', phone: '+201068996993'),
    UserModel(id: 4, name: 'Alrafay', phone: '+201068996994'),
    UserModel(id: 5, name: 'Omar', phone: '+201068996995'),
    UserModel(id: 6, name: 'Nader', phone: '+201068996996'),
    UserModel(id: 7, name: 'Ali', phone: '+201068996997'),
    UserModel(id: 8, name: 'Mohammed', phone: '+201068996998'),
    UserModel(id: 9, name: 'Mohamoud', phone: '+201068996999'),
    UserModel(id: 5, name: 'Omar', phone: '+201068996995'),
    UserModel(id: 6, name: 'Nader', phone: '+201068996996'),
    UserModel(id: 7, name: 'Ali', phone: '+201068996997'),
    UserModel(id: 8, name: 'Mohammed', phone: '+201068996998'),
    UserModel(id: 9, name: 'Mohamoud', phone: '+201068996999'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context, index) =>
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
          itemCount: users.length),
    );
  }

  Widget buildUserItem(UserModel user) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            child: Text('${user.id}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


