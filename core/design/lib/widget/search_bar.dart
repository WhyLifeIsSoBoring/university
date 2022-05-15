import 'package:design/design.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final void Function(String? newText) onChanged;
  final void Function() onClear;
  final TextEditingController textController;

  const SearchBar({
    required this.onChanged,
    required this.onClear,
    required this.textController,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColorTheme.lightGrey,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: widget.textController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Поиск',
              ),
              cursorColor: AppColorTheme.middleGrey,
              cursorWidth: 1.0,
              onChanged: widget.onChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: widget.textController.text.isNotEmpty
                ? GestureDetector(
                    onTap: widget.onClear,
                    child: Icon(
                      Icons.close,
                      size: 25.0,
                    ),
                  )
                : Icon(
                    Icons.search,
                    size: 25.0,
                  ),
          ),
        ],
      ),
    );
  }
}
