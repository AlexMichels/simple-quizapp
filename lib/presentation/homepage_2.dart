import 'package:flutter/material.dart';
import 'package:quizapp/application/icon_list.dart';

import 'package:quizapp/presentation/widgets/custom_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


int score = 0;
int length = questionList.length;

void CounterIncrease(context){
  if(counter< questionList.length-1){counter++;}
  else if (score > 9) {Alert(
      context: context,
      type: AlertType.success,
      title: "Good Job, You scored $score/$length ",
      desc: "You done the quiz. Do you like to take it again?",
      buttons: [
        DialogButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: Text(
              "Take Again",
              textAlign: TextAlign.center,
              
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    counter = 0;
    score = 0;
    
    list= [];
   }
   else {Alert(
      context: context,
      type: AlertType.error,
      title: "Ops.. , You scored $score/$length ",
      desc: "You done the quiz. Do you like to take it again?",
      buttons: [
        DialogButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: Text(
              "Take Again",
              textAlign: TextAlign.center,
              
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    counter = 0;
    score = 0;
    
    list= [];
    }
   
}

void CheckAnswer(bool answer) {
  if (answer == questionList[counter].answer()) {
    list.add(Icon(Icons.check, color: Colors.lightGreenAccent, size: 28,));
    score++;
  } else {
    list.add(Icon(Icons.close, color: Colors.redAccent,size: 28,));
  }
}

class HomepageStf extends StatefulWidget {
  const HomepageStf({Key? key}) : super(key: key);

  @override
  State<HomepageStf> createState() => _HomepageStfState();
}

class _HomepageStfState extends State<HomepageStf> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  children: list,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      questionList[counter].question(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "",
                        letterSpacing: 1.3,
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  buttonColor: Colors.lightGreenAccent,
                  buttonText: 'True',
                  onPress: () {
                    setState(() {
                      CheckAnswer(true);
                      CounterIncrease(context);
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  buttonColor: Colors.redAccent,
                  buttonText: 'False',
                  onPress: () {
                   
                    setState(() {
                      CheckAnswer(false);
                      CounterIncrease(context);
                    });
                  },
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
