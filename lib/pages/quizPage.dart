import 'dart:async';
import 'dart:math';

import 'package:allquiz/pages/languagePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../dictionnaires/java.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key, required this.niveau}) : super(key: key);
  final String niveau;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late bool _dialogVisible;
  late String question;
  late int nbreHasard;
  late List<String> reponsesMelangees;
  late Color checkColor;
  late bool isTrue;
  late bool isCLicked0;
  late bool isCLicked1;
  late bool isCLicked2;
  late bool isCLicked3;
  late List quiz;

  @override
  void initState() {
    super.initState();
    _dialogVisible = false;
    switch (widget.niveau) {
      case 'debutant':
        quiz = debutant;
        break;
      case 'intermediaire':
        quiz = intermediaire;
        break;
      default:
        quiz = professionnel;
        break;
    }

    nbreHasard = Random().nextInt(quiz.length);
    question = quiz[nbreHasard]['question'];

    if (nbreHasard >= 0 && nbreHasard < quiz.length) {
      final reponses = quiz[nbreHasard]['reponses'] as List<String>?;

      if (reponses != null) {
        // Mélangez la liste de réponses
        reponsesMelangees = List<String>.from(reponses)..shuffle();
      }
    }

    isTrue = false;
    checkColor = Colors.red;
    isCLicked0 = false;
    isCLicked1 = false;
    isCLicked2 = false;
    isCLicked3 = false;
  }

  Future<void> checkAnswer(int index) async {
    if (reponsesMelangees[index] == quiz[nbreHasard]['bonne']) {
      setState(() {
        isTrue = true;
      });

      await Future.delayed(const Duration(milliseconds: 200));

      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return QuizPage(niveau: widget.niveau);
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
        (route) => false,
      );
    } else {
      setState(() {
        _dialogVisible = true;
      });

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('La bonne réponse est : ',
                style: stylish(22, Colors.black)),
            content: Text(quiz[nbreHasard]['bonne'] ?? '',
                textAlign: TextAlign.center, style: stylish(28, primColor)),
          );
        },
      );

      await Future.delayed(const Duration(seconds: 2));

      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return QuizPage(niveau: widget.niveau);
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
        (route) => false,
      );
    }

    setState(() {
      setClickedState(index);
      checkColor = isTrue ? Colors.green : Colors.red;
    });
  }

  void setClickedState(int index) {
    switch (index) {
      case 0:
        isCLicked0 = true;
        break;
      case 1:
        isCLicked1 = true;
        break;
      case 2:
        isCLicked2 = true;
        break;
      case 3:
        isCLicked3 = true;
        break;
    }
  }

  Color? getContainerColor(int index) {
    return getClickedState(index) ? checkColor : null;
  }

  bool getClickedState(int index) {
    switch (index) {
      case 0:
        return isCLicked0;
      case 1:
        return isCLicked1;
      case 2:
        return isCLicked2;
      case 3:
        return isCLicked3;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            elevation: 10.0,
            title: Text('Questionnaires', style: stylish(25, primColor),),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 40,
              ),
              color: primColor,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const LanguagePage();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOutQuart;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 500),
                  ),
                  (route) => false,
                );
              },
            ),
          ),
          body: Container(
            color: secColor,
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: secColor,
                      border: Border.all(color: primColor, width: 2),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                    padding: const EdgeInsets.all(18.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          question,
                          style: stylish(25, primColor),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                        bottom: 10, left: 10, right: 10, top: 0),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final reponse = reponsesMelangees[index];

                      return InkWell(
                        onTap: () {
                          checkAnswer(index);
                        },
                        child: IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: thirdColor, width: 2),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                              color: getContainerColor(index),
                            ),
                            child: Center(
                              child: Text(
                                reponse,
                                style: stylish(25, thirdColor),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
