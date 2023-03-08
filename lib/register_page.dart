import 'package:flutter/material.dart';
import 'package:flutter_example/login_page.dart';
import 'package:lottie/lottie.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key});

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  bool isVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: myPrimaryColor,
        title: const Text(
          "Hesap oluştur",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: LottieBuilder.asset("assets/lottie/lottie_login.json")),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value.toString());
                        return !emailValid ? "Geçerli bir email giriniz" : null;
                      },
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email giriniz",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        prefixIcon:
                            const Icon(Icons.email, color: myPrimaryColor),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: myPrimaryColor,
                              width: 2,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      obscureText: !isVisibility,
                      obscuringCharacter: "*",
                      validator: (value) {
                        if (_passwordController2.text == value) {
                          return null;
                        }
                        return "Lütfen aynı şifreyi girin";
                      },
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: "Şifrenizi giriniz",
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: myPrimaryColor,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: myPrimaryColor,
                                width: 2,
                              )),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isVisibility = !isVisibility;
                                });
                              },
                              child: Icon(
                                isVisibility == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: myPrimaryColor,
                              ))),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      obscureText: !isVisibility,
                      obscuringCharacter: "*",
                      validator: (value) {
                        if (_passwordController.text == value) {
                          return null;
                        }
                        return "Lütfen aynı şifreyi girin";
                      },
                      controller: _passwordController2,
                      decoration: InputDecoration(
                          hintText: "Şifrenizi tekrar giriniz",
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: myPrimaryColor,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: myPrimaryColor,
                                width: 2,
                              )),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isVisibility = !isVisibility;
                                });
                              },
                              child: Icon(
                                isVisibility == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: myPrimaryColor,
                              ))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 45,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: myPrimaryColor,
                              shape: const StadiumBorder()),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        "Lütfen alanlarınızı kontrol edin!",
                                        style: TextStyle(color: Colors.white),
                                      )));
                              return;
                            }

                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    backgroundColor: myPrimaryColor,
                                    content: Text(
                                      "Tebrikler hesabınız başarı ile oluşturuldu",
                                      style: TextStyle(color: Colors.white),
                                    )));
                          },
                          child: const Text(
                            "Kayıt yap",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Zaten bir hesabın var mı? Giriş yap",
                          style: TextStyle(color: myPrimaryColor),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const Color myPrimaryColor = Colors.teal;
