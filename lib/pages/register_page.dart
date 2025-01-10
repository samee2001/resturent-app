import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/pages/components/my_button.dart';
import 'package:resturent_app/pages/components/text_fields.dart';
import 'package:resturent_app/pages/home_page.dart';
import 'package:resturent_app/pages/services/auth/auth_services.dart';
import 'package:resturent_app/pages/themes/theme_provider.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  void register() async {
    //authentication
    final authService = AuthServices();

    if (passwordController.text == confirmPasswordController.text) {
      try {
        await authService.signUpWithEmailAndPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Password does not match"),
        ),
      );
    }

    //go to home page

    //navigate to home page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
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
                "Lets create an account for you",
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
              SizedBox(
                height: 15,
              ),

              //password etxtfield
              TextFields(
                  hintText: "Confirm Password",
                  obsecureText: true,
                  controller: confirmPasswordController),

              //login button
              SizedBox(
                height: 10,
              ),
              MyButton(
                text: 'Sign Up',
                onTap: register,
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
                    "Already a member ?",
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
                      "Login Now",
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
