import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/search_view_model.dart';

//Address Header used in Search page
class AddressHeader extends StatelessWidget {
  final double height;
  final double width;
  const AddressHeader({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Address: ',
          ),
          Consumer<SearchViewModel>(
            builder: (context, viewModel, child) {
              return Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(viewModel.targetAddress != null
                          ? '${viewModel.targetAddress!.name} ${viewModel.targetAddress!.city}, ${viewModel.targetAddress!.country}'
                          : ''),
                    ],
                  ),
                ),
              );
            },
          ),
          const Tooltip(
            message:
                'To get accurate weather information, please start typing your location in the field below. We\'ll provide suggestions as you type \nbe sure to select one of these options to ensure we provide accurate weather data for your location.',
            child: Icon(Icons.info_outline),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
