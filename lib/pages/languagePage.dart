import 'package:allquiz/constants.dart';
import 'package:allquiz/dictionnaires/java.dart';
import 'package:allquiz/pages/quizPage.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String? language = 'Java';
  String? description =
      'Java, langage de programmation créé en 1995 par Sun Microsystems, est polyvalent, portable avec la JVM, orienté objet, sécurisé, et largement utilisé, notamment dans le développement d\'applications multiplateformes et sur Android.';
  String? image = 'java.png';

  Future _onTap(String level) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return QuizPage(niveau: level);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutQuart;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.redAccent[50],
            child: Column(
              children: [
                Container(
                    height: 300,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(100),
                          bottomLeft: Radius.circular(100)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/$image',
                    )),
                IntrinsicHeight(
                    child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        language.toString().toUpperCase(),
                        style: stylish(30, primColor),
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          description.toString(),
                          style: stylish(20, thirdColor),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () => _onTap('debutant'),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: primColor, width: 2),
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white.withBlue(250).withOpacity(1),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/amateur.png',
                                width: 80,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Débutant'.toUpperCase(),
                                    style: stylish(22, primColor),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    '${debutant.length.toString()} Quizs',
                                    style: stylish(20, thirdColor),
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: primColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () => _onTap('intermédiaire'),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: primColor, width: 2),
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white.withBlue(250).withOpacity(1),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/inermediaire.png',
                                width: 80,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Intermédiaire'.toUpperCase(),
                                    style: stylish(22, primColor),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    '${intermediaire.length.toString()} Quizs',
                                    style: stylish(20, thirdColor),
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: primColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () => _onTap('professionnel'),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: primColor, width: 2),
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white.withBlue(250).withOpacity(1),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/professionnel.png',
                                    width: 80,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Professionnel'.toUpperCase(),
                                        style: stylish(22, primColor),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '${professionnel.length.toString()} Quizs',
                                        style: stylish(20, thirdColor),
                                        textAlign: TextAlign.left,
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: primColor,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
