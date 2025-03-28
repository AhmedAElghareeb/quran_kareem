import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/settings/cubit/settings_cubit.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/settings/widgets/settings_header_widget.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/settings/widgets/settings_item_tile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            final cubit = SettingsCubit.get(context);
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SettingsHeaderWidget(),
                  SettingsItemTileWidget(),
                  SettingsItemTileWidget(),
                  SettingsItemTileWidget(),
                  SettingsItemTileWidget(),
                  SettingsItemTileWidget(),
                  SettingsItemTileWidget(),
                  SettingsItemTileWidget(),
                  SettingsItemTileWidget(),
                  SettingsItemTileWidget(),
                  SettingsItemTileWidget(),
                  SettingsItemTileWidget(),
                  SettingsItemTileWidget(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
