import 'package:first_flutter_app/modules/users/users_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Image(
                      image: NetworkImage(
                          'https://cdn.logo.com/hotlink-ok/logo-social.png')),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTextField(
                    controller: emailController,
                    labelText: "Email Address",
                    textInputType: TextInputType.emailAddress,
                    validate: 'email',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultTextField(
                    controller: passwordController,
                    labelText: "Password",
                    textInputType: TextInputType.visiblePassword,
                    isPassword: isPasswordShow,
                    suffix: isPasswordShow
                        ? Icons.visibility
                        : Icons.visibility_off,
                    suffixPressed: () {
                      setState(() {
                        isPasswordShow = !isPasswordShow;
                      });
                    },
                    validate: 'password',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  defaultButton(
                      width: double.infinity,
                      background: Colors.green,
                      btnPressed: () {
                        if (formKey.currentState!.validate()) {
                          print('${emailController.text}');
                          print('${passwordController.text}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UsersScreen(email: emailController.text.toString(), password: passwordController.text.toString()),
                            ),
                          );
                        }
                      },
                      text: 'Login'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have Account?'),
                      TextButton(onPressed: () {}, child: const Text('SignUp')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
