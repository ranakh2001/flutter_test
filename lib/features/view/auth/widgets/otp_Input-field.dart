import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test1/features/providers/auth_provider.dart';

class OtpInputField extends ConsumerStatefulWidget {
  final int index;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  const OtpInputField({
    super.key,
    required this.index,
    required this.focusNode,
    this.nextFocusNode,
  });

  @override
  ConsumerState<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends ConsumerState<OtpInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final otp = ref.read(otpProvider).otpValues[widget.index];
    _controller = TextEditingController(text: otp);
  }

  @override
  void didUpdateWidget(covariant OtpInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    final otp = ref.read(otpProvider).otpValues[widget.index];
    if (_controller.text != otp) {
      _controller.text = otp;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    if (value.length > 1) {
      value = value[0];
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: 1),
      );
    }

    ref.read(otpProvider.notifier).setOtpAt(widget.index, value);

    if (value.isNotEmpty && widget.nextFocusNode != null) {
      widget.nextFocusNode!.requestFocus();
    }
    if (value.isEmpty && widget.index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      child: TextField(
        controller: _controller,
        focusNode: widget.focusNode,
        keyboardType: TextInputType.number,
        textInputAction: widget.nextFocusNode != null
            ? TextInputAction.next
            : TextInputAction.done,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(color: Theme.of(context).primaryColor),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
        ),
        onChanged: _onChanged,
      ),
    );
  }
}
