import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/App/router.dart';
import 'package:rick_and_morty/views/characters_view/characters_viewmodel.dart';
import 'package:rick_and_morty/views/widgets/characters_cardview.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  @override

  //viewmodel ile ilişki kurmak için
  void initState(){
    super.initState();
    context.read<CharactersViewModal>().getCharacters();
  }


  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        children: [
          _searchInputWidget(context),
          CharactersCardView(
            image: 'https://rickandmortyapi.com/api/character/avatar/285.jpeg',
            name: 'Rick Sancez',
            origin: 'Earth (C-137)',
            status: 'Yaşıyor',
            type: 'İnsan',

          ),
          CharactersCardView(
            image: 'https://rickandmortyapi.com/api/character/avatar/285.jpeg',
            name: 'Rick Sancez',
            origin: 'Earth (C-137)',
            status: 'Yaşıyor',
            type: 'İnsan',

          ),
          CharactersCardView(
            image: 'https://rickandmortyapi.com/api/character/avatar/285.jpeg',
            name: 'Rick Sancez',
            origin: 'Earth (C-137)',
            status: 'Yaşıyor',
            type: 'İnsan',

          ),
        ],
      ),
    );
  }

  Widget _searchInputWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 9,
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Karakter ara',
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          border: const OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ),
      ),
    );
  }
}
