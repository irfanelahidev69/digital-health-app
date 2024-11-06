import 'package:digital_health_app/core/extensions/context.dart';
import 'package:flutter/material.dart';

import '../utilities/colors.dart';

class AppButton extends StatelessWidget {
  final Widget _child;

  AppButton({
    Key? key,
    final double? height,
    final double? width,
    final double? elevation,
    required final Widget child,
    final Color? background,
    final VoidCallback? onPressed,
    final bool? isProcessing,
    final BoxConstraints? constraints,
  })  : _child = _ElevatedButton(
          height: height,
          width: width,
          elevation: elevation,
          background: background,
          onPressed: onPressed,
          isProcessing: isProcessing ?? false,
          constraints: constraints,
          child: child,
        ),
        super(key: key);

  AppButton.outline({
    Key? key,
    final double? height,
    final double? width,
    final double? elevation,
    required final Widget child,
    final Color? background,
    final Color? borderColor,
    final VoidCallback? onPressed,
    final bool? isProcessing,
    final EdgeInsets? padding,
    final BoxConstraints? constraints,
  })  : _child = _OutlineButton(
          height: height,
          width: width,
          padding: padding,
          elevation: elevation,
          background: background,
          borderColor: borderColor,
          onPressed: onPressed,
          isProcessing: isProcessing ?? false,
          constraints: constraints,
          child: child,
        ),
        super(key: key);

  AppButton.shrink({
    Key? key,
    final double? height,
    final double? elevation,
    final double? width,
    required final Widget child,
    final Color? background,
    final VoidCallback? onPressed,
    final BorderRadius? borderRadius,
    final bool? isProcessing,
  })  : _child = _ShrinkElevatedButton(
          elevation: elevation,
          height: height,
          width: width,
          background: background,
          onPressed: onPressed,
          borderRadius: borderRadius,
          isProcessing: isProcessing ?? false,
          child: child,
        ),
        super(key: key);

  AppButton.shrinkTab({
    Key? key,
    final double? height,
    final double? elevation,
    final double? width,
    final Color? activeTabColor,
    final Color? inActiveTabColor,
    final VoidCallback? onPressed,
    final bool? isActive,
    required final String label,
    final TextStyle? labelStyle,
    final EdgeInsets? margin,
  })  : _child = _ShrinkTab(
          height: height,
          width: width,
          isActive: isActive,
          onPressed: onPressed,
          activeTabColor: activeTabColor,
          inActiveTabColor: inActiveTabColor,
          label: label,
          labelStyle: labelStyle,
          margin: margin,
        ),
        super(key: key);

  AppButton.outlineShrink({
    Key? key,
    final double? height,
    final double? elevation,
    final double? width,
    required final Widget child,
    final Color? background,
    final Color? borderColor,
    final VoidCallback? onPressed,
    final bool? isProcessing,
  })  : _child = _ShrinkOutlineButton(
          elevation: elevation,
          height: height,
          width: width,
          background: background,
          borderColor: borderColor,
          onPressed: onPressed,
          isProcessing: isProcessing ?? false,
          child: child,
        ),
        super(key: key);

  AppButton.appbar({
    Key? key,
    final double? height,
    final double? elevation,
    final double? width,
    required final Widget child,
    final Color? background,
    final VoidCallback? onPressed,
    final bool? isProcessing,

    /// count default value is -1 and pass any value greater than 0 to show badge
    final int? count,
  })  : _child = _AppElevatedButton(
          elevation: elevation,
          height: height,
          width: width,
          background: background,
          onPressed: onPressed,
          isProcessing: isProcessing,
          count: count,
          child: child,
        ),
        super(key: key);

  AppButton.text({
    super.key,
    final double? height,
    final double? width,
    final VoidCallback? onPressed,
    final bool? isProcessing,
    final IconData? icon,
    final bool? showIcon,
    required final Widget child,
  }) : _child = _TextButton(
          height: height,
          width: width,
          onPressed: onPressed,
          icon: icon,
          isProcessing: isProcessing ?? false,
          showIcon: showIcon ?? true,
          child: child,
        );

  @override
  Widget build(BuildContext context) {
    return _child;
  }
}

