import 'package:flutter/material.dart';
import 'package:shopping_app_firebase/bloc/login_bloc.dart';
import 'package:shopping_app_firebase/bloc/provider.dart';
import 'package:shopping_app_firebase/providers/user_provider.dart';
import 'package:shopping_app_firebase/utils/utils.dart';
import 'package:shopping_app_firebase/widgets/custom_button_login_page.dart';
import 'package:shopping_app_firebase/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key key}) : super(key: key);

  final userProvider = UserProvider();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);
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
              Text("Create Account,",
                  style: Theme.of(context).textTheme.headline1),
              Text("Sign up to get started!",
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
                      keyboardType: TextInputType.emailAddress,
                      counterText: snapshot.data,
                      errorText: snapshot.error,
                      labelText: "Email Adress",
                      icon: Icons.email_outlined,
                      onChanged: bloc.changeEmail,
                      isPassword: false,
                    );
                  }),
              StreamBuilder(
                stream: bloc.passwordStream,
                builder: (context, snapshot) {
                  return CustomTextField(
                    keyboardType: TextInputType.text,
                    errorText: snapshot.error,
                    counterText: snapshot.data,
                    onChanged: bloc.changePassword,
                    labelText: "Password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                  );
                },
              ),
              /*
              CustomTextField(
                labelText: "Repeat password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),*/
              StreamBuilder(
                stream: bloc.formValidStream,
                builder: (context, snapshot) {
                  return CustomButtonLoginPage(
                      text: "Register",
                      onPressed: snapshot.hasData
                          ? () => _register(bloc, context)
                          : null);
                },
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed("login-page"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I'm already a member",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Sign in",
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0),
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

  _register(LoginBloc bloc, BuildContext context) async {
    Map info = await userProvider.newUser(bloc.email, bloc.password);
    (info["ok"])
        ? Navigator.pushReplacementNamed(context, "/")
        : showAlert(context, info);
  }
}
