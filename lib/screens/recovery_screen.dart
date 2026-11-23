
import 'package:flutter/material.dart';

class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({super.key});

  @override
  State<RecoveryScreen> createState() =>
      _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  final _formKey = GlobalKey<FormState>();

  void _recoverPassword() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Запит на відновлення пароля прийнято!',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Відновлення пароля'),
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
                  'Забули пароль?',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Введіть свою електронну пошту, '
                      'щоб розпочати процедуру відновлення пароля.',
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                // Поле електронної пошти
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Електронна пошта',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введіть електронну пошту';
                    }

                    final emailRegex = RegExp(
                      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                    );

                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Введіть правильну електронну пошту';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 25),

                ElevatedButton(
                  onPressed: _recoverPassword,
                  child: const Text('Відновити пароль'),
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
      ),
    );
  }
}
