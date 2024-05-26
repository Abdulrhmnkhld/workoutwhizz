import 'package:flutter/material.dart';
import 'home.dart';
class ProfileCreationPage extends StatefulWidget {
  @override
  _ProfileCreationPageState createState() => _ProfileCreationPageState();
}

class _ProfileCreationPageState extends State<ProfileCreationPage> {
  bool? normal = false;
  bool? fit = false;
  bool? extraFit = false;
  bool? cut = false;
  bool? bulk = false;
  bool? leanBulk = false;
  bool? sunday = false;
  bool? monday = false;
  bool? tuesday = false;
  bool? wednesday = false;
  bool? thursday = false;
  bool? friday = false;
  bool? saturday = false;
  bool? sixAM = false;
  bool? tenAM = false;
  bool? twoPM = false;
  bool? fourPM = false;
  bool? sixPM = false;
  bool? tenPM = false;
  bool? other = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/3rdlogoblurred.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centered content
          Center(
            child: SingleChildScrollView(
              // Use SingleChildScrollView to avoid overflow issues
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60),
                  Text(
                    'Let us know more!',
                    style: TextStyle(
                      fontSize: 32,
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
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 2.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Profile creation',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 2.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fitness level',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8, // Adjust the scale to reduce checkbox size
                                          child: CheckboxListTile(
                                            title: Text('Normal', style: TextStyle(color: Colors.white)),
                                            value: normal,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                normal = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('Fit', style: TextStyle(color: Colors.white)),
                                            value: fit,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                fit = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('Extra fit', style: TextStyle(color: Colors.white)),
                                            value: extraFit,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                extraFit = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Goal',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('Cut', style: TextStyle(color: Colors.white)),
                                            value: cut,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                cut = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('Bulk', style: TextStyle(color: Colors.white)),
                                            value: bulk,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                bulk = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('Lean Bulk', style: TextStyle(color: Colors.white)),
                                            value: leanBulk,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                leanBulk = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Preferred Workout Days',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('Sunday', style: TextStyle(color: Colors.white)),
                                            value: sunday,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                sunday = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('Monday', style: TextStyle(color: Colors.white)),
                                            value: monday,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                monday = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('Tuesday', style: TextStyle(color: Colors.white)),
                                            value: tuesday,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                tuesday = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('Wednesday', style: TextStyle(color: Colors.white)),
                                            value: wednesday,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                wednesday = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('Thursday', style: TextStyle(color: Colors.white)),
                                            value: thursday,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                thursday = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('Friday', style: TextStyle(color: Colors.white)),
                                            value: friday,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                friday = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('Saturday', style: TextStyle(color: Colors.white)),
                                            value: saturday,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                saturday = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Preferred Workout Times',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('6 AM', style: TextStyle(color: Colors.white)),
                                            value: sixAM,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                sixAM = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('10 AM', style: TextStyle(color: Colors.white)),
                                            value: tenAM,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                tenAM = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('2 PM', style: TextStyle(color: Colors.white)),
                                            value: twoPM,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                twoPM = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('4 PM', style: TextStyle(color: Colors.white)),
                                            value: fourPM,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                fourPM = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('6 PM', style: TextStyle(color: Colors.white)),
                                            value: sixPM,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                sixPM = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.white),
                                        child: Transform.scale(
                                          scale: 0.8,
                                          child: CheckboxListTile(
                                            title: Text('10 PM', style: TextStyle(color: Colors.white)),
                                            value: tenPM,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                tenPM = value;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            contentPadding: EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Theme(
                                              data: ThemeData(unselectedWidgetColor: Colors.white),
                                              child: Transform.scale(
                                                scale: 0.8,
                                                child: CheckboxListTile(
                                                  title: Text('Other', style: TextStyle(color: Colors.white)),
                                                  value: other,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      other = value;
                                                    });
                                                  },
                                                  controlAffinity: ListTileControlAffinity.leading,
                                                  checkColor: Colors.black,
                                                  activeColor: Colors.white,
                                                  side: BorderSide(color: Colors.white),
                                                  contentPadding: EdgeInsets.all(0),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 20),
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.white, width: 2),
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.transparent,
                                              ),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Specify',
                                                  hintStyle: TextStyle(color: Colors.white54),
                                                ),
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Weight',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your weight',
                              hintStyle: TextStyle(color: Colors.white54),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Personal Records (PR)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Throughout last month',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Flat DB press',
                                    hintStyle: TextStyle(color: Colors.white54),
                                  ),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Incline DB press',
                                    hintStyle: TextStyle(color: Colors.white54),
                                  ),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Squat',
                                    hintStyle: TextStyle(color: Colors.white54),
                                  ),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Deadlift',
                                    hintStyle: TextStyle(color: Colors.white54),
                                  ),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage())
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                'Done',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'NOTE: Enter at least the latest 5 PRs for each exercise',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
