import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_akhir_toko/ui/style/colors.dart';

class Invoice extends StatelessWidget {
  const Invoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: ClipPath(
        clipper: FolderClipper(),
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Invoice For",
                          style: Theme.of(context).textTheme.headline2),
                      Text("Ardi",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: AppColors.purple)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FolderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double radius = 24;

    path.moveTo(0, radius);
    // Left Radius
    path.quadraticBezierTo(0, 0, radius, 0);

    // Top Line
    path.lineTo(size.width / 2 - radius, 0);
    path.lineTo(size.width / 2 + radius, radius);
    path.lineTo(size.width - radius, radius);

    // Right Radius
    path.quadraticBezierTo(size.width, radius, size.width, radius * 2);

    //Bottom Radius
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
