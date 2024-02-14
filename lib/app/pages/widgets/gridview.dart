import 'package:flutter/material.dart';

class GridItemView extends StatefulWidget {
  const GridItemView({super.key});

  @override
  State<GridItemView> createState() => _GridItemViewState();
}

class _GridItemViewState extends State<GridItemView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              );
            }),
      ),
    );
  }
}
