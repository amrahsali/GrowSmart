

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _imageBytes;
  bool isUpdating = false;
  int? _selectedCountryId;


  // Use initial values from the profile state
  late TextEditingController _fullNameController = TextEditingController(
      text: 'k');
  late TextEditingController _phoneNumberController =
  TextEditingController(text: 'k');
  late TextEditingController _emailController =
  TextEditingController(text: 'h');

  @override
  void initState() {
    super.initState();
    ProfileUtil().getProfile();
    initializeControllers();
  }

  void initializeControllers() {
    _fullNameController = TextEditingController(
        text: 'w');
    _phoneNumberController =
        TextEditingController(text: 'juh');
    _emailController = TextEditingController(text: 'g');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        title: Center(
          child: Text(
            'Driver Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 24),
                Stack(
                  alignment:
                  Alignment.center, // Align children at the bottom center
                  children: [
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: 'assets/images/profile.png',
                      ),
                    ),
                    verticalSpaceSmall,
                    Container(
                      decoration: BoxDecoration(
                        color:
                        Colors.black.withOpacity(0.5), // Semi-transparent black
                        borderRadius: BorderRadius.circular(
                            100), // Circular border to match the avatar
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: GestureDetector(
                         // onTap: _updateProfileImage,
                          child: const Column(
                            children: [
                              Text(
                                'Update',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                verticalSpaceSmall,
                Text(
                  'Amrah Dee',
                  style: TextStyle(
                      color: kcPrimaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 16),
                Container(
                  width: 365,
                  height: 179,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: Expanded(
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        children: ListTile.divideTiles(
                          context: context,
                          tiles: [
                            ListTile(
                              leading: Text(
                                'Outstanding Tax',
                                style: TextStyle(),
                              ),
                              title: Text(
                                '#1,447',
                                style: TextStyle(),
                              ),
                              trailing:
                              Icon(Icons.chevron_right, color: kcPrimaryColor),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: Text('Applicable Tax'),
                              title: Text('Bus driver '),
                              trailing: Text(
                                '#4500/month',
                                style: TextStyle(),
                              ),
                              onTap: () {
                                // Handle security navigation or action
                              },
                            ),
                            ListTile(
                              title: Text('Serial ID'),
                              trailing: Text(
                                '8973602TY',
                                style: TextStyle(),
                              ),
                              onTap: () {
                                // Handle security navigation or action
                              },
                            ),
                          ],
                        ).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {String? trailing, bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          suffixText: trailing,
        ),
        enabled: enabled, // This line will enable or disable the text field
      ),
    );
  }


}
