import 'package:assignment320191506/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment320191506/providers/assignment_data.dart';
import 'package:assignment320191506/providers/user_data.dart';
import 'package:assignment320191506/homescreen.dart';
import 'package:assignment320191506/Track_screen.dart';
import 'package:provider/provider.dart';
class ThemeColors {
  static Color primaryColor = Color(0xff2FC4B2);
}

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
         return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserData()),
        ChangeNotifierProvider(create: (ctx) => AssignmentData()),
      ],
      child: Consumer<UserData>(
        builder: (ctx, userData, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: Color(0xFF2FC4B2),
              // primarySwatch: Colors.amber,
            ),
            home: userData.isSignedIn
                ? Homescreen()
                : FutureBuilder(
                    future: userData.tryAutoLogin(),
                    builder: (ctx, snapshot) =>
                        snapshot.connectionState == ConnectionState.waiting
                            ? Scaffold(
                                body: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : Home()),
        routes: {           // '/': (ctx) => LoginScreen(),
TrackScreen.routeName: (ctx) => TrackScreen(),}
      
    )));
  }
}


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final bitsIdController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

     return Scaffold(
      body: Container(
        width:width,
       height: height,
        child:SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 120,
          ),
          child:Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[    
            Text(
              'CRUX FLUTTER SUMMER GROUP',
              style: TextStyle(fontSize: 40.0,fontWeight:FontWeight.bold,color:ThemeColors.primaryColor)),
            SizedBox(height: 60.0),
             Container(
             alignment: Alignment.centerLeft,
             child:Text(
            'Name',
            style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color:Colors.black, ),),
            ),
           
           TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
              horizontal:8,
              vertical:5 
              ),
              hintText:'Please enter your Name',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),

            ),
          ),
           Container(
             alignment: Alignment.centerLeft,
             child:Text(
            'Id Number',
            style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color:Colors.black, ),),
      ),
           
           TextFormField(
            controller: bitsIdController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
              horizontal:8,
              vertical:5 
              ),
              hintText:'Please enter your BITS ID number',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),

            ),
          ),
            SizedBox(height: 30,),
            Column(
           crossAxisAlignment:CrossAxisAlignment.start,
       children: [
      Text('Password',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color:Colors.black, ),),
      SizedBox(height: 10,),
      Container(
        alignment: Alignment.centerLeft,
        decoration:BoxDecoration(
          color: Color(0xFFE0E0E0)),
          height: 60,
          child:TextField(
            keyboardType: TextInputType.visiblePassword,
            style:TextStyle(
              color: Colors.black
            ),
            controller: passwordController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
              horizontal:8,
              vertical:5 
              ),
              hintText:'Please enter your password',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
          )
      )
    ],
  ),
            SizedBox(height: 30.0,),
             Container(
               height: 50,
               width: width,
               child:Card(
               color:ThemeColors.primaryColor,
                child:TextButton(
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
          
              child:Text('LOG IN',style: TextStyle(color:Colors.white),),     
            ),),),
            SizedBox(height: 20,), 
            Text('Forgot Password ?',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.w600,color:ThemeColors.primaryColor)),
            SizedBox(height: 80.0,),
             GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Don\'t have an account  ',
                    style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.w400,color:Colors.black),
                    children: [
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          fontSize: 20.0,
                          color:ThemeColors.primaryColor
                        ),
                      ),
                    ]
                  ),
                ),
              ),
          
            ] 
        ),
      ),
    ),  
  );
  }
}

class Second extends StatefulWidget {

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final bitsIdController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  String dropdownValue = '2020';
  
  bool _value = false;
  var __value;
 String? value ; 
 

 
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

     return Scaffold(
       
      body: Container(
       width:width,
       height: height,
        child:SingleChildScrollView(
            padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 30,
        
          ),
          child:Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Center(
                child:Container(
                
                 constraints: BoxConstraints(minHeight: 80,minWidth: width,),
                 decoration: BoxDecoration(color:ThemeColors.primaryColor),
                 alignment:Alignment.center,
                 child:Text('CRUX FLUTTER SUMMER GROUP',style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,),)
              ),),
             SizedBox(height: 20.0,), 
              Container(
             alignment: Alignment.centerLeft,
             child:Text(
            'Name',
            style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color:Colors.black, ),),
            ),
           
           TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
              horizontal:8,
              vertical:5 
              ),
              hintText:'Please enter your Name',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),

            ),
          ),
             Container(
             alignment: Alignment.centerLeft,
             child:Text(
            'ID Number',
            style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color:Colors.black, ),),
      ),
           
           TextFormField(
            controller: bitsIdController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
              horizontal:8,
              vertical:5 
              ),
              hintText:'Please enter your BITS ID number',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),

            ),
          ),
          
            
            SizedBox(height: 10.0,),
              Column(
             crossAxisAlignment:CrossAxisAlignment.start,
       children: [
      Text('Password',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color:Colors.black, ),),
      SizedBox(height: 10,),
      Container(
        alignment: Alignment.centerLeft,
        decoration:BoxDecoration(
          color: Color(0xFFE0E0E0)),
          height: 60,
          child:TextField(
            keyboardType: TextInputType.visiblePassword,
            style:TextStyle(
              color: Colors.black
            ),
            controller: passwordController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
              horizontal:8,
              vertical:5 
              ),
              hintText:'Please enter your password',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
          )
      )
    ],
  ),
            SizedBox(height: 20.0,),
             
            Text('Batch',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color:Colors.black ),),
            DropdownButtonHideUnderline(
                            child: DropdownButton(
                              icon: Icon(
                                Icons.expand_more_sharp,
                              ),
                              dropdownColor: Color(0xFFE0E0E0),
                              isExpanded: true,
                              value: dropdownValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                for (var i = 2017; i <= 2021; i += 1) '$i'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
           SizedBox(height: 20.0,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children:[
               Container(
                 color: Colors.white12,
                 constraints: BoxConstraints(maxHeight: 70,),
                 child: Text('Receive Regular Updates',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.w600,color:Colors.black ),),
             ),
            Switch(
              activeColor: ThemeColors.primaryColor,
              value: _value, 
            onChanged: (val){
              setState(() {
                _value=val;
                print(_value);
              }
              );
            }
            ),]),
            SizedBox(height: 30.0,),

           Text('Are you excited for this !!',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.w600,color:Colors.black ),),
            SizedBox(height: 10,),
           Row(
              mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Radio(
                 activeColor: ThemeColors.primaryColor,
                value:1, 
               groupValue:__value,
               onChanged: (value){
                  setState((){
                  __value = value;
               
               });
               },),
              
               Text('Yes',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.w600,color:Colors.black ),),
                SizedBox(width: 130,),

               Radio(
                 activeColor: ThemeColors.primaryColor,
                 value: 2, 
               groupValue:__value,
               onChanged: (value){
                setState((){
                  __value = value;
                });
               
               }),
               Text('No',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.w600,color:Colors.black ),),
             ]),
           SizedBox(height: 20.0,),
           Container(
             height: 50,
             width: width,
             child:Card(
               color:ThemeColors.primaryColor,
               child:TextButton(
              onPressed:() {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Greetings(bitsIdNumber: bitsIdController.text,
                    )));
              }, 
              child:Text('REGISTER',style: TextStyle(color:Colors.white),), 
              
              ),),),
            SizedBox(height: 20.0,),
             GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account  ',
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color:ThemeColors.primaryColor
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ]
      
    ),),),);
  }
}

//ignore: must_be_immutable
class Greetings extends StatefulWidget {
final String bitsIdNumber;
 const Greetings({Key? key, required this.bitsIdNumber,})
      : super(key: key);

  @override
  _GreetingsState createState() => _GreetingsState();
}

class _GreetingsState extends State<Greetings> {

  @override
  Widget build(BuildContext context) {
     double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
         width:width,
         height: height,

        child:SingleChildScrollView(
          padding:EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 90
          ),
          child:Column(
            mainAxisAlignment:MainAxisAlignment.center,
          
            children:[
              Padding(padding: const EdgeInsets.all(20.0),),
              SizedBox(height: 50.0,),
              FittedBox(alignment:Alignment.center

              ),
            Container(
            
            child:Text('CRUX FLUTTER SUMMER GROUP',
            style: TextStyle(fontSize: 40.0,fontWeight:FontWeight.bold,color:Color(0xff2FC4B2))),),
            
           
             SizedBox(height: 100.0),
            Center(
              child:FittedBox(
                child:
            Text('Welcomes you',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color:Colors.black ),),),),
            SizedBox( height: 70.0,),
            Container(
              child:Text(
                 widget.bitsIdNumber,
                style:TextStyle(fontSize: 40.0,fontWeight:FontWeight.bold,color:Colors.black ),
              ),

            ),
            SizedBox( height: 50.0,),
            Text('Have a great journey ahead!!',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color:Colors.black ),),
            ]
          ))));
     
      
    
  }
}