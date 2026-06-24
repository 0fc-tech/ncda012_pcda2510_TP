import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: LoginForm()
    );
  }
}


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _tecEmail = TextEditingController(text: "");
  final _tecPwd = TextEditingController(text: "");
  bool _rememberMe = false;
  final _keyFormContact = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyFormContact,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Connexion à Twitter"),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Identifiant",
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _tecEmail,
              validator: (value) {
                if (value == null || value.isEmpty == true) {
                  return "Renseignez votre e-mail";
                } else if (value.contains("@")) {
                  return null;
                }
                return "E-mail incorrect";
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Mot de passe",
              ),
              controller: _tecPwd,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty == true) {
                  return "Renseignez votre mot passe";
                }
                return null;
              },
            ),
            SwitchListTile(
              value: _rememberMe,
              onChanged: (newValue) {
                setState(() {
                  _rememberMe = newValue;
                });
              },
              title: Text("Mémoriser mes informations"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FilledButton(
                onPressed: () {
                  if(_keyFormContact.currentState?.validate() == true){
                    context.go('/');
                  }
                },
                child: Text("Connexion"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}