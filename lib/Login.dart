import 'package:flutter/material.dart';
import 'package:major_project/reuse.dart';
import 'package:major_project/change_theme_button.dart';
import 'package:major_project/userrepository.dart';
import 'Profile.dart';
import 'Registration.dart';
import 'home.dart';
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserRepository userRepository = UserRepository();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).platformBrightness == Brightness.dark?"Dark Theme":"Light Theme";
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Login',
            style: TextStyle(color: Colors.white,)
        ),
        actions:  [
          ChangeThemeButtonWidget(),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(decoration: BoxDecoration(
                  color: Colors.blue, shape: BoxShape.circle),child: Text(
                      "Major Project", style: TextStyle(color: Colors.deepOrange,)),),
            ListTile(
              leading: const Text("Profile", style: TextStyle(fontSize: 15,),),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Profile(),));
              },
              trailing:  Icon(Icons.person),
            ),
            const Spacer(),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 11.0),
              // Adjust the horizontal padding here
              leading: const Icon(Icons.login),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Login(),));
              },
              trailing: const Text("Login"),),

          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(
            colors: [Colors.grey, Colors.blueGrey, Colors.transparent])
        ),
        child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.fromLTRB(60, 150, 60, 260),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                reusableTextField("Email",
                    Icons.email_outlined, false, emailController),
                const SizedBox(height: 20),
                TextField(
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  controller: passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
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
                      borderSide: const BorderSide(
                          width: 0, style: BorderStyle.none),
                    ),

                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    String email = emailController.text;
                    String password = passwordController.text;
                    bool isAuthenticated = await userRepository.loginUser(context,
                        email, password);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>const TaskList()));
                    if (isAuthenticated) {

                    } else {
                    const Text("Unsuccessful Login");
                    }
                  },
                  child: const Text('Login'),
                ),
                signUpOption(),
              ],
            ),
          ),
        ),),
    );
  }
  Row signUpOption() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Do not have account",
              style: TextStyle(color: Colors.white24)
          ),
          GestureDetector(
            child:  const Text(
              "Register Here",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Registration()));
            },
          )
        ],
      );
    }
  }


 // void setState(Null Function() param0) {}
