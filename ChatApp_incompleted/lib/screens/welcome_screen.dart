import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation animation2;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation2 = ColorTween(begin: Color(0xffc2ecff), end: Color(0xff358dff))
        .animate(controller);
    controller.forward();

    //bounce back
    // controller.reverse(from: 1.0);

    //bounce continuously

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    //
    // for continous, to stop it in case of leaving welcome screen
    // @override
    // void dispose(){
    //   controller.dispose();
    //   super.dispose();
    // }
    // });

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation2.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: controller.value * 60,
                  ),
                ),

                // TypewriterAnimatedText(
                //   animatedTexts:['Flash Chat'],
                //   textStyle: TextStyle(
                //     color: Colors.white,
                //     fontSize: animation.value * 40,
                //     fontWeight: FontWeight.w900,
                //   ),
                // ),

                DefaultTextStyle(
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Agne',
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('Flash Chat'),
                    ],
                    isRepeatingAnimation: false,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Login',
              colour: Color(0xffcce4ef),
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
                colour: Color(0xffcce4ef),
                title: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
