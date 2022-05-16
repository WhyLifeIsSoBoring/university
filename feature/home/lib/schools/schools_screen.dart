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
    return BlocProvider<SchoolBloc>(
      create: (_) => SchoolBloc()..add(InitEvent()),
      child: BlocBuilder<SchoolBloc, SchoolsState>(
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

  Widget _buildContent({
    required List<School> allSchools,
    required List<School> filteredSchools,
    required String? errorMessage,
  }) {
    if (errorMessage == null && allSchools.isNotEmpty) {
      return Column(
        children: <Widget>[
          SearchBar(
            onClear: () {
              BlocProvider.of<SchoolBloc>(context)
                  .add(UpdateSearchText(newSearchText: ''));
              _searchController.clear();
            },
            onChanged: (String? newText) {
              BlocProvider.of<SchoolBloc>(context)
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
                  return SizedBox.shrink();
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
