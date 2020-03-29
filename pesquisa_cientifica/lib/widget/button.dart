import 'package:flutter/material.dart';
import 'package:pesquisa_cientifica/onboarding.dart';
import 'package:pesquisa_cientifica/widget/inputEmail.dart';
import 'package:toast/toast.dart';

class ButtonLogin extends StatefulWidget {
 ButtonLogin({Key key, this.usuario, this.senha}) : super(key: key);

  String usuario;
  String senha;

  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blue[300],
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FlatButton(
          onPressed: () {
            if (this.widget.usuario == null  ||  this.widget.senha == null){
              Toast.show("Usuario/ Senha em Branco", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM, backgroundColor: Colors.redAccent, textColor: Colors.black, backgroundRadius: 20);
            }
            else if (this.widget.usuario.isEmpty ||  this.widget.senha.isEmpty){
              Toast.show("Usuario/ Senha em Branco", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM, backgroundColor: Colors.redAccent, textColor: Colors.black, backgroundRadius: 20);
             }
            else if (this.widget.usuario == 'operador' &&  this.widget.senha == '123'){
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnBoardingPage()));
             }
            else if(this.widget.usuario == 'paciente' &&  this.widget.senha == '123'){
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnBoardingPage()));
             }
            else{
               Toast.show("Usuario/ Senha incorretos", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM, backgroundColor: Colors.redAccent, textColor: Colors.black, backgroundRadius: 20);
             }
             print(this.widget.usuario);
             print(this.widget.senha);

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'OK',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
