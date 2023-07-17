import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weifangbus/view/home/searchbar/search_input.dart';

/// 搜索栏
class LineSearchBar extends StatefulWidget {
  final List<MaterialSearchResult<String>> allRouteList;

  const LineSearchBar({Key? key, required this.allRouteList}) : super(key: key);

  @override
  _LineSearchBarState createState() => _LineSearchBarState();
}

class _LineSearchBarState extends State<LineSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: MaterialSearchInput(
          placeholder: AppLocalizations.of(context)!.searchLine,
          results: widget.allRouteList,
          filter: (dynamic value, String criteria) {
            return value.toLowerCase().trim().contains(RegExp(r'' + criteria.toLowerCase().trim() + ''));
          },
        ),
      ),
    );
  }
}