class _ElevatedButton extends StatelessWidget {
  final double height, width;
  final double? elevation;
  final VoidCallback? onPressed;
  final bool isProcessing;
  final Color? background;
  final Widget child;
  final BoxConstraints? constraints;

  const _ElevatedButton({
    final double? height,
    final double? width,
    this.elevation,
    this.onPressed,
    this.background,
    this.constraints,
    this.isProcessing = false,
    required this.child,
  })  : height = height ?? 48.0,
        width = width ?? double.infinity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: constraints,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
          elevation: MaterialStateProperty.all(elevation),
          // minimumSize:
          //     MaterialStateProperty.all<Size>(Size(width, primeryButtonHeight)),
          backgroundColor: background == null ? MaterialStateProperty.all<Color>(AppColors.kOrangeColor) : MaterialStateProperty.all<Color>(background!),
        ),
        onPressed: () {
          if (isProcessing) return;
          if (onPressed != null) onPressed!();
        },
        child: isProcessing ? _CircularProgressIndicator(height: height * 0.7, color: Theme.of(context).colorScheme.onPrimary) : child,
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final double height, width;
  final double? elevation;
  final VoidCallback? onPressed;
  final bool isProcessing;
  final Color? background;
  final Color? borderColor;
  final Widget child;
  final BoxConstraints? constraints;
  final EdgeInsets? padding;

  const _OutlineButton({
    final double? height,
    final double? width,
    this.elevation,
    this.onPressed,
    this.background,
    this.borderColor,
    this.constraints,
    this.isProcessing = false,
    this.padding,
    required this.child,
  })  : height = height ?? 48.0,
        width = width ?? double.infinity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: constraints,
      child: OutlinedButton(
        style: ButtonStyle(
          side: borderColor == null
              ? MaterialStateProperty.all(BorderSide(width: 1, color: Theme.of(context).scaffoldBackgroundColor))
              : MaterialStateProperty.all(
                  BorderSide(width: 1, color: borderColor!),
                ),
          padding: padding == null ? null : MaterialStateProperty.all(padding),
          elevation: MaterialStateProperty.all(elevation),
          backgroundColor: background == null ? null : MaterialStateProperty.all<Color>(background!),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        ),
        onPressed: !isProcessing ? onPressed : () {},
        child: isProcessing ? _CircularProgressIndicator(height: height * 0.7, color: AppColors.kOrangeColor) : child,
      ),
    );
  }
}

class _ShrinkTab extends StatelessWidget {
  final double height;
  final double? width;
  final VoidCallback? onPressed;
  final Color? activeTabColor;
  final Color? inActiveTabColor;
  final String label;
  final TextStyle? labelStyle;
  final bool isActive;
  final EdgeInsets margin;

  const _ShrinkTab({
    final double? height,
    this.width,
    this.onPressed,
    this.activeTabColor,
    this.inActiveTabColor,
    this.labelStyle,
    bool? isActive,
    final EdgeInsets? margin,
    required this.label,
  })  : isActive = isActive ?? false,
        margin = margin ?? const EdgeInsets.symmetric(horizontal: 8),
        height = height ?? 48.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: null,
        height: height,
        child: Padding(
          padding: margin,
          child: Material(
            color: Colors.transparent,
            shape: Border(
              bottom: BorderSide(
                width: 3.0,
                color: isActive ? activeTabColor ?? context.primary : inActiveTabColor ?? context.primary.withOpacity(0.6),
              ),
            ),
            child: Center(
              child: Text(
                label,
                style: labelStyle ??
                    Theme.of(context).textTheme.bodySmall?.copyWith(
                          height: 1.43,
                          fontWeight: FontWeight.w600,
                          color: isActive ? activeTabColor ?? context.primary : inActiveTabColor ?? context.primary,
                        ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ShrinkElevatedButton extends StatelessWidget {
  final double height;
  final double? width;
  final double? elevation;
  final VoidCallback? onPressed;
  final bool isProcessing;
  final Color? background;
  final Widget child;
  final BorderRadius? borderRadius;

  const _ShrinkElevatedButton({
    final double? height,
    this.elevation,
    this.width,
    this.onPressed,
    this.background,
    this.borderRadius,
    required this.isProcessing,
    required this.child,
  }) : height = height ?? 48.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: borderRadius == null ? null : MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: borderRadius!)),
          elevation: MaterialStateProperty.all(elevation),
          backgroundColor: background == null ? null : MaterialStateProperty.all<Color>(background!),
        ),
        onPressed: onPressed,
        child: isProcessing ? _CircularProgressIndicator(height: height * 0.7) : child,
      ),
    );
  }
}

