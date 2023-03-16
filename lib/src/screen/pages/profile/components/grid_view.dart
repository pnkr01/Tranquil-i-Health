import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(
            10, (index) => Image.asset('assets/images/a.jpg')
            // FancyShimmerImage(
            //   errorWidget: Image.network(
            //       'https://i.pinimg.com/564x/fe/b0/d9/feb0d9a503017fb2746db41c05a71a50.jpg'),
            //   imageUrl:
            //       'https://i.pinimg.com/564x/fe/b0/d9/feb0d9a503017fb2746db41c05a71a50.jpg',
            // ),
            ),
      ),
    );
  }
}
