import 'package:diagrams/bloc/theme/color_scheme_extension.dart';
import 'package:diagrams/i18n/strings.g.dart';
import 'package:diagrams/side_menu/shapes_tiles/expansion_tile_widget.dart';
import 'package:flutter/material.dart';

class ExpansionTileList extends StatelessWidget {
  const ExpansionTileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          listTileTheme: ListTileThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: ExpansionTile(
          title: Text(t.sideMenu.basic,
              style: Theme.of(context).textTheme.bodyText1),
          iconColor: Theme.of(context).colorScheme.appBorder,
          initiallyExpanded: true,
          controlAffinity: ListTileControlAffinity.platform,
          children: const [ExpansionTileWidget()],
        ),
      ),
    );
  }
}
