import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/register_player_screen.dart';
import 'package:quiz_app/widgets/base_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterPlayerScreen(),
          ));
    });
  }

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BaseWidget(
      body: Center(
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
            Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  'QUIZ',
                  style: TextStyle(
                    fontSize: 100,
                    fontFamily: 'FaridEnglish',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.white70,
                  ),
                ),
                // Solid text as fill.
                const Text(
                  'QUIZ',
                  style: TextStyle(
                    fontSize: 100,
                    fontFamily: 'FaridEnglish',
                    color: pColorGreeneDarker,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Text(
              'Designed by',
              style: TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
                fontFamily: 'FaridEnglish',
                fontSize: 15,
              ),
            ),
            const Text(
              'Artan Co.',
              style: TextStyle(
                color: pColorGrayPalette,
                // fontWeight: FontWeight.bold,
                fontFamily: 'FaridEnglish',
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
