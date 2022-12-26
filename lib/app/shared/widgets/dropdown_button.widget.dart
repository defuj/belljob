import 'package:belljob/repositories.dart';

class DropdownButtons extends StatefulWidget {
  final String? dropdownValue;
  final List<String> list;
  final Function(String)? onChanged;
  const DropdownButtons({
    super.key,
    this.dropdownValue = 'Pilih jenis pekerjaan',
    required this.list,
    required this.onChanged,
  });

  @override
  State<DropdownButtons> createState() => _DropdownButtonState();
}

class _DropdownButtonState extends State<DropdownButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: IColors.neutral95,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButton<String>(
        isExpanded: true,
        value: widget.dropdownValue,
        icon: const Icon(Icons.expand_more),
        hint: Text(
          'Pilih jenis pekerjaan',
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: IColors.neutral10),
        ),
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: IColors.neutral10),
        underline: Container(
          height: 0,
          color: Colors.transparent,
        ),
        onChanged: (String? value) {
          widget.onChanged!(value!);
        },
        items: widget.list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: IColors.neutral10),
            ),
          );
        }).toList(),
      ),
    );
  }
}
