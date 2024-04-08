import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';
import 'package:rick_and_morti/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morti/data/models/character/character.dart';
import 'package:rick_and_morti/data/models/character/results.dart';
import 'package:rick_and_morti/presentation/widgets/character_card.dart';
import 'package:rick_and_morti/presentation/widgets/character_grid.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Character _currentCharacter;
  List<Results>? _currentResults = [];
  int _currentPage = 1;
  String _currentSearchStr = '';
  bool isListView = true;
  final refreshController = RefreshController();
  bool _isPagination = false;

  @override
  void initState() {
    super.initState();
    if (_currentResults!.isEmpty) {
      context.read<CharacterBloc>().add(CharacterFetch(name: '', page: 1));
    }
  }

  void _changeView() {
    setState(() {
      isListView = !isListView;
    });
  }

  Divider get _buildDivider {
    return const Divider(
      height: 24,
      color: Color(0xff0B1E2D),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 44,
        ),
        _createSearchBar(context),
        BlocBuilder<CharacterBloc, CharacterState>(builder: (context, state) {
          if (state is CharacterLoading) {
            if (!_isPagination) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return _createCatalog(_currentResults);
            }
          }
          if (state is CharacterLoaded) {
            _currentCharacter = state.character;
            if (_isPagination) {
              _currentResults!.addAll(_currentCharacter.results!);
              refreshController.loadComplete();
              _isPagination = false;
            } else {
              _currentResults = _currentCharacter.results;
            }

            return Expanded(
              child: _currentResults!.isEmpty
                  ? Container()
                  : _createCatalog(_currentResults),
            );
          }
          return _createNothingFounded();
        }),
      ],
    );
  }

  Padding _createCatalog(List<Results>? results) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Column(
        children: [
          _buildNumberOfChar(results!.length),
          Expanded(
              child: SmartRefresher(
            controller: refreshController,
            enablePullUp: true,
            enablePullDown: false,
            onLoading: () {
              _isPagination = true;
              _currentPage++;
              if (_currentPage <= _currentCharacter.info!.pages!) {
                context.read<CharacterBloc>().add(CharacterFetch(
                    name: _currentSearchStr, page: _currentPage));
              } else {
                refreshController.loadNoData();
              }
            },
            child:
                isListView ? _buildListView(results) : _buildGridView(results),
          )),
        ],
      ),
    );
  }

  ListView _buildListView(List<Results>? results) {
    return ListView.separated(
      separatorBuilder: (context, index) => _buildDivider,
      itemCount: results!.length,
      itemBuilder: (context, index) => CharacterCard(character: results[index]),
    );
  }

  GridView _buildGridView(List<Results>? results) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: results!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) => CharacterGrid(character: results[index]),
    );
  }

  Container _buildNumberOfChar(int len) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Всего персонажей: $len',
            style: AppFonts.s10w500.copyWith(
              color: Palette.smallText,
              letterSpacing: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: GestureDetector(
              onTap: _changeView,
              child: isListView
                  ? SvgPicture.asset('assets/icons/sort1.svg')
                  : SvgPicture.asset('assets/icons/gridIcon.svg'),
            ),
          ),
        ],
      ),
    );
  }

  Column _createNothingFounded() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 23),
          child: Text('РЕЗУЛЬТАТЫ ПОИСКА',
              style: AppFonts.s10w500.copyWith(color: Palette.smallText)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60, bottom: 28),
          child: Image.asset('assets/image/nothing_founded.png'),
        ),
        Text(
          'Персонаж с таким именем\n не найден',
          textAlign: TextAlign.center,
          style: AppFonts.s16w400.copyWith(
            color: Palette.smallText,
            letterSpacing: 0.15,
          ),
        ),
      ],
    );
  }

  SearchBar _createSearchBar(BuildContext context) {
    return SearchBar(
      textStyle: MaterialStatePropertyAll(
        AppFonts.s16w400.copyWith(
          color: Colors.white,
        ),
      ),
      onChanged: (value) {
        _currentPage = 1;
        _currentResults = [];
        _currentSearchStr = value;

        context
            .read<CharacterBloc>()
            .add(CharacterFetch(name: value, page: _currentPage));
      },
      hintText: 'Найти персонажа',
      hintStyle: MaterialStateProperty.all(
        AppFonts.s16w400.copyWith(
          color: Palette.smallText,
          letterSpacing: 0.44,
        ),
      ),
      leading: Container(
        padding: const EdgeInsets.only(left: 7),
        child: SvgPicture.asset('assets/icons/Group.svg'),
      ),
      trailing: [
        SvgPicture.asset(
          'assets/icons/Line.svg',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
              /* Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FilterScreen(
                  onChange: widget.isAsc,
                  isFilter: widget.isFilter,
                  getIsFilter: widget.getIsFilter,
                ),
              ),
            ); */
            },
            child: SvgPicture.asset('assets/icons/filter.svg'),
          ),
        )
      ],
      backgroundColor: MaterialStateProperty.all(Palette.searchBar),
    );
  }
}
