
import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'recovery_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Форму успішно заповнено!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизація'),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Form(
            key: _formKey,

            child: Column(
              children: [
                Image.asset(
                  'assets/images/image.png',
                  height: 150,
                  width: 150,
                ),

                const SizedBox(height: 25),

                const Text(
                  'Вітаємо!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Увійдіть до свого облікового запису',
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                // Поле логіна
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Логін',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введіть логін';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Поле пароля
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введіть пароль';
                    }

                    if (value.length < 7) {
                      return 'Пароль повинен містити мінімум 7 символів';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 25),

                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Увійти'),
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const RecoveryScreen(),
                      ),
                    );
                  },
                  child: const Text('Забули пароль?'),
                ),

                const SizedBox(height: 10),

                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const RegistrationScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Створити обліковий запис',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
