import 'package:belljob/packages.dart';

class InputText extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final String? hintText;
  const InputText({
    super.key,
    this.onChanged,
    this.hintText = '',
    this.initialValue = '',
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14),
      decoration: const BoxDecoration(
        color: IColors.neutral95,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: TextFormField(
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        keyboardType: TextInputType.visiblePassword,
        maxLength: 50,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: IColors.neutral20),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: IColors.neutral70),
        ),
      ),
    );
  }
}
