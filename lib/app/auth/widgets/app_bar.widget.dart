import 'package:belljob/repositories.dart';

PreferredSizeWidget appBar({
  required BuildContext? context,
  String? title = '',
  Color? backgroundColor = Colors.white,
  Color? foregroundColor = Colors.white,
}) {
  return AppBar(
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    surfaceTintColor: Colors.white,
    elevation: 0,
    title: Text(
      title!,
      style: Theme.of(context!)
          .textTheme
          .headline4!
          .copyWith(color: IColors.neutral10, fontWeight: FontWeight.w600),
    ),
  );
}
