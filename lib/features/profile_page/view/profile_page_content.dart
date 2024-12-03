import 'package:flutter/material.dart';

class ProfilePageContent extends StatefulWidget {
  const ProfilePageContent({super.key});

  @override
  State<ProfilePageContent> createState() => _ProfilePageContentState();
}

class _ProfilePageContentState extends State<ProfilePageContent> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose(); // Освобождаем ресурсы контроллера
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Изображение
            Image.asset(
              'assets/chef.png', // Укажите путь к картинке assets/chef.png
              height: 200,
              width: 250,
            ),
            const SizedBox(height: 30),

            // Текст
            const Text(
              'Укажите номер телефона',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),

            // Поле ввода
            SizedBox(
              width: 250, // Устанавливаем ширину
              child: TextField(
                controller: _phoneController,
                onTap: () {
                  if (_phoneController.text == 'Введите номер') {
                    _phoneController.clear(); // Убираем текст при нажатии
                  }
                },
                decoration: InputDecoration(
                  prefixText: '+7',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  hintText: 'Введите номер', // Текст по умолчанию
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(height: 20),

            // Кнопка
            SizedBox(
            width: 320, // Устанавливаем фиксированную ширину кнопки
            child:
              ElevatedButton(
                onPressed: () {
                  print("Введённый номер: ${_phoneController.text}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 121, 49), // Цвет кнопки
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Продолжить',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





// ProfilePage.dart
//obscureText: true, // сокрытие текста как будто используем
/*class ProfilePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /*Text("User Name", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Text("user@example.com", style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(height: 16),*/

          /*TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Введите номер телефона',
          ),*/
        ],
      ),
    );
      /*child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/avatar.png')),
          SizedBox(height: 16),
          Text("User Name", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text("user@example.com", style: TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),*/
  }
}*/