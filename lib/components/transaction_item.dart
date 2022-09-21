import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final NumberFormat formataMoeda;
  final Transaction tr;
  final void Function(String p1) onRemove;

  const TransactionItem({
    Key? key,
    required this.formataMoeda,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

  //Exemplo de uso de chavez para background color preço!
  //   static const colors = [
  //   Colors.red,
  //   Colors.purple,
  //   Colors.orange,
  //   Colors.blue,
  //   Colors.yellow,
  // ];

  // Color ?_backgroundCollor;

  // @override
  // void initState() {
  //   super.initState();
  //   int i = Random().nextInt(5);
  //   _backgroundCollor = colors[i];
  // }

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                formataMoeda.format(tr.value),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d/MM/y').format(tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                onPressed: () {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title:
                                const Text('Tem certeza que deseja excluir ?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  onRemove(tr.id);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Excluir',
                                  style: TextStyle(
                                    color: Theme.of(context).errorColor,
                                  ),
                                ),
                              ),
                            ],
                          ));
                },
                icon: Icon(
                  Icons.delete_forever,
                  color: Theme.of(context).errorColor,
                ),
                label: Text(
                  'Excluir',
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                  ),
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete_forever),
                color: Theme.of(context).errorColor,
                onPressed: (() {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title:
                                const Text('Tem certeza que deseja excluir ?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  onRemove(tr.id);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Excluir',
                                  style: TextStyle(
                                    color: Theme.of(context).errorColor,
                                  ),
                                ),
                              ),
                            ],
                          ));
                }),
              ),
      ),
    );
  }
}
