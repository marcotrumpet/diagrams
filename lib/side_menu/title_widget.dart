import 'package:diagrams/bloc/theme/color_scheme_extension.dart';
import 'package:diagrams/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.appAccent,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            t.diagrams,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
