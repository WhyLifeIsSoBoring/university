import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/schools/bloc/schools_bloc.dart';
import 'package:presentation/presentation.dart';

class SchoolsScreen extends StatefulWidget {
  @override
  State<SchoolsScreen> createState() => _SchoolsScreenState();
}

class _SchoolsScreenState extends State<SchoolsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SchoolsBloc>(
      create: (_) => SchoolsBloc()..add(InitEvent()),
      child: BlocBuilder<SchoolsBloc, SchoolsState>(
        builder: (BuildContext context, SchoolsState state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Школы юных',
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 8.0,
                right: 8.0,
              ),
              child: _buildContent(
                context,
                allSchools: state.allSchools,
                filteredSchools: state.filteredSchools,
                errorMessage: state.errorMessage,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context, {
    required List<School> allSchools,
    required List<School> filteredSchools,
    required String? errorMessage,
  }) {
    if (errorMessage == null && allSchools.isNotEmpty) {
      return Column(
        children: <Widget>[
          SearchBar(
            onClear: () {
              BlocProvider.of<SchoolsBloc>(context)
                  .add(UpdateSearchText(newSearchText: ''));
              _searchController.clear();
            },
            onChanged: (String? newText) {
              BlocProvider.of<SchoolsBloc>(context)
                  .add(UpdateSearchText(newSearchText: newText));
            },
            textController: _searchController,
          ),
          SizedBox(height: 10.0),
          if (filteredSchools.isNotEmpty) ...<Widget>{
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchools.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                filteredSchools[index].title,
                                style: TextStyle(fontSize: 14.0),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            SizedBox(
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<SchoolsBloc>().add(
                                      OpenCurrentSchool(
                                          school: filteredSchools[index]));
                                },
                                child: Center(
                                  child: Text('Описание'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 1.0,
                        thickness: 2,
                      ),
                    ],
                  );
                },
              ),
            ),
          } else ...<Widget>{
            Text(
              'Школы не найдены',
              style: TextStyle(fontSize: 20),
            )
          }
        ],
      );
    } else if (errorMessage == null && allSchools.isEmpty) {
      return Loader();
    } else {
      return Center(
        child: Text(
          errorMessage!,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
