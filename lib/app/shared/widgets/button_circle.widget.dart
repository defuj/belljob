import 'package:belljob/repositories.dart';

class ButtonCircle extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isChecked;
  const ButtonCircle(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isChecked = false});

  @override
  State<ButtonCircle> createState() => _ButtonState();
}

class _ButtonState extends State<ButtonCircle> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8),
        elevation: 0,
        backgroundColor:
            widget.isChecked ? IColors.secondary95 : Colors.transparent,
        minimumSize: const Size.fromHeight(45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.w600, color: IColors.secondary50),
      ),
    );
  }
}
