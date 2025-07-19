import 'package:app_cripto/app/domain/models/coin/coin_model.dart';
import 'package:flutter/material.dart';

class AppDialogCoinSelector<T extends CoinModel> {
  final List<T> values;
  final void Function(T value)? onSelected;

  AppDialogCoinSelector({required this.values, this.onSelected});

  ValueNotifier<String?> searchQuery = ValueNotifier<String?>(null);

  Future<T?> show(BuildContext context) async {
    return await showDialog<T>(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text('Selecione uma moeda!'),
          content: SizedBox(
            height: 400, // Define uma altura fixa para o conteúdo
            width: double
                .maxFinite, // Permite que o ListView ocupe toda a largura disponível
            child: IntrinsicHeight(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Pesquisar: nome moeda',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      searchQuery.value = value.isEmpty ? null : value;
                    },
                  ),
                  ListenableBuilder(
                    listenable: searchQuery,
                    builder: (context, _) {
                      List<T> filteredValues = searchQuery.value == null
                          ? values
                          : values.where((coin) {
                              return coin.name.toLowerCase().startsWith(
                                searchQuery.value!.toLowerCase(),
                              );
                            }).toList();

                      if (searchQuery.value != null) {
                        filteredValues.sort((a, b) {
                          if (a.name.toLowerCase() ==
                              searchQuery.value!.toLowerCase()) {
                            return -1;
                          } else if (b.name.toLowerCase() ==
                              searchQuery.value!.toLowerCase()) {
                            return 1;
                          }
                          return 0;
                        });
                      }

                      return Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(filteredValues[index].name),
                              onTap: () {
                                onSelected?.call(filteredValues[index]);
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(height: 3);
                          },
                          itemCount: filteredValues.length,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
