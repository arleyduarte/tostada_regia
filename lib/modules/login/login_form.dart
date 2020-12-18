/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/22/20 3:56 PM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/22/20 3:56 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:tostada_regia/models/session_manager.dart';
import 'package:tostada_regia/ux/app_locations.dart';
import 'package:tostada_regia/widgets/background_screen.dart';
import 'package:tostada_regia/widgets/form_button.dart';
import 'package:tostada_regia/widgets/generic_widgets.dart';
import 'package:tostada_regia/widgets/loading_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login_bloc.dart';

class LoginForm extends StatelessWidget {
  FormGroup get form => fb.group({
        'email': FormControl<String>(
          validators: [Validators.required],
        ),
        'password': [Validators.required, Validators.minLength(1)],
      });

  void _submit(BuildContext context, FormGroup form) {

    print(form.control('email').value);
    if (form.valid) {
      context.read<LoginBloc>().add(LoginButtonPressed(username: form.control('email').value, password: form.control('password').value));
    } else {
      form.markAllAsTouched();
    }
  }
  @override
  Widget build(BuildContext context) {

    void _showSignUp() {
      Navigator.pushNamed(context, "/signup");
    }

    _launchForgotPassword() async {
      const url =
          'https://online.tostadaregia.com/tostadaregia/Account/ForgotPassword';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    _moveToNextScreen() {
      if (SessionManager.instance.showLoggingFromHome) {
        SessionManager.instance.showLoggingFromHome = false;
        Navigator.of(context).pushNamedAndRemoveUntil("/", (r) => false);
      } else {
        Navigator.of(context).pop();
      }
    }

    final Widget reactiveFormBuilder = ReactiveFormBuilder(
        form: () => this.form,
        builder: (context, form, child) {
          return Column(
            children: [
              SizedBox(height: 20),
              Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Column(
                    children: [
                      ReactiveTextField(
                        formControlName: 'email',
                        validationMessages: (control) => {
                          ValidationMessage.required:
                              'The email must not be empty',
                          ValidationMessage.email:
                              'The email value must be a valid email',
                          'unique': 'This email is already in use',
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          helperText: '',
                          helperStyle: TextStyle(height: 0.7),
                          errorStyle: TextStyle(height: 0.7),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ReactiveTextField(
                        formControlName: 'password',
                        obscureText: true,
                        validationMessages: (control) => {
                          ValidationMessage.required:
                              'The password must not be empty',
                          ValidationMessage.minLength:
                              'The password must be at least 8 characters',
                        },
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          helperText: '',
                          helperStyle: TextStyle(height: 0.7),
                          errorStyle: TextStyle(height: 0.7),
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),

                    ],
                  )),
              SizedBox(height: 20),
              Container(
                constraints: BoxConstraints(maxWidth: 320),
                child: Column(
                  children: <Widget>[
                    FormButton(
                        text: AppLocalizations.of(context).translate("login"),
                        onPressed: () {
                          _submit(context, form);
                        }),
                    FormButton(
                        text: AppLocalizations.of(context).translate("sign_up"),
                        onPressed: () {
                          _showSignUp();
                        }),
                    FormButton(
                        text: AppLocalizations.of(context)
                            .translate("forgot_my_password"),
                        onPressed: () {
                          _launchForgotPassword();
                        }),
                  ],
                ),
              )
            ],
          );
        });

    final Widget bodyForm = Column(
      children: [
        SizedBox(height: 20),
        reactiveFormBuilder,
        SizedBox(height: 20),
        getBottomMessage(AppLocalizations.of(context).translate('login_msg'))
      ],
    );

    final Widget body = BackgroundScreen(
      title: Text(AppLocalizations.of(context).translate("title")),
      body: bodyForm,
    );

    return BlocProvider<LoginBloc>(
      lazy: false,
      create: (BuildContext context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is Authenticating) {
            LoadingDialog.show(context);
          }

          if (state is LoginSuccessfully) {
            LoadingDialog.hide(context);
            _moveToNextScreen();
          }
        },
        child: body,
      ),
    );
  }
}




