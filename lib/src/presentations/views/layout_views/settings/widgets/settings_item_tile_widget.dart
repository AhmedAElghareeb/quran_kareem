import 'package:flutter/material.dart';

class SettingsItemTileWidget extends StatelessWidget {
  const SettingsItemTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.settings),
      title: const Text('Settings Item'),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {},
    );
  }
}
