import 'package:flutter/material.dart';
import 'dart:async';
import 'whizchat.dart';
import 'home.dart';
import 'virtual_partner_2.dart';

class VirtualPartner1 extends StatefulWidget {
  final int i;
  final int j;

  VirtualPartner1({required this.i, required this.j});

  @override
  _VirtualPartner1State createState() => _VirtualPartner1State();
}

class _VirtualPartner1State extends State<VirtualPartner1> with SingleTickerProviderStateMixin {
  Timer? timer;
  int seconds = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
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
        if (seconds == 45) {
          int VP_j = (widget.j) % 4;
          int nextI = widget.i;
          if (((widget.i + 1) % 4) == 0){  // to make it update the workout once after 4 sets
             nextI++;
          };
          int nextJ = widget.j + 1;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => VirtualPartner2(initialSeconds: seconds, i: nextI, j: nextJ, VP_j: VP_j,),
            ),
          );
        }
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

    int task_weight = weights[widget.j % 4];
    int task_reps = reps[widget.j % 4];
    int VPreps = reps[widget.j % 4] - 2;
    int VPweight = weights[widget.j % 4] + 4;
    String exercise = exercises[widget.i % exercises.length];
    if (widget.j >= 8){
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
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'TASK',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.purple[300],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'TAKE\nREST',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 45),
                GestureDetector(
                  onTap: () {},
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
                        FadeTransition(
                          opacity: _controller,
                          child: Icon(
                            Icons.fitness_center,
                            color: Colors.blue[300],
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
                      'Your partner is doing his set!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  'Take your rest until your partner finishes his set',
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
