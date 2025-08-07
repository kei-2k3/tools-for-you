import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tools_for_you/core/helper/get_favourite_timezone.dart';
import 'package:tools_for_you/core/helper/get_time_in_timezone.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/core/widgets/textfield/k_textfield.dart';

import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

class TimezoneConverterView extends ConsumerStatefulWidget {
  const TimezoneConverterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TimezoneConverterViewState();
}

class _TimezoneConverterViewState extends ConsumerState<TimezoneConverterView> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<String> allTimezones = [];
  List<String> filteredTimezones = [];
  List<String> displayTimezones = [];
  List<String> favoriteTimezones = [];
  bool hideSuggestion = false;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
    tzdata.initializeTimeZones();
    allTimezones = tz.timeZoneDatabase.locations.keys.toList();
  }

  void _loadFavorites() async {
    final favorites = await GetFavouriteTimezone.getFavorites();
    setState(() {
      //favoriteTimezones = favorites;
      displayTimezones = favorites;
    });
    print('Load');
    print('Display: $displayTimezones');
    print('Favourite: $favoriteTimezones');
  }

  void _toggleFavorite(String timezone) async {
    final isFavorite = favoriteTimezones.contains(timezone);
    if (isFavorite) {
      await GetFavouriteTimezone.removeFavorite(timezone);
    } else {
      await GetFavouriteTimezone.addFavorite(timezone);
    }

    setState(() {});
    await GetFavouriteTimezone.saveFavorites(favoriteTimezones);
  }

  void _filterTimezones(String timezone) {
    final query = timezone.toLowerCase();
    setState(() {
      hideSuggestion = false;
      filteredTimezones = allTimezones
          .where((zone) => zone.toLowerCase().contains(query))
          .toList();
    });
  }

  void _selectTimezone(String timezone) {
    _controller.text = timezone;

    _submittedTimezones(timezone);
    setState(() {
      hideSuggestion = true;
    });
    FocusScope.of(context).unfocus();
  }

  void _submittedTimezones(String timezone) {
    if (!displayTimezones.contains(timezone)) {
      displayTimezones.add(timezone);
    }
    setState(() {
      hideSuggestion = true;
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            setState(() => hideSuggestion = true);
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              Column(
                spacing: 20,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.kLessDarkBG,
                    ),
                    child: KTextfield(
                      controller: _controller,
                      focusNode: _focusNode,
                      onChanged: _filterTimezones,
                      onSubmitted: (value) {
                        if (filteredTimezones.contains(value)) {
                          _submittedTimezones(value);
                        }
                      },
                      hintText: "Search Timezone by city",
                    ),
                  ),
                  if (displayTimezones.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: displayTimezones.length,
                        itemBuilder: (context, index) {
                          final timezone = displayTimezones[index];
                          final currentTime = getTimeInTimezone(timezone);
                          bool isFavorite = false;

                          print('Display: $displayTimezones');
                          print('Favorite: $favoriteTimezones');
                          return Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColor.kLessDarkBG),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        timezone,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: AppColor.kPrimary),
                                      ),
                                      Text(
                                        currentTime,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () => _toggleFavorite(timezone),
                                    icon: Icon(
                                      Icons.favorite,
                                      color: isFavorite
                                          ? AppColor.kPrimary
                                          : AppColor.kDarkBG,
                                    ))
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
              if (!hideSuggestion && filteredTimezones.isNotEmpty)
                Positioned(
                  left: 0,
                  right: 0,
                  top: 100,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 250),
                    child: Material(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: filteredTimezones.length,
                              itemBuilder: (context, index) {
                                final tzName = filteredTimezones[index];
                                return InkWell(
                                  onTap: () {
                                    _selectTimezone(tzName);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 16.0),
                                    child: Text(
                                      tzName,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                              onPressed: () =>
                                  setState(() => hideSuggestion = true),
                              icon: Icon(
                                Icons.close,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}
