import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';
import 'whizchat.dart';
import 'virtual_coach_1.dart';

class VirtualPartner2 extends StatefulWidget {
  final int initialSeconds;
  final int i;
  final int j;
  final VP_j;

  VirtualPartner2({required this.initialSeconds, required this.i, required this.j, required this.VP_j});

  @override
  _VirtualPartner2State createState() => _VirtualPartner2State();
}

class _VirtualPartner2State extends State<VirtualPartner2> with SingleTickerProviderStateMixin {
  Timer? timer;
  late int seconds;
  late AnimationController _controller;
  //int VPreps = reps[widget.j];
  @override
  void initState() {
    super.initState();
    seconds = widget.initialSeconds;
    startTimer();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
        _controller.forward(from: 0);  // Reset the animation to sync with the timer
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  String get timerText {
    int minutes = seconds ~/ 60;
    int displaySeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${displaySeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    List<String> exercises = [
      "Incline DB press",
      "Flat Machine press",
      "H to L cable Flies",
      "L to H Cable Flies",
      "Skull crushers",
      "Tricep extensions"
    ];
    List<int> reps = [14, 12, 10, 8];
    List<int> weights = [32, 34, 36, 38];
    int task_weight = weights[widget.j];
    int task_reps = reps[widget.j];
    int VPreps = reps[widget.VP_j] - 2;
    int VPweight = weights[widget.VP_j] + 4;
    String exercise = exercises[widget.i % exercises.length];

    if (widget.VP_j >= 8){
      String VP_weight, task_weight = "MID";
    };
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFF1C1A26),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 35),
                Image.asset(
                  'assets/images/virtual_partner_icon.png',
                  width: 50,
                  height: 50,
                ),
                SizedBox(height: 10),
                Text(
                  'Virtual Partner',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 45),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'EXERCISE',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.purple[300],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            exercise,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'VP STATS',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.purple[300],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: VPreps.toString(),
                                  //reps[widget.VP_j % reps.length].toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.purple[300],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' REPS',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 7.5),
                          Container(
                            width: 60,
                            height: 2.5,
                            color: Colors.white,
                          ),
                          SizedBox(height: 7.5),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: VPweight.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.purple[300],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' KGS',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 45),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => VirtualCoach1(i: widget.i, j: widget.j))
                    );
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xFF1C1A26),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          timerText,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.purple[300],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 7.5),
                        Container(
                          width: 60,
                          height: 2.5,
                          color: Colors.white,
                        ),
                        SizedBox(height: 7.5),
                        Text(
                          'NEXT',
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '*Partner Name* finished his set!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  'Press next when you’re done with your rest',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white70,
                    decorationThickness: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.indigo.withOpacity(0.3),
                      Colors.deepPurple.withOpacity(0.7),
                      Colors.purple.withOpacity(0.7),
                      Colors.black.withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: GestureDetector(
                      onTap: () {
                        // Navigate to Profile page
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.person, color: Colors.white, size: 65),
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: GestureDetector(
                      onTap: () {
                        // Navigate to Home page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 25),
                        child: Icon(Icons.home, color: Colors.white, size: 35),
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: GestureDetector(
                      onTap: () {
                        // Navigate to chat page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WhizChatPage()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 25),
                        child: Icon(Icons.chat_rounded, color: Colors.white, size: 35),
                      ),
                    ),
                    label: '',
                  ),
                ],
                onTap: (index) {
                  // Handle navigation tap
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
