import 'package:flutter/material.dart';
import '../models/drinks.dart';

class FormPage extends StatefulWidget {
  final Drink? drink;

  const FormPage({super.key, this.drink});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController sugarController = TextEditingController();
  final TextEditingController emojiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.drink != null) {
      nameController.text = widget.drink!.name;
      priceController.text = widget.drink!.price.toString();
      sugarController.text = widget.drink!.sugarLevel;
      emojiController.text = widget.drink!.emoji;
    }
  }

  void saveData() {
    if (_formKey.currentState!.validate()) {
      final drink = Drink(
        name: nameController.text,
        price: int.parse(priceController.text),
        sugarLevel: sugarController.text,
        emoji: emojiController.text,
      );

      Navigator.pop(context, drink);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.drink != null;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 244, 241),
      appBar: AppBar(
        title: Text(isEdit ? "Edit Minuman" : "Tambah Minuman"),
        backgroundColor: const Color.fromARGB(255, 15, 118, 110),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Nama Minuman"),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Harga"),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: sugarController,
                decoration: const InputDecoration(labelText: "Level Manis"),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: emojiController,
                decoration: const InputDecoration(labelText: "Icon Menu"),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: saveData,
                child: Text(isEdit ? "Update" : "Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
