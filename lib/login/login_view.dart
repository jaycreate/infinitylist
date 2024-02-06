import 'package:flutter_application_4/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/utils/utils.dart';
import 'package:flutter_application_4/widgets/widgets.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final LoginViewModel _viewModel = Get.put(LoginViewModel());

  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  FormType _formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: _formType == FormType.login
            ? const Text('Login')
            : const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: _formType == FormType.login ? loginForm() : registerForm(),
      ),
    );
  }

  Form loginForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextInput(
            controller: emailCtr,
            hintText: lang(context, 'email'),
            // keyboardType: TextInputType.number,
            leading: const Icon(
              Icons.person,
              color: Colors.grey,
            ),
            trailing: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.clear,
              ),
            ),
          ),
          // TextFormField(
          //   controller: emailCtr,
          //   validator: (value) {
          //     return (value == null || value.isEmpty)
          //         ? 'Please Enter Email'
          //         : null;
          //   },
          //   decoration: inputDecoration('E-mail', Icons.person),
          // ),
          const SizedBox(
            height: 8,
          ),
          AppTextInput(
            hintText: lang(context, 'password'),
            // keyboardType: TextInputType.number,
            controller: passwordCtr,
            obscureText: true,
            leading: const Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            trailing: GestureDetector(
              onTap: () {},
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined)),
            ),
          ),

          // TextFormField(
          //   validator: (value) {
          //     return (value == null || value.isEmpty)
          //         ? 'Please Enter Password'
          //         : null;
          //   },
          //   controller: passwordCtr,
          //   decoration: inputDecoration('Password', Icons.lock),
          // ),
          // ElevatedButton(
          //   onPressed: () async {
          //     if (formKey.currentState?.validate() ?? false) {
          //       await _viewModel.loginUser(emailCtr.text, passwordCtr.text);
          //     }
          //   },
          //   child: const Text('Login'),
          // ),
          const SizedBox(
            height: 16,
          ),
          AppButton(
            lang(context, 'login_btn'),
            onPressed: () async {
              if (formKey.currentState?.validate() ?? false) {
                await _viewModel.loginUser(emailCtr.text, passwordCtr.text);
              }
            },
            mainAxisSize: MainAxisSize.max,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                lang(context, 'reset_password'),
                onPressed: () {},
                mainAxisSize: MainAxisSize.max,
                type: ButtonType.text,
              ),
              AppButton(
                lang(context, 'register'),
                onPressed: () {
                  setState(() {
                    _formType = FormType.register;
                  });
                },
                mainAxisSize: MainAxisSize.max,
                type: ButtonType.text,
              ),
            ],
          ),
          Container(
            color: Colors.amber[50],
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              Row(
                children: const [
                  SizedBox(
                    width: 80,
                    child: Text("User :"),
                  ),
                  Text(
                    "eve.holt@reqres.in",
                  )
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 80,
                    child: Text("Passwd :"),
                  ),
                  Text("cityslicka")
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Form registerForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: emailCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Email'
                : null;
          },
          decoration: inputDecoration('E-mail', Icons.person),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Password'
                : null;
          },
          controller: passwordCtr,
          decoration: inputDecoration('Password', Icons.lock),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty || value != passwordCtr.text)
                ? 'Passwords does not match'
                : null;
          },
          decoration: inputDecoration('Retype Password', Icons.lock),
        ),
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState?.validate() ?? false) {
              await _viewModel.registerUser(emailCtr.text, passwordCtr.text);
            }
          },
          child: const Text('Register'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _formType = FormType.login;
            });
          },
          child: const Text('Login'),
        )
      ]),
    );
  }
}

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.grey),
    fillColor: Colors.grey.shade200,
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 20,
    ),
    prefixIconConstraints: const BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
  );
}

enum FormType { login, register }
