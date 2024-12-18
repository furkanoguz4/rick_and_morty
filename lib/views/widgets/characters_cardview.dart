import 'package:flutter/material.dart';

class CharactersCardView extends StatelessWidget {
  final String image;
  final String name;
  final String origin;
  final String status;
  final String type;
  const CharactersCardView({super.key, required this.image, required this.name, required this.origin, required this.status, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Stack(alignment: Alignment.topRight, children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(6)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  'https://rickandmortyapi.com/api/character/avatar/285.jpeg',
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    _infoWidget(type: 'köken', value: origin),
                    SizedBox(
                      height: 4,
                    ),
                    _infoWidget(type: 'köken', value: '${status}-${type}'),
                  ],
                ),
              )
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
      ]),
    );
  }

  Widget _infoWidget({required String type, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
