part of 'widgets.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final Function onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget suffixIcon;
  final String errorValidation;
  final int maxLines;

  CustomTextField({
    this.labelText,
    this.hintText,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.errorValidation,
    this.maxLines,
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
              labelText,
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
        TextField(
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          style: semiBoldBaseFont.copyWith(
            fontSize: 14,
            color: Color(0xFF111111),
          ),
          maxLines: (maxLines != null) ? maxLines : 1,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFEBEBEF),
            hintText: hintText,
            hintStyle: semiBoldBaseFont.copyWith(
              fontSize: 14,
              color: Color(0xFFC6C6C6),
            ),
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
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                style: BorderStyle.none,
              ),
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
