import 'package:flutter/material.dart';
import '../../../config/theme/app_theme.dart';

class DeviceSearchBar extends StatefulWidget {
  final Function(String) onChanged;

  const DeviceSearchBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<DeviceSearchBar> createState() => _DeviceSearchBarState();
}

class _DeviceSearchBarState extends State<DeviceSearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: 'Search AC Units...',
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: AppColors.statusOk,
      ),
    );
  }
}
