import 'package:allquiz/constants.dart';
import 'package:allquiz/pages/stats.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'languagePage.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          Stack(
              children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: primColor,
                ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/1.1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: secColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.elliptical(490, 450))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Apprendre le langage JAVA par quiz'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: stylish(45, primColor),),
                    Lottie.asset('assets/images/javaLottie.json'),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 10,
              child: InkWell (
                onTap: (){
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder:
                          (context, animation, secondaryAnimation) {
                        return LanguagePage();
                      },
                      transitionsBuilder: (context, animation,
                          secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOutQuart;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        var offsetAnimation =
                        animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                      transitionDuration:
                      const Duration(milliseconds: 500),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: primColor,width: 5),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  
                  width: 150,
                  height: 150,
                  child: Center(
                      child: Text('Commencer',
                      style: stylish(20, secColor),)),
                ),
              ),
            )
          ]),
        ],
      ),
      ),
    );
  }
}
