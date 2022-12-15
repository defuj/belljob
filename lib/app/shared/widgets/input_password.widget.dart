import 'package:belljob/packages.dart';

class InputPassword extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final String? hintText;
  const InputPassword({
    super.key,
    this.onChanged,
    this.hintText = 'Masukkan kata sandi',
    this.initialValue = '',
  });

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  final _obscureText = true.obs;
  void changeVisibility() {
    _obscureText.value = !_obscureText.value;
  }

  var errorText = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14),
      decoration: const BoxDecoration(
        color: IColors.neutral95,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Obx(
        () => TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              PasswordCheck(password: value).process(PasswordResult(
                onPasswordValid: () {
                  return null;
                },
                onPasswordInvalid: (String message) {
                  return message;
                },
              ));
            }
            return null;
          },
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          keyboardType: TextInputType.visiblePassword,
          maxLength: 25,
          obscureText: _obscureText.value,
          obscuringCharacter: '*',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: IColors.neutral20),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () => changeVisibility(),
              icon: Icon(
                _obscureText.value
                    ? Icons.visibility_outlined
                    : Icons.visibility,
                color:
                    _obscureText.value ? IColors.neutral60 : IColors.neutral10,
              ),
            ),
            counterText: '',
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: IColors.neutral70),
          ),
        ),
      ),
    );
  }
}
