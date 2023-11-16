import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:major_project/reuse.dart';
import 'package:major_project/userrepository.dart';
import 'TaskList.dart';
class Registration extends StatefulWidget{
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}
class _RegistrationState extends State<Registration> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserRepository userRepository = UserRepository();
  bool _isObscure=true;
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            reusableTextField("Enter the Name",
                Icons.person_outline, false, emailController),
            const SizedBox(height: 20),
            reusableTextField("Enter the LastName",
               Icons.abc_outlined, false, emailController),
            const SizedBox(height: 20),
            reusableTextField("Date of Birth",
                Icons.date_range_outlined, false, emailController),
            const SizedBox(height: 20),

           reusableTextField("Email",
               Icons.email_outlined, false, emailController),
            const SizedBox(height: 20),
            TextField(
              style:TextStyle(color:Colors.white.withOpacity(0.9)),
              controller: passwordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock,color:Colors.white),
                labelText: 'Password',
                labelStyle:TextStyle(color: Colors.white.withOpacity(0.9)),
                suffixIcon: IconButton(
                  icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
                filled: true,
                fillColor: Colors.blueGrey.withOpacity(0.9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:const BorderSide(width: 0,style: BorderStyle.none),
                ),

              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Register'),
              onPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;
                await userRepository.loginUser(context, email, password);
                // After registration, you can navigate to login screen or perform other actions.
               try {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SearchTaskLists()));
                }
               catch (e) {
                 // Handle registration errors if any
                 if (kDebugMode) {
                   print("Registration error: $e");
                 }
               }
              },
            ),
          ],
        ),
      ),
    );
  }
}