class _ShrinkOutlineButton extends StatelessWidget {
  final double height;
  final double? width;
  final double? elevation;
  final VoidCallback? onPressed;
  final bool isProcessing;
  final Color? background;
  final Color? borderColor;
  final Widget child;

  const _ShrinkOutlineButton({
    final double? height,
    this.elevation,
    this.width,
    this.onPressed,
    this.background,
    this.isProcessing = false,
    this.borderColor,
    required this.child,
  }) : height = height ?? 48.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: ButtonStyle(
          side: borderColor == null ? null : MaterialStateProperty.all(BorderSide(color: borderColor!)),
          elevation: MaterialStateProperty.all(elevation),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: background == null ? null : MaterialStateProperty.all<Color>(background!),
        ),
        onPressed: onPressed,
        child: isProcessing ? _CircularProgressIndicator(height: height * 0.7, color: AppColors.kOrangeColor) : child,
      ),
    );
  }
}

class _AppElevatedButton extends StatelessWidget {
  final double height;
  final double? width;
  final double? elevation;
  final VoidCallback? onPressed;
  final bool? isProcessing;
  final Color? background;
  final Widget child;
  final int count;

  const _AppElevatedButton({
    final double? height,
    final int? count,
    this.elevation,
    this.width,
    this.onPressed,
    this.background,
    this.isProcessing = false,
    required this.child,
  })  : height = height ?? 48.0,
        count = count ?? -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: null,
          height: height,
          decoration: BoxDecoration(
            border: Border.symmetric(vertical: BorderSide(color: Theme.of(context).primaryColor)),
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(elevation),
              backgroundColor: background == null ? null : MaterialStateProperty.all<Color>(background!),
            ),
            onPressed: onPressed,
            child: child,
          ),
        ),
        if (count > 0)
          Positioned(
            right: 8.0,
            top: 6.0,
            child: Container(
              constraints: const BoxConstraints(minWidth: 18.0, minHeight: 18.0, maxWidth: 18.0, maxHeight: 18.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: context.primary, borderRadius: BorderRadius.circular(10.0)),
              padding: const EdgeInsets.all(2.0),
              child: FittedBox(
                child: Text(
                  '${count > 9 ? '9+' : count}',
                  style: context.bodySmall.copyWith(fontSize: 8.0, color: context.onPrimary, fontWeight: FontWeight.bold, height: 0.0),
                ),
              ),
            ),
          )
      ],
    );
  }
}

class _TextButton extends StatelessWidget {
  final double height;
  final VoidCallback? onPressed;
  final bool isProcessing;
  final IconData? icon;
  final Widget child;
  final bool showIcon;

  const _TextButton({
    final double? height,
    final double? width,
    this.icon,
    this.onPressed,
    this.isProcessing = false,
    this.showIcon = true,
    required this.child,
  }) : height = height ?? 48.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: InkWell(
        onTap: () {
          if (isProcessing) return;
          if (onPressed != null) onPressed!();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isProcessing ? _CircularProgressIndicator(height: height * 0.7, color: Theme.of(context).colorScheme.onPrimary) : child,
            if (showIcon) ...[
              const SizedBox(width: 10),
              Icon(
                icon ?? Icons.arrow_forward_sharp,
                size: 20,
                color: AppColors.kOrangeColor,
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class _CircularProgressIndicator extends StatelessWidget {
  final double height;
  final Color? color;

  const _CircularProgressIndicator({Key? key, required this.height, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.7,
      width: height * 0.7,
      child: CircularProgressIndicator(strokeWidth: 2, color: color ?? context.onPrimary),
    );
  }
}
