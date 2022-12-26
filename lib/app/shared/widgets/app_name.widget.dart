import 'package:belljob/repositories.dart';

class AppNameText extends StatelessWidget {
  final TextStyle? textStyle;
  const AppNameText({super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    var textStyle = this.textStyle ?? Theme.of(context).textTheme.headline2;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Neang ',
            style: textStyle!.copyWith(
                color: IColors.secondary50, fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text: 'Gawe',
            style: textStyle.copyWith(
                color: IColors.neutral20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
