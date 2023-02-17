import 'package:bmi_calculator/bmiCalcScreen.dart';
import 'package:bmi_calculator/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var gender = '';
  var avg = 0.0;
  var avg1 = 0.0;
  RangeValues values = const RangeValues(50, 200);
  RangeValues values1 = const RangeValues(2, 150);
  @override
  Widget build(BuildContext context){
    RangeLabels labels = RangeLabels(values.start.toString(), values.end.toString());
    RangeLabels labels1 = RangeLabels(values1.start.toString(), values1.end.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator')
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      gender='MALE';
                    });
                  },
                  child: Card(
                    elevation: 12,
                    shadowColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.lightGreenAccent,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.male_rounded,
                          size: 60,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      gender='FEMALE';
                    });
                  },
                  child: Card(
                    elevation: 12,
                    shadowColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.lightGreenAccent,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.female_rounded,
                          size: 60,
                        ),
                      ),
                    ),
                  ),
                ),
             ]
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Select Height",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepPurple),
            ),
            Card(
              elevation: 12,
              shadowColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                height: 150,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lightGreenAccent,
                ),
                child: RangeSlider(
                  values: values,
                  labels: labels,
                  divisions: 20,
                  onChanged: (newValue){
                    setState(() {
                      values = newValue;
                      avg = (values.start.toInt()+values.end.toInt())/2;
                    });
                  },
                  min: 0,
                  max: 200,
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.pink,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Average Height : $avg cms.",
              style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepPurple),
            ),
            const SizedBox(
              height: 10,
            ),
           const Text(
               "Select Weight",
             style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepPurple),
            ),
            Card(
              elevation: 12,
              shadowColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                height: 150,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lightGreenAccent,
                ),
                child: RangeSlider(
                  values: values1,
                  labels: labels1,
                  divisions: 20,
                  onChanged: (newValue1){
                    setState(() {
                      values1 = newValue1;
                      avg1 = (values1.start.toInt()+values1.end.toInt())/2;
                    });
                  },
                  min: 0,
                  max: 200,
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.pink,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Average Weight : $avg1 Kg",
              style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepPurple),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 12,
              shadowColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lightGreenAccent,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                  ),
                  onPressed: (){
                    if(avg!=0.0 && avg1!=0.0){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => bmiCalcScreen(avg.toDouble(),avg1.toDouble()),)
                      );
                    }
                    else{
                      setState(() {
                        const Text('Fill All Required Details');
                      });
                    }
                  },
                  child: const Text(''
                      'Calculate',
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepPurple),
                  ),
                )
              ),
            ),
          ]
        ),
      ),
    );
  }
}
