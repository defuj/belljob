import 'package:belljob/packages.dart';

class InputText extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final String? hintText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  const InputText({
    super.key,
    this.onChanged,
    this.hintText = '',
    this.initialValue = '',
    this.maxLength = 50,
    this.keyboardType = TextInputType.text,
    this.minLines = 1,
    this.maxLines = 1,
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
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
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
