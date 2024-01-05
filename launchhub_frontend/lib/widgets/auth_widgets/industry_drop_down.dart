import 'package:flutter/material.dart';
import 'package:launchhub_frontend/models/industry.dart';

class IndustryDropDown extends StatelessWidget {
  final List<Industry> list;
  final Industry? value;
  final ValueChanged<Industry?> onChanged;
  final String? Function(Industry?)? validator;
  final AutovalidateMode autovalidateMode;
  const IndustryDropDown({
    super.key,
    required this.list,
    required this.value,
    required this.onChanged,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<Industry>(
        validator: validator,
        autovalidateMode: autovalidateMode,
        initialValue: value,
        builder: (FormFieldState<Industry> state) {
          return InputDecorator(
            decoration: InputDecoration(
              errorText: state.hasError ? state.errorText : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              labelText: value == null ? '' : 'Industry',
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              floatingLabelStyle:
                  Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color(0xFF326789),
                      ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Industry>(
                borderRadius: BorderRadius.circular(10),
                icon: const Icon(Icons.arrow_drop_down,
                    color: Color.fromARGB(255, 75, 75, 75)),
                isExpanded: true,
                onChanged: (Industry? newValue) {
                  state.didChange(newValue);
                  onChanged(newValue);
                },
                value: state.value,
                hint: value == null
                    ? const Text(
                        "Select Industry",
                        style: TextStyle(
                            color: Color.fromARGB(255, 172, 172, 172)),
                      )
                    : null,
                items:
                    list.map<DropdownMenuItem<Industry>>((Industry industry) {
                  return DropdownMenuItem<Industry>(
                    value: industry,
                    child: Text(
                      industry.name,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                dropdownColor: Colors.white,
              ),
            ),
          );
        });
  }
}
