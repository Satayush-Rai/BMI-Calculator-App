import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class bmiCalcScreen extends StatelessWidget{
  var avg;
  var avg1;
  var bmiresult;
  var topic;
  bmiCalcScreen(this.avg,this.avg1);

  @override
  Widget build(BuildContext context){
    bmiresult = (avg1*10000)/(avg*avg);
    if(bmiresult<=16){
      topic = 'Severe Thinness';
    }
    else if(bmiresult>=16 && bmiresult<25){
      topic = 'Normal';
    }
    else if(bmiresult>=25 && bmiresult<30){
      topic = 'Overweight';
    }
    else{
      topic = 'Obese';
    }
    double res = double.parse((bmiresult).toStringAsFixed(2));
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.orangeAccent,
          ),
          child: Card(
            elevation: 15,
            shadowColor: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SfRadialGauge(
                  title: const GaugeTitle(text: 'Body Mass Index',
                  textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepPurple),),
                  enableLoadingAnimation: true,
                  animationDuration: 5000,
                  axes: <RadialAxis>[
                    RadialAxis(minimum: 10,maximum: 40,ranges: [
                      GaugeRange(startValue: 10,
                          endValue: 16,
                      color: Colors.lightGreen,
                      startWidth: 10,
                      endWidth: 10,
                      ),
                      GaugeRange(startValue: 16,
                        endValue: 25,
                        color: Colors.green,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                      GaugeRange(startValue: 25,
                        endValue: 30,
                        color: Colors.amber,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                      GaugeRange(startValue: 30,
                        endValue: 40,
                        color: Colors.red,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: res,
                      )
                    ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(widget: Container(
                          child: Text("$res",
                          style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepPurple),
                          ),
                        ),
                          angle: 90,
                          positionFactor: 0.5,
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  'Your Category: $topic',
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.purpleAccent),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}