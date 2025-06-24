import 'package:flutter/material.dart';
import 'package:flutter_test1/features/core/theme/color/color_manager.dart';
import 'package:flutter_test1/features/view/widgets/back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorManager.instance.transparent,
      leading: ArrowBackButton(),
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }

  // هذا الجزء مطلوب من PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
