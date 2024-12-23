
import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty/models/characters_model.dart';
import 'package:rick_and_morty/views/widgets/characters_cardview.dart';

class CharacterCardListview extends StatefulWidget {
  final List<CharacterModel> characters;
  final VoidCallback onLoadmore;
  const CharacterCardListview({super.key, required this.characters,required this.onLoadmore});

  @override
  State<CharacterCardListview> createState() => _CharacterCardListviewState();
}

class _CharacterCardListviewState extends State<CharacterCardListview> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _detectedScrollBottom();
  }
  void _detectedScrollBottom(){
    _scrollController.addListener((){
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      const int delta = 50;
      if(maxScroll-currentPosition <= delta){
          widget.onLoadmore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: widget.characters.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          final characterModel = widget.characters[index];
          return CharactersCardView(characterModel: characterModel);
        },
      ),
    );
  }
}
