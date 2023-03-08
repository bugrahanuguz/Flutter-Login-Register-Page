import 'package:flutter/material.dart';
import 'package:flutter_example/main.dart';
import 'package:flutter_example/register_page.dart';
import 'package:lottie/lottie.dart';

import 'home_page.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String email = "email@email.com";
  String password = "123";
  bool isVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Giriş Yap",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: myPrimaryColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset("assets/lottie/lottie_login.json"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value.toString());
                          return !emailValid
                              ? "Geçerli Email adresi giriniz"
                              : null;
                        },
                        controller: _emailController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                              color: myPrimaryColor,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            hintText: "Email Giriniz",
                            hintStyle: const TextStyle(color: myPrimaryColor)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (password == value) {
                              return null;
                            }
                            return "Lütfen şifreyi gir";
                          },
                          controller: _passwordController,
                          obscureText: isVisibility,
                          obscuringCharacter: "@",
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: myPrimaryColor,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isVisibility = !isVisibility;
                                  });
                                },
                                child: Icon(
                                  isVisibility == false
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: myPrimaryColor,
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            hintText: "Şifre Giriniz",
                            hintStyle: const TextStyle(color: myPrimaryColor),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                        ),
                        child: SizedBox(
                          width: 200,
                          height: 45,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: myPrimaryColor,
                                  shape: const StadiumBorder()),
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          content: Text(
                                    "Lütfen doğru girdiğinizden emin olun.",
                                    style: TextStyle(color: Colors.white),
                                  )));
                                  return;
                                }
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomepage()));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                  "Tebrikler giriş yapıldı.",
                                  style: TextStyle(color: Colors.white),
                                )));
                              },
                              child: const Text(
                                "Giriş Yap",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                        ),
                      )
                    ],
                  ),
                )),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyRegisterPage()));
              },
              child: Text("Hesabın yok mu? Kayıt ol",
                  style: TextStyle(color: myPrimaryColor)),
            )
          ],
        ),
      ),
    );
  }
}

const Color myPrimaryColor = Color.fromARGB(255, 100, 166, 134);
