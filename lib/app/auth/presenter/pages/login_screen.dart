import 'package:flutter/material.dart';
import 'package:onebox_teste/app/auth/presenter/widgets/text_field_login.dart';

class login_screen extends StatelessWidget {
  
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                            width: 25,
                            child: Image.asset(
                                'assets/images/icone_tema_claro.png')),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.5,
                        child: Image.asset('assets/images/logo_onebox.png'),
                      ),
                      const SizedBox(height: 35),
                      // TextField(
                      //   onChanged: (value) =>
                      //       loginController.setUsername(value),
                      //   decoration: InputDecoration(labelText: 'Username'),
                      // ),
                      const SizedBox(height: 20),
                      // FractionallySizedBox(
                      //   widthFactor: 0.85,
                      //   child: text_field_login(
                      //     controller: passwordController,
                      //     obscureText: true,
                      //     keyboardType: TextInputType.visiblePassword,
                      //     hintText: '**********',
                      //     titulo: 'Senha',
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                      FractionallySizedBox(
                        widthFactor: 0.35,
                        child: ElevatedButton(
                          onPressed: () {},
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
                                fontWeight: FontWeight.w500,
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
            ],
          ),
        ),
      ),
    );
  }
}
