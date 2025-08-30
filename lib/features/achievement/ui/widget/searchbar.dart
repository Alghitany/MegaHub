import 'package:flutter/material.dart';

class SearchBarAndIcons extends StatelessWidget {
  const SearchBarAndIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Hinted search text",
        suffixIcon: const Icon(Icons.search),
        prefixIcon: const Icon(Icons.menu),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}