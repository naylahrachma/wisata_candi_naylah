import 'package:wisata_candi/data/candi_data.dart';
import 'package:flutter/material.dart';

import '../models/candi.dart';
import '../widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO; 1 Buat appbar judul wisata candi
      appBar: AppBar(title: Text('Wisata Candi'),),
      // TODO; 2 Buat body dgn GridView.Builder
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          padding: EdgeInsets.all(8.0),
          itemCount: candiList.length,
          itemBuilder: (context, index) {
            Candi candi = candiList[index];
            return ItemCard(candi: candi);
          }),
      // TODO: 3 Buat ItemCard sebagai return dari GirdView.builder
    );
  }
}