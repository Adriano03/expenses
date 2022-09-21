import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final formataMoeda = NumberFormat.currency(locale: 'pt-BR', symbol: 'R\$');
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Text(
                    'Nenhuma Transação Cadastrada!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: constraints.maxHeight * 0.59,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                formataMoeda: formataMoeda,
                //Exemeplo cores background
                // key: GlobalObjectKey(tr),
                tr: tr,
                onRemove: onRemove,
              );
            },
          );
      //Forma alternativa de alinhar as cores background do preço
      // ListView(
      //     children: transactions.map((tr) {
      //       return TransactionItem(
      //         key: ValueKey(tr.id),
      //         formataMoeda: formataMoeda,
      //         tr: tr,
      //         onRemove: onRemove,
      //       );
      //     }).toList(),
      //   );
    }
}
