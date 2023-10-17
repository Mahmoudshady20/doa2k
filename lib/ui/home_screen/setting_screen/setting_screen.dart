import 'package:flutter/material.dart';


class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
   String? modedropdownvalue;//SharedPrefs.getTheme();
   String? languagedropdownvalue;

  @override
  Widget build(BuildContext context) {
    //var settingProvider = Provider.of<SettingsProvider>(context);
    // if(SharedPrefs.getlan() == 'ar'){
    //   languagedropdownvalue = 'Arabic';
    // }else {
    //   languagedropdownvalue = 'English';
    // }
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Language",style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: DropdownButton(
                isExpanded: true,
                underline: Container(
                  color: Colors.transparent,
                ),
                padding: const EdgeInsets.only(right: 8, left: 8),
                items:  [
                    DropdownMenuItem(
                    value: 'Arabic',
                    child: Text(
                      'Arabic',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF5D9CEC),
                      ),
                    ),
                  ),
                    DropdownMenuItem(
                    value: 'English',
                    child: Text('English',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF5D9CEC),
                        )),
                  ),
                ],
                value: languagedropdownvalue,
                onChanged: (value) {
                  setState(() {
                    languagedropdownvalue = value;
                  });
                }),
          ),
          const SizedBox(
            height: 30,
          ),
          Text("Mode",style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: DropdownButton(
              isExpanded: true,
              underline: Container(
                color: Colors.transparent,
              ),
              padding: const EdgeInsets.only(right: 8, left: 8),
              items: [
                DropdownMenuItem(
                  onTap: (){
                    //settingProvider.enableLightMode();
                  },
                  value: 'light',
                  child: const Text('light',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF5D9CEC),
                      )),
                ),
                DropdownMenuItem(
                  onTap: (){
                    //settingProvider.enableDarkMode();
                  },
                  value: 'dark',
                  child: const Text('dark',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF5D9CEC),
                      )),
                ),
              ],
              value: modedropdownvalue,
              onChanged: (value) {
                setState(() {
                  modedropdownvalue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
