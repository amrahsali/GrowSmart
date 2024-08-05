import 'package:flutter/material.dart';
import 'package:growsmart/ui/common/app_colors.dart';
import 'package:growsmart/ui/common/ui_helpers.dart';
import 'package:growsmart/ui/views/profile/profile_details.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isFaceIdEnabled = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
      ),
      body: ListView(
        children: [
          // Profile Picture and Name
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: kcPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    horizontalSpaceMedium,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Amrah sali",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kcWhiteColor),
                        ),
                        Text(
                          "johndoe@example.com",
                          style: TextStyle(color: kcWhiteColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person, color: kcPrimaryColor,),
                    title: Text("My Account"),
                    subtitle: Text("Make changes to your account"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilePage()),
                      );                    },
                  ),

                  // Save to Beneficiaries
                  // Save to Beneficiaries
                  ListTile(
                    leading: Icon(Icons.save_alt, color: kcPrimaryColor,),
                    title: Text("Saved Beneficiary"),
                    subtitle: Text("Manage your saved account"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                    },
                  ),


                  ListTile(
                    leading: Icon(Icons.lock_outline, color: kcPrimaryColor,),
                    title: Text("Add Face/Fingerprint ID"),
                    subtitle: Text("Manage your device security"),
                    trailing: Switch(
                      value: isFaceIdEnabled,
                      activeColor: kcPrimaryColor,
                      onChanged: (bool value) {
                        setState(() {
                          isFaceIdEnabled = value;
                        });
                      },
                    ),
                  ),

                  ListTile(
                    leading: Icon(Icons.privacy_tip_outlined, color: kcPrimaryColor,),
                    title: Text("Permissions & Privacy"),
                    subtitle: Text("Further secure your account for safety"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to Add Face/Fingerprint ID screen
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.logout, color: kcPrimaryColor,),
                    title: Text("Log out"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to Add Face/Fingerprint ID screen
                    },
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "More",
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.notification_important_outlined, color: kcPrimaryColor,),
                title: Text("Help & Support"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to Add Face/Fingerprint ID screen
                },
              ),
            ),
          ),

          // My Account
        ],
      ),
    );
  }

  void main() {
    runApp(MaterialApp(
      home: ProfileView(),
    ));
  }
}
