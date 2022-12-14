import 'package:belljob/packages.dart';

class ButtonPrimary extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  const ButtonPrimary({super.key, required this.text, required this.onPressed});

  @override
  State<ButtonPrimary> createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: IColors.neutral10,
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
            .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
