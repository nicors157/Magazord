// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_vaga/configs/assets/assets_path.dart';

class CsCardProduto extends StatelessWidget {
  CsCardProduto(
      {super.key,
      this.descricao,
      this.preco,
      this.urlImagem,
      this.onDeleteProduto,
      this.visualizarProduto});
  String? descricao;
  String? preco;
  String? urlImagem;
  void Function()? onDeleteProduto;
  void Function()? visualizarProduto;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                        color: theme.colorScheme.tertiary,
                        width: 3,
                        style: BorderStyle.solid),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Observer(builder: (context) {
                      if (urlImagem != null && urlImagem != '') {
                        return Image.network(
                          urlImagem!,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (_, __, ___) {
                            return Image.asset(
                              AssetsPath.NO_IMAGE,
                              width: 50,
                              height: 50,
                              color: theme.colorScheme.tertiary,
                            );
                          },
                          width: 50,
                          height: 50,
                        );
                      }
                      return Image.asset(
                        AssetsPath.NO_IMAGE,
                        width: 50,
                        height: 50,
                        color: theme.colorScheme.tertiary,
                      );
                    }),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      descricao!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: theme.colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'R\$ $preco',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: theme.colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: visualizarProduto,
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: theme.colorScheme.tertiary,
                    )),
                IconButton(
                    onPressed: onDeleteProduto,
                    icon: Icon(
                      Icons.delete,
                      color: theme.colorScheme.tertiary,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
