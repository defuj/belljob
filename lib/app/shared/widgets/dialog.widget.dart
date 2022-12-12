import 'package:belljob/packages.dart';

class MyAlertDialog extends AlertDialog {
  MyAlertDialog({
    Key? key,
    required BuildContext context,
    required String title,
    required String content,
    String? cancelText,
    String? confirmText = 'Oke',
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
  }) : super(
          key: key,
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          content: Text(
            content,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          actions: [
            if (cancelText != null)
              TextButton(
                onPressed: onCancel ?? () => Navigator.pop(context),
                child: Text(cancelText),
              ),
            TextButton(
              onPressed: onConfirm ?? () => Navigator.pop(context),
              child: Text(confirmText!),
            ),
          ],
        );
}
