import 'package:flutter/material.dart';
import 'package:onebox_teste/app/presenter/controllers/login_controller.dart';
import 'package:onebox_teste/app/presenter/widgets/error_dialog.dart';
import 'package:onebox_teste/app/presenter/widgets/text_field_login.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final LoginController loginController = LoginController();

  @override
  void initState() {
    super.initState();
    loginController.userLogged(loginController, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                    opacity: 0.4,
                    child: Image.asset('assets/images/background_login.png')),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        FractionallySizedBox(
                          widthFactor: 0.5,
                          child: Image.asset('assets/images/logo_onebox.png'),
                        ),
                        const SizedBox(height: 35),
                        FractionallySizedBox(
                          widthFactor: 0.85,
                          child: text_field_login(
                            controller: emailController,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'gabriel@onebox.com',
                            titulo: 'E-mail',
                          ),
                        ),
                        const SizedBox(height: 20),
                        FractionallySizedBox(
                          widthFactor: 0.85,
                          child: text_field_login(
                            controller: passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            hintText: '**********',
                            titulo: 'Senha',
                          ),
                        ),
                        const SizedBox(height: 20),
                        FractionallySizedBox(
                          widthFactor: 0.35,
                          child: ElevatedButton(
                            onPressed: () async {
                              String? validationError =
                                  await loginController.validateLogin(
                                emailController.text,
                                passwordController.text,
                              );
                  
                              if (validationError != null) {
                                // ignore: use_build_context_synchronously
                                errorDialog.show(context, validationError);
                                return;
                              }
                  
                              loginController.user = User(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                  
                              await loginController.saveUser();
                              // ignore: use_build_context_synchronously
                              Navigator.popAndPushNamed(context, '/home');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF28E1C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Vamos lá!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
