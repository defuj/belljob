import 'package:belljob/packages.dart';

class InputPhoneNumber extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final String? hintText;
  const InputPhoneNumber({
    super.key,
    this.onChanged,
    this.hintText = 'Masukan Nomor Handphone',
    this.initialValue = '',
  });

  @override
  State<InputPhoneNumber> createState() => _InputPhoneNumberState();
}

class _InputPhoneNumberState extends State<InputPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: const BoxDecoration(
            color: IColors.neutral90,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
            ),
          ),
          child: Text(
            '+62',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: IColors.neutral20, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
              color: IColors.neutral95,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            child: TextFormField(
              initialValue: widget.initialValue,
              onChanged: widget.onChanged,
              keyboardType: TextInputType.phone,
              maxLength: 13,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: IColors.neutral20),
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                fillColor: IColors.neutral50,
                hintText: widget.hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: IColors.neutral70),
              ),
            ),
          ),
        )
      ],
    );
  }
}
