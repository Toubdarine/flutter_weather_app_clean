import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../locator.dart';
import '../../view_model/search_view_model.dart';

//Search button used to get future forecast
class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.height,
    required this.color,
  });

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchViewModel>(builder: (context, viewModel, child) {
      return Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: (locator.get<SearchViewModel>().targetDate != null &&
                    locator.get<SearchViewModel>().targetAddress != null)
                ? color
                : Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: TextButton(
          onPressed: () {
            locator.get<SearchViewModel>().targetAddress == null
                ? ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Please choose one of the suggested addresses'),
                    ),
                  )
                : viewModel.getForecast(viewModel.targetAddress!.latitude,
                    viewModel.targetAddress!.longitude, viewModel.targetDate!);
          },
          child: Text('Search', style: TextStyle(fontSize: height * 0.4)),
        )),
      );
    });
  }
}
