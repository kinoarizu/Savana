part of 'widgets.dart';

class TargetCategoryCard extends StatelessWidget {
  final Category category;
  final Function onPressed;

  TargetCategoryCard({
    this.category,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10,
              ),
            ],
          ),
          child: FlatButton(
            splashColor: Colors.black.withOpacity(0.5),
            child: SvgPicture.asset(
              category.icon,
              width: 35,
              height: 35,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: onPressed,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          category.name,
          style: semiBoldBaseFont.copyWith(
            fontSize: 14,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
