import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? textColor;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.textColor,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: textColor ?? Colors.black,
              fontSize: showBackButton ? 28 : 32,
            ),
        overflow: TextOverflow.visible,
      ),
      leading: showBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_circle_left_outlined,
                color: textColor ?? Colors.black,
                size: 36,
              ),
              onPressed: () => Navigator.pop(context),
            )
          : const SizedBox(width: 0),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
