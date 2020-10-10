part of 'widgets.dart';

class CustomDropdownField extends StatelessWidget {
  final String labelName;
  final String hintText;
  final String errorValidation;
  final String value;
  final List<String> options;
  final Function(String) onChanged;
  final bool isEdit;

  CustomDropdownField({
    this.errorValidation,
    this.onChanged,
    this.labelName,
    this.hintText,
    this.value,
    this.options,
    this.isEdit = false,
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
              style: boldBaseFont.copyWith(fontSize: 14),
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
              color: isEdit ? baseColor : Color(0xFFC6C6C6),
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
          value: value,
          items: options.map((String option) {
            return DropdownMenuItem(
              child: Text(
                option,
                style: semiBoldBaseFont.copyWith(
                  fontSize: 15,
                  color: Color(0xFF111111),
                ),
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
