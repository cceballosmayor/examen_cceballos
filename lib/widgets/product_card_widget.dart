import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final ProductList product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardDecorations(),
        child: Stack(alignment: Alignment.bottomLeft, children: [
          _BackGroundImage(url: product.productImage),
          _ProductDetails(product: product),
          Positioned(top: 0, right: 0, child: _PriceTag(product: product)),
          if (product.productState == 'bloqueado')
            Positioned(top: 0, left: 0, child: _State(product: product))
        ]),
      ),
    );
  }

  BoxDecoration _cardDecorations() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: const [
      BoxShadow(
        color: Colors.grey,
        offset: Offset(0, 5),
        blurRadius: 10,
        )
          ]);
}

class _PriceTag extends StatelessWidget {
  final ProductList product;

  const _PriceTag({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$' + product.productPrice.toString(),
            style: TextStyle(fontSize: 20, color: Colors.white))
        ),
      ),
      width: 100,
      height: 60,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.red
      )
    );
  }
}

class _State extends StatelessWidget {
  final ProductList product;

  const _State({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(product.productState,
                style: TextStyle(fontSize: 20, color: Colors.white))),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final ProductList product;

  const _ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0, left: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 80,
        decoration: _boxDecorations(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.productName,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Text(
              'Cod.',
              style: TextStyle(fontSize: 14, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

BoxDecoration _boxDecorations() => const BoxDecoration(
  color: Colors.green,
  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), topRight: Radius.circular(5)));
}

class _BackGroundImage extends StatelessWidget {
  final String? url;
  const _BackGroundImage({Key? key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        height: 400,
        child: url == null
            ? const Image(
                image: AssetImage('assets/no_image.jpg'),
                fit: BoxFit.cover,
              )
            : FadeInImage.assetNetwork(
                placeholder: 'assets/no_image.jpg',
                image: url!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}