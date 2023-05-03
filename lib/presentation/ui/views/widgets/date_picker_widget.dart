import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../locator.dart';
import '../../view_model/search_view_model.dart';

//Widget used to pick desired date for forecast
class LimitedDatePicker extends StatefulWidget {
  final double height;
  const LimitedDatePicker({super.key, required this.height});

  @override
  State<LimitedDatePicker> createState() => _LimitedDatePickerState();
}

class _LimitedDatePickerState extends State<LimitedDatePicker> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 14)),
    );
    if (picked != null && picked != _selectedDate) {
      locator.get<SearchViewModel>().setTargetDate(formatDate(picked));
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'Date: ${formatDate(_selectedDate)}',
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              _selectDate(context);
            },
            icon: const Icon(Icons.calendar_today),
          ),
        ],
      ),
    );
  }
}

String formatDate(DateTime date) {
  final formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(date);
}
