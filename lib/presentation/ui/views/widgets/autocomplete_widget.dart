import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../view_model/search_view_model.dart';
import '../../../../locator.dart';
import '../../../../domain/entites/address_entity.dart';
// Autocomplete widget used the help user find the desired location

class AutoCompleteWidget extends StatefulWidget {
  final double height;
  final double width;
  const AutoCompleteWidget(
      {super.key, required this.height, required this.width});

  @override
  State<AutoCompleteWidget> createState() => _AutoCompleteWidgetState();
}

class _AutoCompleteWidgetState extends State<AutoCompleteWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  Future<List<AddressEntity>> _getSuggestions(String text) async {
    if (text.isNotEmpty) {
      await locator.get<SearchViewModel>().getAutoCompletion(text);
    }
    return locator.get<SearchViewModel>().suggestionList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Autocomplete<AddressEntity>(
        displayStringForOption: (e) => e.zipCode != null
            ? '${e.name} ${e.city} ${e.zipCode}, ${e.country}'
            : '${e.name} ${e.city}, ${e.country}',
        optionsBuilder: (TextEditingValue textEditingValue) async {
          if (textEditingValue.text == '') {
            return const Iterable<AddressEntity>.empty();
          }
          var kOptions = await _getSuggestions(textEditingValue.text);
          return kOptions;
        },
        optionsViewBuilder: (context, onSelected, options) {
          return Container(
            padding: EdgeInsets.only(
                right: 40.0, bottom: MediaQuery.of(context).size.height * 0.5),
            child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: SizedBox(
                  height: widget.height,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...options
                          .map((e) => GestureDetector(
                                onTap: () {
                                  onSelected(e);

                                  options = [];
                                  SystemChannels.textInput
                                      .invokeMethod('TextInput.hide');
                                },
                                child: Container(
                                  height: widget.height,
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 10),
                                  width: double.infinity,
                                  child: Text(
                                    e.zipCode != null
                                        ? '${e.name} ${e.city} ${e.zipCode}, ${e.country}'
                                        : '${e.name} ${e.city} , ${e.country}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                              ))
                          .toList()
                    ],
                  ),
                )),
          );
        },
        onSelected: (option) {
          locator.get<SearchViewModel>().setTargetAddress(option);
        },
      ),
    );
  }
}
