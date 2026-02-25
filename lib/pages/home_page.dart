import 'dart:ui';

import 'package:flutter/material.dart';
import '../models/drinks.dart';
import '../pages/form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Drink> drinkList = [
    Drink(name: "Teh Manis", price: 10000, sugarLevel: "Normal", emoji: "🍵"),
    Drink(name: "Creamy Berry", price: 12000, sugarLevel: "Extra", emoji: "🍓"),
    Drink(name: "Kopi Avocado", price: 16000, sugarLevel: "Less", emoji: "🥑"),
    Drink(
      name: "Lemon Green Tea",
      price: 12000,
      sugarLevel: "Normal",
      emoji: "🍋",
    ),
  ];

  void addDrink(Drink drink) {
    setState(() {
      drinkList.add(drink);
    });
  }

  void updateDrink(int index, Drink drink) {
    setState(() {
      drinkList[index] = drink;
    });
  }

  void deleteDrink(int index) {
    setState(() {
      drinkList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 118, 110),
        centerTitle: true,
        title: const Text(
          "Selalu Teh",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () async {
          final newDrink = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormPage()),
          );

          if (newDrink != null) {
            addDrink(newDrink);
          }
        },
      ),

      body: drinkList.isEmpty
          ? const Center(child: Text("Belum ada menu minuman"))
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),

              itemCount: drinkList.length,
              itemBuilder: (context, index) {
                final drink = drinkList[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),

                      Text(drink.emoji, style: const TextStyle(fontSize: 60)),

                      const SizedBox(height: 12),

                      Text(
                        drink.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Rp${drink.price}",
                        style: const TextStyle(fontSize: 14),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        "Manis: ${drink.sugarLevel}",
                        style: const TextStyle(fontSize: 13),
                      ),

                      const Spacer(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () async {
                              final updatedDrink = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FormPage(drink: drink),
                                ),
                              );

                              if (updatedDrink != null) {
                                updateDrink(index, updatedDrink);
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              deleteDrink(index);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
