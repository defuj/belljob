import 'package:belljob/packages.dart';

class ButtonSecondary extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  const ButtonSecondary(
      {super.key, required this.text, required this.onPressed});

  @override
  State<ButtonSecondary> createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonSecondary> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: IColors.neutral95,
        minimumSize: const Size.fromHeight(45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(fontWeight: FontWeight.w500, color: IColors.neutral20),
      ),
    );
  }
}
