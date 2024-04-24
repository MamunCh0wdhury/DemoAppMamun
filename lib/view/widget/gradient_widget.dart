import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({
    super.key, this.child,
  });

  final child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 204.0,
        width: MediaQuery.of(context).size.width*0.98,
        child: Stack(
          children: [
            Container(
              height: 204.0,
              width: MediaQuery.of(context).size.width*0.98,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xff32D74B),
                      Color(0xff0D986A)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
