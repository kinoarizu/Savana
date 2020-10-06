part of 'widgets.dart';

class CustomDropdownField extends StatelessWidget {
  final String labelName;
  final String hintText;
  final String errorValidation;
  final List<String> options;
  final Function(String) onChanged;

  CustomDropdownField({
    this.errorValidation,
    this.onChanged,
    this.labelName,
    this.hintText,
    this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              labelName,
              style: semiBoldBaseFont.copyWith(fontSize: 14),
            ),
            if (errorValidation != null)
              Text(
                errorValidation,
                style: semiBoldBaseFont.copyWith(
                  color: Color(0xFFD30000),
                  fontSize: 12,
                ),
              ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        DropdownButtonFormField(
          hint: Text(
            hintText,
            style: semiBoldBaseFont.copyWith(
              fontSize: 14,
              color: Color(0xFFC6C6C6),
            ),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFEBEBEF),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12.5,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                style: BorderStyle.none,
              ),
            ),
          ),
          items: options.map((String option) {
            return DropdownMenuItem(
              child: Text(
                option,
                style: semiBoldBaseFont.copyWith(fontSize: 15),
              ),
              value: option,
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
