import 'package:flutter/material.dart';
import 'virtual_coach_2.dart';
import 'whizchat.dart';
import 'home.dart';

class VirtualCoach1 extends StatelessWidget {
  final int i;
  final int j;

  VirtualCoach1({required this.i, required this.j});

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

    int task_weight = weights[j % 4];
    int task_reps = reps[j % 4];
    int VPreps = reps[j % 4] - 2;
    int VPweight = weights[j % 4] + 4;
    String exercise = exercises[i % exercises.length];
    if (j >= 8){
      String VP_weight, task_weight = "MID";
    };
    return Scaffold(
      extendBody: true, // Ensures the body extends behind the navigation bar
      backgroundColor: Color(0xFF1C1A26), // Hex color background
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 35),
                Icon(
                  Icons.person,
                  color: Colors.blueAccent,
                  size: 50,
                ),
                SizedBox(height: 10),
                Text(
                  'Virtual Coach',
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
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: task_reps.toString(),
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
                                  text: task_weight.toString(),
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
                    // Navigate to Virtual Coach 2 page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VirtualCoach2(i: i, j: j)),
                    );
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xFF1C1A26), // Background color same as the page
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4), // White borders
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/virtual_coach_start.png', // Ensure this path is correct
                          width: 45,
                          height: 45,
                        ),
                        SizedBox(height: 3),
                        Text(
                          'START',
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
                Text(
                  'Click when you’re ready to start your set!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Make sure to use proper form',
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
        height: 120, // Adjust height to ensure enough space for shadow and larger circle
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
              offset: Offset(0, -3), // changes position of shadow
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
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(10), // Adjust padding for larger circle
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
