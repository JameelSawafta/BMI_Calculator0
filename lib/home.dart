import 'dart:async';
import 'dart:math';

import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _val=180.0;
  var _age=20;
  var _weight=80;
  bool _isMale=true;
  Timer? timer;
  late double _result;
  late String _info;
  late Color _color;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff20292f),
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff20292f),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _isMale=true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _isMale == true ? Color(0xff3a5fcd):Colors.grey[800]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male,size: 70,color: Colors.white,),
                            SizedBox(height: 15,),
                            Text(
                                'MALE',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _isMale=false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _isMale == false ? Color(0xffee1289):Colors.grey[800]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female,size: 70,color: Colors.white),
                            SizedBox(height: 15,),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(

                decoration: BoxDecoration(
                  color: Color(0xff303e47),
                  borderRadius: BorderRadius.circular(10)
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                      SizedBox(height: 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                              "${_val.round()}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                                color: Colors.white
                            ),
                          ),
                          Text('cm',style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      Slider(
                          value: _val,
                          activeColor:Colors.white,
                          thumbColor: Color(0xffE6144B),
                          inactiveColor: Colors.grey,
                          min: 80.0,
                          max: 220.0,
                          onChanged: (value){
                            setState(() {
                              _val=value ;
                            });
                          }
                      )
                    ],
                  )
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff303e47),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("WEIGHT",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                              Text("$_weight",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.white),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTapDown: (TapDownDetails details) {
                                      timer = Timer.periodic(Duration(milliseconds: 100), (t) {
                                        setState(() {
                                          if(_weight>0)
                                            _weight--;
                                        });
                                      });
                                    },
                                    onTapUp: (TapUpDetails details) {
                                      timer?.cancel();
                                    },
                                    onTapCancel: () {
                                      timer?.cancel();
                                    },
                                    child: FloatingActionButton(
                                      heroTag: "w--",
                                      backgroundColor: Color(0xff424652),
                                        onPressed: (){
                                          setState(() {
                                            if(_weight>0)
                                              _weight--;
                                          });
                                        },
                                      mini: true,
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  GestureDetector(
                                    onTapDown: (TapDownDetails details) {
                                      timer = Timer.periodic(Duration(milliseconds: 100), (t) {
                                        setState(() {
                                          _weight++;
                                        });
                                      });
                                    },
                                    onTapUp: (TapUpDetails details) {
                                      timer?.cancel();
                                    },
                                    onTapCancel: () {
                                      timer?.cancel();
                                    },
                                    child: FloatingActionButton(
                                      heroTag: "w++",
                                      backgroundColor: Color(0xff424652),
                                        onPressed: (){
                                          setState(() {
                                            _weight++;
                                          });
                                        },
                                      mini: true,
                                      child: Icon(Icons.add),
                                    ),
                                  )
                                ],
                              )

                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff303e47),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("AGE",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                              Text("$_age",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.white),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTapDown: (TapDownDetails details) {
                                      timer = Timer.periodic(Duration(milliseconds: 200), (t) {
                                        setState(() {
                                          if(_age>0)
                                            _age--;
                                        });
                                      });
                                    },
                                    onTapUp: (TapUpDetails details) {
                                      timer?.cancel();
                                    },
                                    onTapCancel: () {
                                      timer?.cancel();
                                    },
                                    child: FloatingActionButton(
                                      heroTag: "a--",
                                      backgroundColor: Color(0xff424652),
                                      onPressed: (){
                                        setState(() {
                                          if(_age>0)
                                            _age--;
                                        });
                                      },
                                      mini: true,
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  GestureDetector(
                                    onTapDown: (TapDownDetails details) {
                                      timer = Timer.periodic(Duration(milliseconds: 200), (t) {
                                        setState(() {
                                          if(_age<110)
                                            _age++;
                                        });
                                      });
                                    },
                                    onTapUp: (TapUpDetails details) {
                                      timer?.cancel();
                                    },
                                    onTapCancel: () {
                                      timer?.cancel();
                                    },
                                    child: FloatingActionButton(
                                      heroTag: "a++",
                                      backgroundColor: Color(0xff424652),
                                      onPressed: (){
                                        setState(() {
                                          if(_age<110)
                                            _age++;
                                        });
                                      },
                                      mini: true,
                                      child: Icon(Icons.add),
                                    ),
                                  )
                                ],
                              )

                            ],
                          ),
                        ),
                      ),
                    ],
              )
            ),
          ),
          Container(
            width: double.infinity,
              color: Color(0xffE6144B),
              child: MaterialButton(
                onPressed: () {
                  _result = _weight / pow(_val/100, 2);
                  if (_result>=18.5 && _result <= 25.0) {
                    _info = "NORMAL";
                    _color = Colors.green;

                  }
                  else if(_result<18.5) {
                    _info = "UNDERWEIGHT";
                    _color = Colors.blue;
                  }
                  else {
                    _info = "OVERWEIGHT";
                    _color = Color(0xffE6144B);
                  }
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Result(
                        age: _age,
                        isMale: _isMale,
                        result: _result,
                        info: _info,
                        color : _color,
                        height: _val.round(),
                        weight: _weight.round(),
                      )
                  )
                  );
                },
                height: 50,
                child: Text('CALCULATE',style: TextStyle(color: Colors.white),),

          ) ),
        ],
      ),

    );
  }
}
