import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    required this.title,
    this.isPassword = false,
     this.visible = false,
     this.onVisibilityToggle,  this.keyboardType = TextInputType.text,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String title;
  final bool isPassword;
  final bool visible;
  final VoidCallback? onVisibilityToggle;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPassword ? visible : false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 2.w,
              ),
              borderRadius: BorderRadius.circular(24.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3.w,
              ),
              borderRadius: BorderRadius.circular(24.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(24.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(24.r),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      visible ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: onVisibilityToggle,
                  )
                : null,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
