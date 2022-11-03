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
                  Image(
                      image: NetworkImage(
                          'https://cdn.logo.com/hotlink-ok/logo-social.png')),
                  SizedBox(
                    height: 20,
                  ),
                  // TextFormField(
                  //   controller: emailController,
                  //   keyboardType: TextInputType.emailAddress,
                  //   onChanged: (value) {
                  //     print(value);
                  //   },
                  //   onFieldSubmitted: (value) {
                  //     print(value);
                  //   },
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Email must not be empty';
                  //     }
                  //     return null;
                  //   },
                  //   decoration: const InputDecoration(
                  //     labelText: 'Email Address',
                  //     prefixIcon: Icon(Icons.email),
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                  DefaultTextField(
                    controller: emailController,
                    labelText: "Email Address",
                    textInputType: TextInputType.emailAddress,
                    prefix: Icons.email, isPassword: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultTextField(
                    controller: passwordController,
                    labelText: "Password",
                    textInputType: TextInputType.visiblePassword,
                    isPassword: isPasswordShow,
                    prefix: Icons.lock,
                    suffix: isPasswordShow
                        ? Icons.visibility
                        : Icons.visibility_off,
                    suffixPressed: () {
                      setState(() {
                        isPasswordShow = !isPasswordShow;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  defaultButton(
                      width: double.infinity,
                      background: Colors.green,
                      btnPressed: () {
                        if (formKey.currentState!.validate()) {
                          print('${emailController.text}');
                          print('${passwordController.text}');
                        }
                      },
                      text: 'Login'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have Account?'),
                      TextButton(onPressed: () {}, child: Text('SignUp')),
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
