import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import'dart:math' as math;

void main(){
  runApp(bmiapp());
}



class bmiapp extends StatefulWidget {
  const bmiapp({Key? key}) : super(key: key);

  @override
  State<bmiapp> createState() => _bmiappState();
}

class _bmiappState extends State<bmiapp> {
  Color firstcolor=Colors.white;
  Color secondcolor=Colors.white;
  bool ? Male=null;
  double Sliderheight=140;
  int weight=60;
  int age=20;
  String status="";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.grey[850],
            appBar: AppBar(
              title:Text("BMI CALCULATOR") ,
              centerTitle: true,
              backgroundColor: Color.fromRGBO(58, 53, 53, 1),
              elevation: 2,
            ),
            body: BodyOftheApp(context),
          );
        }
      ),
    );
  }

  Widget BodyOftheApp(BuildContext context){
    return Center(

      child: Column(
        children: [
          
          //khate aval:
          Container(
            height: 140, 
            child: Row(

              children: [

                //Sotone aval (Male):
                Flexible(         //Flexible miad mige ke masalan on row ya column chjuri ghara begiran tooye parenteshun
                    fit: FlexFit.tight,
                    child:Container(
                      decoration: BoxDecoration(
                        color:Color.fromRGBO(35, 35, 32, 15),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                          color:Color.fromRGBO(88, 88, 88, 0.9),
                            offset: Offset(2,2),
                            blurRadius: 8,
                          ),
                        ]
                      ),
                      margin: EdgeInsets.fromLTRB(8, 8, 4, 8),
                      padding:EdgeInsets.all(20),
                      child:
                      TextButton(
                        onPressed: (){
                          setState(() {
                            Male=true;
                            firstcolor=Colors.redAccent;
                            secondcolor=Colors.white;
                          });
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset("assetss/images/mars.svg",width: 50,color: firstcolor,),
                            SizedBox(height: 5,),
                            Text("Male",style:TextStyle(color: firstcolor),),
                            

                          ],
                        ),


                      ),
                    )
                ),

                //Sotone 2vom (Female):
                Flexible(
                    fit: FlexFit.tight,
                    child:Container(
                      decoration: BoxDecoration(
                          color:Color.fromRGBO(35, 35, 32, 15),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color:Color.fromRGBO(88, 88, 88, 0.9),
                              offset: Offset(2,2),
                              blurRadius: 8,
                            ),
                          ]
                      ),
                      margin: EdgeInsets.fromLTRB(8, 8, 4, 8),
                      padding:EdgeInsets.all(20),
                      child:
                      TextButton(
                        onPressed: (){
                          setState(() {
                            Male=false;
                            firstcolor=Colors.white;
                            secondcolor=Colors.redAccent;
                          });
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset("assetss/images/venus.svg",width: 50,color: secondcolor,),
                            SizedBox(height: 5,),
                            Text("Female",style:TextStyle(color: secondcolor),),


                          ],
                        ),


                      ),
                    )
                ),
              ],
            ),
            ),  

            //khate 2vom:
            Container(
              decoration: BoxDecoration(
                  color:Color.fromRGBO(35, 35, 32, 15),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color:Color.fromRGBO(88, 88, 88, 0.9),
                      offset: Offset(2,2),
                      blurRadius: 8,
                    ),
                  ]
              ),
              margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
              padding:EdgeInsets.all(30),
            //color: Colors.blue,
              height: 145,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Select your height by moving the slider:",style: TextStyle(color: Colors.white70,fontSize: 14),),
                      //SizedBox(height: 1,),
                      
                      Row(
                        children: [
                          Text(Sliderheight.toString().substring(0,3),style: TextStyle(color: Color.fromRGBO(250, 24, 24, 1),fontSize: 16),),
                          Text(" Cm",style: TextStyle(color: Colors.white,fontSize: 12),),
                          

                        ],
                      ),
                      
                      CupertinoSlider(
                          value: Sliderheight,
                          activeColor: Colors.redAccent,
                          min:120 ,
                          max:250,
                          divisions: 130,

                          onChanged:(c){
                            setState(() {
                              Sliderheight=c;

                            });
                          } ),
                      
                    ],
                  )
                ],


            ),
            ),  


            //khate 3vom:
            Container(
            //color: Colors.yellow,
            height: 146,
            child: Row(
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child:Container(
                      decoration: BoxDecoration(
                          color:Color.fromRGBO(35, 35, 32, 15),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color:Color.fromRGBO(88, 88, 88, 0.9),
                              offset: Offset(2,2),
                              blurRadius: 8,
                            ),
                          ]
                      ),
                      margin: EdgeInsets.fromLTRB(8, 8, 4, 8),
                      padding:EdgeInsets.all(20),
                      child:
                      Column(
                        children: [
                          Text("Select your weight:",style:TextStyle(color: Colors.white,fontSize: 15),),
                          SizedBox(height: 1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(weight.toString(),style:TextStyle(color: Color.fromRGBO(250, 24, 24, 1),fontSize: 16),),
                              Text(" Kg",style:TextStyle(color: Colors.white,fontSize: 15),),
                            ],
                          ),

                          SizedBox(height: 5,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight+=1;
                                });
                              },
                              mini: true,
                                backgroundColor: Colors.black45,
                                child: Icon(Icons.add,color: Colors.white,),
                                elevation: 5,
                              ),

                              SizedBox(width: 10,),

                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight-=1;
                                });
                              },
                                mini: true,
                                backgroundColor: Colors.black45,
                                child: Icon(Icons.remove,color: Colors.white,),
                                elevation: 5,
                              ),

                            ],
                          )


                        ],
                      ),
                    )
                ),

                Flexible(
                    fit: FlexFit.tight,
                    child:Container(
                      decoration: BoxDecoration(
                          color:Color.fromRGBO(35, 35, 32, 15),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color:Color.fromRGBO(88, 88, 88, 0.9),
                              offset: Offset(2,2),
                              blurRadius: 8,
                            ),
                          ]
                      ),
                      margin: EdgeInsets.fromLTRB(8, 8, 4, 8),
                      padding:EdgeInsets.all(20),
                      child:
                      Column(
                        children: [
                          Text("How old are you?",style:TextStyle(color: Colors.white,fontSize: 15),),
                          SizedBox(height: 1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(age.toString(),style:TextStyle(color: Color.fromRGBO(250, 24, 24, 1),fontSize: 16),),
                              Text(" yrs",style:TextStyle(color: Colors.white,fontSize: 15),),
                            ],
                          ),

                          SizedBox(height: 5,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age+=1;
                                });
                              },
                                mini: true,
                                backgroundColor: Colors.black45,
                                child: Icon(Icons.add,color: Colors.white,),
                                elevation: 5,
                              ),

                              SizedBox(width: 10,),

                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  if( age>20){
                                  age-=1;}
                                });
                              },
                                mini: true,
                                backgroundColor: Colors.black45,
                                child: Icon(Icons.remove,color: Colors.white,),
                                elevation: 5,
                              ),

                            ],
                          )


                        ],
                      ),
                    )
                ),


              ],

            ),
            ),  

            SizedBox(height: 5,),
            //khate 4om:
            TextButton(
              style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),minimumSize: Size(400, 100),
                  //fixedSize: Size(400,10),
                  backgroundColor: Colors.redAccent),
                  onPressed: (){
                //String status;
                double bmi;
                bmi=weight/math.pow((Sliderheight/100),2);
                String bmii=bmi.toString();
                bmii=bmii.substring(0,5);



                if (Male==null){
                  showCupertinoDialog(context: context,
                      builder: (context)=>CupertinoAlertDialog(
                          title: Text("Error!"),
                          content: Text("You Didn't Choose Your Gender"),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.of(context).pop();
                            },
                                child:Icon(Icons.check_circle_sharp), ),

                          ],));
                }
                else{
                if (age>=20 && Male==true){
                  if(bmi<16){status="Your BMI Status: Severe Thinness ($bmii)";}
                  else if(bmi>=16 && bmi<17){status="Your BMI Status: Moderate Thinness ($bmii)";}
                  else if(bmi>=17 && bmi<18.5){status="Your BMI Status: Mild Thinness ($bmii)";}
                  else if(bmi>=18.5 && bmi<25){status="Your BMI Status: Normal ($bmii)";}
                  else if(bmi>=25 && bmi<30){status="Your BMI Status: Overweight ($bmii)";}
                  else if(bmi>=30 && bmi<35){status="Your BMI Status: Obese Class I ($bmii)";}
                  else if(bmi>=35 && bmi<40){status="Your BMI Status: Obese Class II ($bmii)";}
                  else if(bmi>=40 ){status="Your BMI Status: Obese Class III ($bmii)";}
                  else{status="Error!";}
                }
                else if(age>=20 && Male==false){
                  if(bmi<15){status="Your BMI Status: Severe Thinness ($bmii)";}
                  else if(bmi>=15 && bmi<16){status="Your BMI Status: Moderate Thinness ($bmii)";}
                  else if(bmi>=16 && bmi<17.5){status="Your BMI Status: Mild Thinness ($bmii)";}
                  else if(bmi>=17.5 && bmi<24){status="Your BMI Status: Normal ($bmii)";}
                  else if(bmi>=24 && bmi<29){status="Your BMI Status: Overweight ($bmii)";}
                  else if(bmi>=29 && bmi<34){status="Your BMI Status: Obese Class I ($bmii)";}
                  else if(bmi>=34 && bmi<39){status="Your BMI Status: Obese Class II ($bmii)";}
                  else if(bmi>=39 ){status="Your BMI Status: Obese Class III ($bmii)";}
                  else{status="Error!";}
                }


                else if (age<20){
                  status="We Cannot Calculate BMI For People Under 20";
                }}

                if(Male!=null){
                showCupertinoDialog(context: context,
                    builder: (context)=>CupertinoAlertDialog(
                      title: Text("We Calculated Your BMI... "),
                      content: Text(status),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        },
                            child:Icon(Icons.check_circle_sharp) )

                      ],

                    ));}




              },
              child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Lets Calculate your BMI",style: TextStyle(color: Colors.white,fontSize: 18),),
                      SizedBox(width: 15,),
                      Icon(Icons.calculate_outlined,color: Colors.white),
                    ],
                  )


            ),


        ],
      ),
    );
  }
}
