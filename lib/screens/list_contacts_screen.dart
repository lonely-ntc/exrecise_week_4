import 'package:flutter/material.dart';
import '../models/contact.dart';

class ListContactsScreen extends StatelessWidget {
  const ListContactsScreen({super.key});

  final List<Contact> contacts = const [
    Contact(name: "Nguyễn Thế Chương", phone: "0902-456-222"),
    Contact(name: "Nguyễn Văn An", phone: "0901-123-111"),
    Contact(name: "Lê Hoàng Chi", phone: "0903-789-333"),
    Contact(name: "Phạm Minh Dũng", phone: "0904-147-444"),
    Contact(name: "Võ Ngọc Hương", phone: "0905-258-555"),

    Contact(name: "Đặng Tuấn Kiệt", phone: "0906-369-666"),
    Contact(name: "Bùi Đức Long", phone: "0907-741-777"),
    Contact(name: "Huỳnh Thảo My", phone: "0908-852-888"),
    Contact(name: "Phan Nhật Nam", phone: "0909-963-999"),
    Contact(name: "Mai Quỳnh Anh", phone: "0910-111-234"),

    Contact(name: "Ngô Văn Phúc", phone: "0911-222-345"),
    Contact(name: "Hồ Thanh Tâm", phone: "0912-333-456"),
    Contact(name: "Tạ Hải Yến", phone: "0913-444-567"),
    Contact(name: "Trịnh Quốc Khánh", phone: "0914-555-678"),
    Contact(name: "Hoàng Gia Bảo", phone: "0915-666-789"),

    Contact(name: "Đỗ Như Ý", phone: "0916-777-890"),
    Contact(name: "Lý Thu Hà", phone: "0917-888-901"),
    Contact(name: "Châu Minh Trí", phone: "0918-999-012"),
    Contact(name: "Vũ Lan Chi", phone: "0919-234-567"),
    Contact(name: "Kiều Thanh Huyền", phone: "0920-345-678"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contacts List")),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (_, index) {
          final contact = contacts[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(contact.name),
            subtitle: Text(contact.phone),
          );
        },
      ),
    );
  }
}
