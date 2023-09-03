// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;
  final VoidCallback onFieldSubmitted;

  const SearchAppBar({Key? key,required this.onPressed,required this.onFieldSubmitted,required this.controller}) : super(key: key);
//
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(36.0),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 19,
            bottom: 10,
          ),
          child: SizedBox(
            width: 343,
            height: 36,
            child: TextFormField(
                controller: controller,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color:Colors.grey,
                      ),
                      onPressed: () {
                        onPressed;
                      }
                  ),
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                    color:Colors.grey,
                  ),
                  /*hintText: ,*/
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                onFieldSubmitted: (anySearch)async{
                  onFieldSubmitted;
                }
            ),
          ),
        ),
      ),
    );
  }
}