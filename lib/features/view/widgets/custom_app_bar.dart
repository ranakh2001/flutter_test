import 'package:doos_doos/features/core/theme/color/color_manager.dart';
import 'package:doos_doos/features/view/widgets/back_button.dart';
import 'package:doos_doos/utils/constants/constants.dart';
import 'package:flutter/material.dart';

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
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.w700,
          fontFamily: Constants.cormorantFont,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
