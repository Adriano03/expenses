import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime? selectDate;
  final Function(DateTime)? onDateChange;

  const AdaptativeDatePicker({
    this.selectDate,
    this.onDateChange,
    Key? key,
  }) : super(key: key);

  //Função abrir modal para selecionar a data!
  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
      locale: const Locale('pt', 'BR'),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      onDateChange!(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
          height: 180,
          child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2022),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChange!,
            ),
        )
        : Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    //A data é sempre selecionada pelo Datetime.now(), então essa verificação não vai ser null!
                    selectDate == null
                        ? 'Nenhuma Data Selecionada!'
                        : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectDate!)}',
                  ),
                ),
                TextButton(
                  onPressed: () => _showDatePicker(context),
                  child: Text(
                    'Selecionar Data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
