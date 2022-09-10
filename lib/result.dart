import 'package:flutter/material.dart';


class Result extends StatelessWidget {

  var age;
  var isMale;
  var result;
  String info;
  Color color;
  var height;
  var weight;

  Result({
    @required this.age,
    required this.result,
    @required this.isMale,
    required this.info,
    required this.color,
    @required this.height,
    @required this.weight,
  });





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff20292f),
      ),
      backgroundColor: Color(0xff20292f),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 440,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0, //width: height
                      crossAxisSpacing: 10, //space between each item
                      mainAxisSpacing: 10, //space between rows
                    ),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff303e47)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 15,),
                            Text(
                              'GENDER',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[400]
                              ),
                            ),
                            SizedBox(height: 45,),
                            Text(
                              '${isMale ? "MALE":"FEMALE"}',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff303e47)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 15,),
                            Text(
                              'AGE',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[400]
                              ),
                            ),
                            SizedBox(height: 45,),
                            Text(
                              '$age',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff303e47)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 15,),
                            Text(
                              'HEIGHT',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[400]
                              ),
                            ),
                            SizedBox(height: 45,),
                            Text(
                              '$height',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff303e47)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 15,),
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[400]
                              ),
                            ),
                            SizedBox(height: 45,),
                            Text(
                              '$weight',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff303e47)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${double.parse((result).toStringAsFixed(1))}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                      SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("BMI",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                          Text("$info",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: color),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

