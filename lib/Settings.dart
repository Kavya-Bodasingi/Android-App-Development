import 'package:flutter/material.dart';
import 'LogOut.dart';
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      body: Center(
        child: Container(
          child:Column(
            children: [
              Text("Home Page"),
            ],
          ),
        )
      ),
        drawer:Drawer(

          child:Column(
            children: [
              DrawerHeader(child: Container(
                child:Text("Major Project",style: TextStyle(color: Colors.deepOrange,)),

              ),
                decoration:BoxDecoration(color:Colors.blue,shape: BoxShape.circle),),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 11.0), // Adjust the horizontal padding here
                leading: Text("Privacy"),
                trailing: Icon(Icons.lock),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 11.0), // Adjust the horizontal padding here
                leading:Icon(Icons.notifications),
              trailing: Text("Notifications and Sounds"),),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 11.0), // Adjust the horizontal padding here
                leading:Icon(Icons.data_saver_on),
                trailing: Text("Data and Storage"),),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 11.0), // Adjust the horizontal padding here
                leading:Icon(Icons.language_outlined),
                trailing: Text("Languages"),),
              Spacer(),
              // ListTile(
              //   contentPadding: EdgeInsets.symmetric(horizontal: 11.0), // Adjust the horizontal padding here
              //   leading:Icon(Icons.login),
              //   onTap: (){
              //     Navigator.push(context,MaterialPageRoute(builder: (context)=>Login(),));
              //   },
              //   trailing: Text("Login"),),

              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 11.0), // Adjust the horizontal padding here
                leading:Icon(Icons.logout),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>LogOut(),));
                },
                trailing: Text("LogOut"),),
            ],
          )

        ),
    );
  }
}