import 'package:flutter/material.dart';

class ProfilePageContent extends StatefulWidget {
  const ProfilePageContent({super.key});

  @override
  State<ProfilePageContent> createState() => _ProfilePageContentState();
}

class _ProfilePageContentState extends State<ProfilePageContent> {
  final TextEditingController _phoneController = TextEditingController();
  bool isProfile = false; // Переменная состояния для переключения экрана

  @override
  void dispose() {
    _phoneController.dispose(); // Освобождаем ресурсы контроллера
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isProfile ? _buildProfileScreen() : _buildPhoneInputScreen(),
    );
  }

  // Экран ввода телефона
  Widget _buildPhoneInputScreen() {
    return Padding(
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
            child: ElevatedButton(
              onPressed: () {
                if (_phoneController.text.isNotEmpty) {
                  setState(() {
                    isProfile = true; // Переключаемся на экран профиля
                  });
                }
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
    );
  }

  // Экран профиля
  Widget _buildProfileScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          // Иконка профиля и данные
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Color.fromARGB(255, 255, 121, 49),
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Иванов Николай Григорьевич',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      //overflow: TextOverflow.ellipsis, // Обрезка текста с "..."
                      //maxLines: 1, // Ограничение на одну строку
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '+7${_phoneController.text}',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Адрес доставки: г. Абакан, ул. Пушкина 20',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // История заказов
          const Text(
            'История заказов',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Примерное количество заказов
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text('Заказ №${index + 1}'),
                    subtitle: const Text('Статус: Выполнено'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Логика открытия подробностей заказа
                    },
                  ),
                );
              },
            ),
          ),

          // Кнопки
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Логика для настроек
                },
                icon: const Icon(Icons.settings),
                label: const Text('Настройки', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 121, 49),
                  iconColor: Colors.white,
                  
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Логика для чата поддержки
                },
                icon: const Icon(Icons.chat),
                label: const Text('Поддержка', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 121, 49),
                  iconColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
