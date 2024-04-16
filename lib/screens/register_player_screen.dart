import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/home_page_screen.dart';
import 'package:quiz_app/widgets/base_widget.dart';
import 'package:quiz_app/widgets/customize_text_field.dart';

class RegisterPlayerScreen extends StatelessWidget {
  RegisterPlayerScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController familyController = TextEditingController();

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BaseWidget(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.2,
                ),
                const Image(
                  height: 200,
                  width: 200,
                  image: AssetImage('assets/images/artanLogo.png'),
                ),
                const Spacer(),
                CustomizeTextField(controller: nameController, labelText: 'Name',),
                CustomizeTextField(controller: familyController, labelText: 'Family',),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: pColorGreeneDarker,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings, color: pColorGrayPalette, size: 30, ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(pColorGreeneDarker),
                        foregroundColor:
                            MaterialStateProperty.all(pColorGrayPalette),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                            fontSize: 30,
                            fontFamily: 'IRANSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePageScreen(),
                            ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 8.0),
                        child: Text('شروع'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: pColorGreeneDarker,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings, color: pColorGrayPalette, size: 30, ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
