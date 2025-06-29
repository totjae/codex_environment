import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(character.name),
        subtitle: Text(character.job),
        trailing: character.isBuffer
            ? Text('버프력: ${character.buffScore4 ?? character.buffScore}')
            : character.isDealer
                ? Text('딜량: ${character.ozma}')
                : const SizedBox.shrink(),
      ),
    );
  }
}
