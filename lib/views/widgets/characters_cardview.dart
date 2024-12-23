import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/characters_model.dart';

class CharactersCardView extends StatelessWidget {
  final CharacterModel characterModel ;
  const CharactersCardView({super.key, required this.characterModel});

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
                  characterModel.image,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      characterModel.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    _infoWidget(type: 'köken', value: characterModel.origin.name),
                    SizedBox(
                      height: 4,
                    ),
                    _infoWidget(type: 'köken', value: '${characterModel.status}-${characterModel.species}'),
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
