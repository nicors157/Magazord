// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CsCardTarefa extends StatelessWidget {
  CsCardTarefa({
    super.key,
    required this.title,
    this.description,
    this.completed,
    required this.onChangeCompleted,
    this.onDelete,
  });
  String title;
  String? description;
  int? completed;
  void Function(bool?)? onChangeCompleted;
  void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: completed == 1 ? Colors.blue : Colors.red,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Utilizando o Expanded para permitir a expansão do texto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Titulo: $title',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  if (description != null)
                    Text(
                      'Descrição: $description',
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      maxLines: null,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
            ),
            Column(
              children: [
                Checkbox(
                  checkColor: theme.colorScheme.tertiary,
                  fillColor: MaterialStateProperty.all(Colors.white),
                  value: completed == 1,
                  onChanged: onChangeCompleted,
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
