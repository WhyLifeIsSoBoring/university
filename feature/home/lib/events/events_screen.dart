import 'package:flutter/material.dart';
import 'package:home/events/bloc/events_bloc.dart';
import 'package:presentation/presentation.dart';

class EventsScreen extends StatefulWidget {
  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventsBloc>(
      create: (_) => EventsBloc()..add(InitEvent()),
      child: BlocBuilder<EventsBloc, EventsState>(
        builder: (BuildContext context, EventsState state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'События',
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: state.allEvents.isNotEmpty
                    ? Column(
                        children: <Widget>[
                          SearchBar(
                            onClear: () {
                              BlocProvider.of<EventsBloc>(context)
                                  .add(UpdateSearchText(newSearchText: ''));
                              _searchController.clear();
                            },
                            onChanged: (String? newText) {
                              BlocProvider.of<EventsBloc>(context).add(
                                  UpdateSearchText(newSearchText: newText));
                            },
                            textController: _searchController,
                          ),
                          SizedBox(height: 10.0),
                          if (state.filteredEvents.isNotEmpty) ...<Widget>{
                            Expanded(
                              child: ListView.builder(
                                itemCount: state.filteredEvents.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SocialEventItem(
                                    title: state.filteredEvents[index].title,
                                    date: state.filteredEvents[index].date,
                                    imageUrl:
                                        state.filteredEvents[index].imageUrl,
                                    onTap: () {},
                                  );
                                },
                              ),
                            ),
                          } else ...<Widget>{
                            Text(
                              'События не найдены',
                              style: TextStyle(fontSize: 20),
                            )
                          }
                        ],
                      )
                    : Loader()),
          );
        },
      ),
    );
  }
}
