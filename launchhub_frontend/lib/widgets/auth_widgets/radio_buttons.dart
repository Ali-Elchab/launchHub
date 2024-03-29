import 'package:flutter/material.dart';
import 'package:launchhub_frontend/providers/auth_provider.dart';

class RadioButtons extends StatefulWidget {
  const RadioButtons({super.key, required this.onSelectionChanged});
  final Function(UserType) onSelectionChanged;

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  UserType? _type = UserType.startup;

  void _handleRadioValueChange(UserType? value) {
    setState(() {
      _type = value;
    });
    widget.onSelectionChanged(value!);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(children: [
          Radio<UserType>(
            activeColor: Theme.of(context).colorScheme.primary,
            value: UserType.startup,
            groupValue: _type,
            onChanged: _handleRadioValueChange,
          ),
          const Text('Startup'),
        ]),
        Row(children: [
          Radio<UserType>(
            activeColor: Theme.of(context).colorScheme.primary,
            value: UserType.jobseeker,
            groupValue: _type,
            onChanged: _handleRadioValueChange,
          ),
          const Text('Job Seeker'),
        ]),
      ],
    );
  }
}
