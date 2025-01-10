import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/pages/components/my_button.dart';
import 'package:resturent_app/pages/components/text_fields.dart';
import 'package:resturent_app/pages/services/auth/auth_services.dart';
import 'package:resturent_app/pages/themes/theme_provider.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login() async {
    //authentication
    final authService = AuthServices();

    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }

    /*go to home page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              //logo icon
              Icon(Icons.lock_open_outlined, size: 100),

              //message, app slogan
              Text(
                "Food Delivery App",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              //email etxtfield
              TextFields(
                  hintText: "Email",
                  obsecureText: false,
                  controller: emailController),

              SizedBox(
                height: 15,
              ),

              //password etxtfield
              TextFields(
                  hintText: "Password",
                  obsecureText: true,
                  controller: passwordController),

              //login button
              SizedBox(
                height: 10,
              ),
              MyButton(
                text: 'Login',
                onTap: login,
                title: '',
              ),

              SizedBox(
                height: 10,
              ),

              //not a member ? register now

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member ?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                  child: Text("Change"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
