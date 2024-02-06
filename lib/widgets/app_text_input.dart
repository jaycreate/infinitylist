import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum AppTextInputType { normal, mobile }

class AppTextInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Widget? leading;
  final Widget? trailing;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? errorText;
  final int? maxLines;
  final bool? autofocus;
  final AppTextInputType type;

  const AppTextInput({
    Key? key,
    this.hintText,
    this.controller,
    this.focusNode,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.leading,
    this.trailing,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.errorText,
    this.maxLines = 1,
    this.autofocus = false,
    this.type = AppTextInputType.normal,
  }) : super(key: key);

  Widget _buildErrorLabel(BuildContext context) {
    if (errorText == null) {
      return Container();
    }
    if (leading != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                'Error',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              "Error",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).colorScheme.error),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget leadingWidget = const SizedBox(width: 16);
    if (leading != null) {
      leadingWidget = Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(width: 8),
          leading!,
          const SizedBox(width: 8),
        ],
      );
    }
    switch (type) {
      case AppTextInputType.normal:
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor.withOpacity(.02),
              // color: Colors.grey[100],
              border: Border.all(
                  color: Theme.of(context).dividerColor.withOpacity(.1)),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: leadingWidget,
                    ),
                    // leadingWidget,
                    Expanded(
                      child: TextField(
                        onTap: onTap,
                        textAlignVertical: TextAlignVertical.center,
                        onSubmitted: onSubmitted,
                        controller: controller,
                        focusNode: focusNode,
                        onChanged: onChanged,
                        obscureText: obscureText,
                        keyboardType: keyboardType,
                        textInputAction: textInputAction,
                        maxLines: maxLines,
                        decoration: InputDecoration(
                            hintText: hintText,
                            suffixIcon: trailing,
                            border: InputBorder.none,
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w300)),
                        autofocus: autofocus ?? false,
                      ),
                    )
                  ],
                ),
                _buildErrorLabel(context)
              ],
            ),
          ),
        );

      case AppTextInputType.mobile:
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor.withOpacity(.07),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: leadingWidget,
                  ),
                  // leadingWidget,
                  Expanded(
                    child: TextField(
                      onTap: onTap,
                      textAlignVertical: TextAlignVertical.center,
                      onSubmitted: onSubmitted,
                      controller: controller,
                      focusNode: focusNode,
                      onChanged: onChanged,
                      obscureText: obscureText,
                      keyboardType: keyboardType,
                      textInputAction: textInputAction,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(10)
                      ],
                      maxLines: maxLines,
                      decoration: InputDecoration(
                        hintText: hintText,
                        suffixIcon: trailing,
                        border: InputBorder.none,
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      autofocus: autofocus ?? false,
                    ),
                  )
                ],
              ),
              _buildErrorLabel(context)
            ],
          ),
        );
      default:
    }
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor.withOpacity(.07),
        borderRadius: BorderRadius.circular(6),
        //เส้นขอบ
        border: Border.all(
          color: Colors.black12,
          width: 2.0,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: leadingWidget,
              ),
              // leadingWidget,
              Expanded(
                child: TextField(
                  onTap: onTap,
                  textAlignVertical: TextAlignVertical.center,
                  onSubmitted: onSubmitted,
                  controller: controller,
                  focusNode: focusNode,
                  onChanged: onChanged,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                      hintText: hintText,
                      suffixIcon: trailing,
                      border: InputBorder.none,
                      hintStyle: const TextStyle(fontWeight: FontWeight.w300)),
                  autofocus: autofocus ?? false,
                ),
              )
            ],
          ),
          _buildErrorLabel(context)
        ],
      ),
    );
  }
}
