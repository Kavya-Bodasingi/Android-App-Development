import "package:flutter/material.dart";
import "Registration.dart";
class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("LogOut"),
        ),
        body: Container(
          child:
          signUpOption(),)
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
          child: const Text(
            "Register Here",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Registration()));
          },
        )
      ],
    );
  }
}

