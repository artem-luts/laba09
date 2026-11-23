
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Реєстрацію успішно виконано!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Реєстрація'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Form(
          key: _formKey,

          child: Column(
            children: [
              Image.asset(
                'assets/images/image.png',
                height: 130,
                width: 130,
              ),

              const SizedBox(height: 20),

              const Text(
                'Створення акаунту',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // Ім'я користувача
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Ім’я користувача',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Введіть ім’я користувача';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Логін
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Логін',
                  prefixIcon: Icon(Icons.account_circle),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Введіть логін';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Пароль
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
                onPressed: _register,
                child: const Text('Зареєструватися'),
              ),

              const SizedBox(height: 15),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Повернутися до авторизації',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
