import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('A random big idea:'),
      ),
    );
  }
}
