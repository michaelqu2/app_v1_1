import 'package:flutter/material.dart';
import 'package:app_v1/setting.dart';

class SportsSettingPage extends StatefulWidget {
  const SportsSettingPage({super.key});

  @override
  State<SportsSettingPage> createState() => _SportsSettingPageState();
}

class _SportsSettingPageState extends State<SportsSettingPage> {

  String sports_choice = 'other';
  var s_choices = ['golf', 'soccer', 'track', 'other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 800,
                height: 100,
                child: Center(
                  child: DropdownButton(


                    value: sports_choice,
                    items: s_choices.map((String item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        sports_choice = newValue!;
                      });
                    },

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 800,
                height: 100,
                child: Center(
                  child: DropdownMenu<String>(
                    width: 300,


                    initialSelection: sports_choice,
                    onSelected: (String? value){
                      setState(() {
                        sports_choice = value!;
                      });
                    },
                    dropdownMenuEntries: s_choices.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(value: value, label: value);
                    }).toList(),
                    

                  ),
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                alignment: Alignment.center,
              ),
              onPressed: () {
                print("save sports setting");
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingPage()));
              },
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}