import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logindice/dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}


class _LogInState extends State<LogIn> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){}
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){}
          )
        ],
      ),
      body: Builder(
        builder:(context){
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 50.0)),
                  Center(
                    child: Image(image: AssetImage('image/chef.gif'),
                      width: 170.0,
                      height: 190.0,
                    ),
                  ),
                  Form(
                    child: Theme(data: ThemeData(
                        primaryColor: Colors.teal,
                        inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(color: Colors.teal,
                              fontSize: 15),
                        )
                    ),
                        child: Container(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              TextField(
                                // autofocus: true,
                                controller: controller1,
                                decoration: InputDecoration(
                                    labelText: 'Enter "Dice"'
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              TextField(
                                controller: controller2,
                                decoration: InputDecoration(
                                    labelText: 'Enter "Password"'
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              SizedBox(height: 40.0,),
                              ButtonTheme(
                                minWidth: 100,
                                height: 50,
                                child: RaisedButton(
                                  color: Colors.orangeAccent,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 35.0,
                                  ),
                                  onPressed: (){

                                    if(controller1.text == 'dice' && controller2.text == '1234'){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (BuildContext context)=>Dice()));
                                    }else if(controller1.text == 'dice' && controller2.text !='1234'){
                                      showSackBar2(context);
                                    }else if(controller1.text != 'dice' && controller2.text =='1234'){
                                      showSackBar3(context);
                                    }else{
                                      showSackBar1(context);
                                    }
                                  },

                                ),
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
          );
        },
      ),

    );
  }
}

void showSackBar1(BuildContext context){
  Scaffold.of(context).showSnackBar(
      SnackBar(content:
       Text('로그인정보를 다시 확인해주세요',
       textAlign: TextAlign.center,) ,
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
  ));
}
void showSackBar2(BuildContext context){
  Scaffold.of(context).showSnackBar(
      SnackBar(content:
       Text('비밀번호가 일치하지 않습니다.',
       textAlign: TextAlign.center,) ,
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
  ));
}
void showSackBar3(BuildContext context){
  Scaffold.of(context).showSnackBar(
      SnackBar(content:
       Text('아이디가 일치하지 않습니다.',
       textAlign: TextAlign.center,) ,
        duration: Duration(seconds: 2),
        backgroundColor: Colors.teal,
  ));
}
