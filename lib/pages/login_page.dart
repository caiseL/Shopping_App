import 'package:flutter/material.dart';
import 'package:shopping_app_firebase/bloc/login_bloc.dart';
import 'package:shopping_app_firebase/bloc/provider.dart';
import 'package:shopping_app_firebase/providers/user_provider.dart';
import 'package:shopping_app_firebase/utils/utils.dart';
import 'package:shopping_app_firebase/widgets/custom_button_login_page.dart';
import 'package:shopping_app_firebase/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  final userProvider = new UserProvider();
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(
              right: size.height * 0.03,
              top: size.width * 0.15,
              left: size.height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome,", style: Theme.of(context).textTheme.headline1),
              Text("Sign in to continue!",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700)),
              SizedBox(
                height: size.height * 0.125,
              ),
              StreamBuilder(
                  stream: bloc.emailStream,
                  builder: (context, snapshot) {
                    return CustomTextField(
                      labelText: "Email Adress",
                      icon: Icons.email_outlined,
                      isPassword: false,
                      errorText: snapshot.error,
                      onChanged: bloc.changeEmail,
                      keyboardType: TextInputType.emailAddress,
                    );
                  }),
              StreamBuilder(
                  stream: bloc.passwordStream,
                  builder: (context, snapshot) {
                    return CustomTextField(
                      labelText: "Password",
                      onChanged: bloc.changePassword,
                      errorText: snapshot.error,
                      icon: Icons.lock_outline,
                      isPassword: true,
                    );
                  }),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
              StreamBuilder(
                  stream: bloc.formValidStream,
                  builder: (context, snapshot) {
                    return CustomButtonLoginPage(
                      onPressed:
                          snapshot.hasData ? () => _login(bloc, context) : null,
                      text: "Login",
                    );
                  }),
              SizedBox(
                height: size.height * 0.10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed("register-page");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I'm a new user.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 19.5),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  _login(LoginBloc bloc, BuildContext context) async {
    Map info = await userProvider.login(bloc.email, bloc.password);
    (info["ok"])
        ? Navigator.pushReplacementNamed(context, "/")
        : showAlert(context, info);
  }
}
