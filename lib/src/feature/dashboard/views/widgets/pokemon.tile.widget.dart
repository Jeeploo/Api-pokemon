import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PokemonTile extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const PokemonTile({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), border: Border.all()),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name),
            ),
          ),
        ),
      ),
    );
  }
}
