import 'package:flutter/material.dart';
import 'package:tasks/core/style/colors.dart';
import 'package:tasks/core/style/text_style.dart';
import 'package:tasks/features/home/view/screen/details_screen.dart';
import 'package:tasks/models/data.dart';

class CardBuilder extends StatelessWidget {
  final DataModel product;
  const CardBuilder({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 10,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: product,),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title ?? '-',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle(),
                    ),
                    Expanded(
                      child: Image(image: NetworkImage(product.image),
                      fit: BoxFit.fill,),
                    ),
                    Text(
                      '\$${(product.price ??0.00).toDouble().toStringAsFixed(2)}',
                      style:  bodyStyle(),
                    ),
                    Row(
                      children: [
                        Text('${product.rating.rate} ',
                        style: bodyStyle(),
                        ),
                        Icon(Icons.star,color: AppColors.amber,size: 15,),
                        Text('(${product.rating.count}) ',
                          style: hashStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}