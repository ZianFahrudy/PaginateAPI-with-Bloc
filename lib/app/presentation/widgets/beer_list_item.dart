import 'package:flutter/material.dart';
import 'package:pagination_with_bloc/app/data/models/beer_model.dart';

class BeerListItem extends StatelessWidget {
  const BeerListItem(this.beer, {Key? key}) : super(key: key);

  final BeerModel beer;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(beer.name),
      subtitle: Text(beer.tagline),
      childrenPadding: const EdgeInsets.all(16),
      leading: Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(beer.id.toString()),
      ),
      children: [
        Text(
          beer.description,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        beer.imageUrl.isEmpty
            ? Container()
            : Image.network(
                beer.imageUrl,
                loadingBuilder: (context, widget, imageChunkEvent) {
                  return imageChunkEvent == null
                      ? widget
                      : const CircularProgressIndicator();
                },
                height: 300,
              ),
      ],
    );
  }
}
