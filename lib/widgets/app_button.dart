import 'package:flutter/material.dart';

enum ButtonType {
  normal,
  outline,
  text,
  rowbtn1,
  rowbtn2,
  function,
  history,
  canclealert,
  mycart
}

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool loading;
  final bool disabled;
  final ButtonType type;
  final Widget? icon;
  final Widget? trailing;
  final MainAxisSize mainAxisSize;
  final bool disableTouchWhenLoading;
  final bool disableButton;

  const AppButton(
    this.text, {
    Key? key,
    required this.onPressed,
    this.icon,
    this.trailing,
    this.loading = false,
    this.disabled = false,
    this.type = ButtonType.normal,
    this.mainAxisSize = MainAxisSize.min,
    this.disableTouchWhenLoading = false,
    this.disableButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildLoading() {
      if (!loading) return Container();
      return Row(
        children: const [
          SizedBox(width: 8),
          SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              color: Colors.white,
            ),
          )
        ],
      );
    }

    switch (type) {
      case ButtonType.mycart:
        if (icon != null) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: const Color(0xffC4C4C4),
                minimumSize: const Size(390, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                shadowColor: Colors.transparent,
              ),
              onPressed: disabled ? null : onPressed,
              icon: icon!,
              label: Row(
                mainAxisSize: mainAxisSize,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    text,
                    // style: AppTheme.content4(),
                  ),
                  buildLoading()
                ],
              ),
            ),
          );
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: const Color(0xff2D65AD),
            minimumSize: const Size(190, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadowColor: Colors.transparent,
          ),
          onPressed: disabled ? null : onPressed,
          child: Row(
            mainAxisSize: mainAxisSize,
            children: <Widget>[
              Text(
                text,
                // style: AppTheme.content4(),
              ),
              buildLoading()
            ],
          ),
        );

      case ButtonType.history:
        if (icon != null) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: const Color(0xffC4C4C4),
                minimumSize: const Size(390, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                shadowColor: Colors.transparent,
              ),
              onPressed: disabled ? null : onPressed,
              icon: icon!,
              label: Row(
                mainAxisSize: mainAxisSize,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    text,
                    // style: AppTheme.content4(),
                  ),
                  buildLoading()
                ],
              ),
            ),
          );
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: const Color(0xff2D65AD),
            minimumSize: const Size(190, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadowColor: Colors.transparent,
          ),
          onPressed: disabled ? null : onPressed,
          child: Row(
            mainAxisSize: mainAxisSize,
            children: <Widget>[
              Text(
                text,
                // style: AppTheme.content4(),
              ),
              buildLoading()
            ],
          ),
        );

      case ButtonType.function:
        if (icon != null) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: disabled ? null : onPressed,
              icon: icon!,
              label: Row(
                mainAxisSize: mainAxisSize,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    text,
                  ),
                  buildLoading()
                ],
              ),
            ),
          );
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onPressed: disabled ? null : onPressed,
          child: Row(
            mainAxisSize: mainAxisSize,
            children: <Widget>[
              Text(
                text,
              ),
              buildLoading()
            ],
          ),
        );

      case ButtonType.rowbtn2:
        if (icon != null) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              minimumSize: const Size(64, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadowColor: Colors.transparent,
            ),
            onPressed: onPressed,
            child: icon,
          );
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            minimumSize: const Size(64, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadowColor: Colors.transparent,
          ),
          onPressed: disabled ? null : onPressed,
          child: Row(
            mainAxisSize: mainAxisSize,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                // style: AppTheme.content5(),
              ),
              buildLoading()
            ],
          ),
        );

      case ButtonType.outline:
        if (icon != null) {
          return OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              elevation: 0.0,
              minimumSize: const Size(64, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: disabled ? null : onPressed,
            icon: icon!,
            label: Row(
              mainAxisSize: mainAxisSize,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  text,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                buildLoading()
              ],
            ),
          );
        }
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            elevation: 0.0,
            minimumSize: const Size(64, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: disabled ? null : onPressed,
          child: Row(
            mainAxisSize: mainAxisSize,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              buildLoading()
            ],
          ),
        );

      case ButtonType.canclealert:
        if (icon != null) {
          return ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              minimumSize: const Size(64, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadowColor: Colors.transparent,
            ),
            onPressed: disabled ? null : onPressed,
            icon: icon!,
            label: Row(
              mainAxisSize: mainAxisSize,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  text,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                buildLoading()
              ],
            ),
          );
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: Colors.grey,
            minimumSize: const Size(64, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadowColor: Colors.transparent,
          ),
          onPressed: disabled ? null : onPressed,
          child: Row(
            mainAxisSize: mainAxisSize,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              buildLoading()
            ],
          ),
        );

      case ButtonType.text:
        if (icon != null) {
          return TextButton.icon(
            onPressed: disabled ? null : onPressed,
            icon: icon!,
            label: Row(
              mainAxisSize: mainAxisSize,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  text,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                buildLoading()
              ],
            ),
          );
        }
        return TextButton(
          onPressed: disabled ? null : onPressed,
          child: Row(
            mainAxisSize: mainAxisSize,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              buildLoading()
            ],
          ),
        );
      default:
        if (icon != null) {
          return ElevatedButton.icon(
            onPressed: disabled ? null : onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              minimumSize: const Size(390, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: icon!,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  text,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                buildLoading()
              ],
            ),
          );
        }
        return ElevatedButton(
          onPressed: disabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            minimumSize: const Size(64, 48),
            backgroundColor: Colors.blue.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisSize: mainAxisSize,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              buildLoading()
            ],
          ),
        );
    }
  }
}
