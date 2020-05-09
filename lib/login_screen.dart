import 'package:flutter/material.dart';
import 'authentication.dart';
import 'home.dart';

class Login extends StatefulWidget {
   Login({this.auth, this.loginCallback});
    final BaseAuth auth;
   final VoidCallback loginCallback;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = new GlobalKey<FormState>();
  bool _isLoading=false;
  bool _isLoginForm=false;
  String email,password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: Text('Flutter login demo'),
        ),
        body: Stack(
          children: <Widget>[
            _showForm(),
            showCircularProgress(),
          ],
        ),);
  }
  Widget _showForm() {
  return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
           // showLogo(),
            showEmailInput(),
            showPasswordInput(),
            showPrimaryButton(),
            showSecondaryButton(),
           // showErrorMessage(),
          ],
        ),
      ));
}
  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }
    Widget showEmailInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Email',
            icon:  Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => email = value.trim(),
      ),
    );
  }
    Widget showPasswordInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => password = value.trim(),
      ),
    );
  }
  Widget showPrimaryButton() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            color: Colors.blue,
            child: Text(_isLoginForm ? 'Login' : 'Create account',
                style:  TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: ()
            {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=> Home()),
              );
            },
          ),
        ));
  }
  Widget showSecondaryButton() {
    return FlatButton(
        child: Text(
            _isLoginForm ? 'Create an account' : 'Have an account? Sign in',
            style: TextStyle
            (fontSize: 18.0,
             fontWeight: FontWeight.w300
             )),
        onPressed: ()
        {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> Home(), //change to sign page
          )
          );
        },
        );
  }

}   
    