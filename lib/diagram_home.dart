import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/add_remove_element/add_remove_element_event.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/bloc/open/open_bloc.dart';
import 'package:diagrams/bloc/save/save_bloc.dart';
import 'package:diagrams/bloc/theme/color_scheme_extension.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_event.dart';
import 'package:diagrams/i18n/strings.g.dart';
import 'package:diagrams/main_canvas/main_canvas.dart';
import 'package:diagrams/side_menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiagramHome extends StatefulWidget {
  const DiagramHome({Key? key}) : super(key: key);

  @override
  _DiagramHomeState createState() => _DiagramHomeState();
}

class _DiagramHomeState extends State<DiagramHome> {
  void clearElementsAndArrows() {
    context.read<AddRemoveElementBloc>().add(const ClearAllElementEvent());
    context.read<DrawArrowsBloc>().add(const ClearAllArrowEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.appBackground,
      body: BlocListener<OpenBloc, OpenState>(
        listener: (context, state) {
          state.maybeWhen(
            saveCurrent: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(t.popup.saveBeforeOpenNew.title),
                    content: Text(t.popup.saveBeforeOpenNew.content),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          clearElementsAndArrows();
                          context.read<OpenBloc>().add(const OpenEvent.open());
                        },
                        child: Text(t.generic.no),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.read<SaveBloc>().add(const SaveEvent.save());
                          clearElementsAndArrows();
                        },
                        child: Text(t.generic.yes),
                      ),
                    ],
                  );
                },
                barrierDismissible: true,
                barrierColor: Colors.transparent,
              );
            },
            orElse: () => null,
          );
        },
        child: GestureDetector(
          key: const Key('unselect_flow_elements'),
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context
                .read<UnselectElementsBloc>()
                .add(UnselectElementsEvent(selected: false));
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SideMenu(),
              Expanded(
                child: RepaintBoundary(
                  child: Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: const MainCanvas(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
