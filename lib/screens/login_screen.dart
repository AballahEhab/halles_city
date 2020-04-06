import 'package:flutter/material.dart';
import 'package:halls_city/services/firebase_auth.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  String backImg = 'images/login.jpg';
  bool formVisible;
  int _formsIndex;


  @override
  void initState() {
    super.initState();
    formVisible = false;
    _formsIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backImg),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.black45,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: kToolbarHeight + 40),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Halls City",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 33.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            "Halls & workSpaces Booking App",
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: RaisedButton(
                            color: Colors.lightBlue,
                            textColor: Colors.white,
                            elevation: 0.2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text("Login"),
                            onPressed: () {
                              setState(() {
                                formVisible = true;
                                _formsIndex = 1;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: RaisedButton(
                            color: Colors.grey.shade700,
                            textColor: Colors.white,
                            elevation: 0.2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text("Signup"),
                            onPressed: () {
                              setState(() {
                                formVisible = true;
                                _formsIndex = 2;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    OutlineButton.icon(
                      borderSide: BorderSide(color: Colors.lightBlue),
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      icon: Icon(Icons.g_translate),
                      label: Text("Continue with Google"),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: (!formVisible)
                    ? null
                    : Container(
                  color: Colors.black54,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            textColor: _formsIndex == 1
                                ? Colors.white
                                : Colors.black,
                            color:
                            _formsIndex == 1 ? Colors.lightBlue : Colors.white,
                            child: Text("Login"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            onPressed: () {
                              setState(() {
                                _formsIndex = 1;
                              });
                            },
                          ),
                          const SizedBox(width: 10.0),
                          RaisedButton(
                            textColor: _formsIndex == 2
                                ? Colors.white
                                : Colors.black,
                            color:
                            _formsIndex == 2 ? Colors.lightBlue : Colors.white,
                            child: Text("Signup"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            onPressed: () {
                              setState(() {
                                _formsIndex = 2;
                              });
                            },
                          ),
                          const SizedBox(width: 10.0),
                          IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.clear),//دي بتقفل الفورم
                            onPressed: () {
                              setState(() {
                                formVisible = false;
                              });
                            },
                          )
                        ],
                      ),
                      Container(
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          child:
                          _formsIndex == 1 ? LoginForm() : SignupForm(),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  void _login(){
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // Logging in the user to Firebase
      AuthService.login(_email, _password);
    }
  }

  //لسة هاكتب كود ال signUp لما نتفق علي طريقة

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(18.0),
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your E-mail",
              border: OutlineInputBorder(),
            ),
            onSaved:(input) => _email = input,
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter your password",
              border: OutlineInputBorder(),
            ),
            onSaved: (input) => _password = input,
          ),
          const SizedBox(height: 10.0),
          RaisedButton(
            color: Colors.lightBlue,
            textColor: Colors.white,
            elevation: 0.2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text("Login"),
            onPressed: _login,
          ),
        ],
      ),
    );
  }
}

class SignupForm extends StatelessWidget {    //باين من اسمة ولله
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(18.0),
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Enter your E-mail",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter a password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Repeat the password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          RaisedButton(
            color: Colors.lightBlue,
            textColor: Colors.white,
            elevation: 0.2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text("SignUp"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}