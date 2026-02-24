import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreationPage extends StatelessWidget {
  const CreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreationView();
  }
}

class CreationView extends StatelessWidget {
  const CreationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'CREATION',
          style: GoogleFonts.playfairDisplaySc(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Canvas Area',
                  style: GoogleFonts.playfairDisplaySc(
                    color: Colors.black26,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black12)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.brush, color: Colors.black),
                Icon(Icons.format_color_fill, color: Colors.black),
                Icon(Icons.text_fields, color: Colors.black),
                Icon(Icons.layers, color: Colors.black),
                Icon(Icons.undo, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
