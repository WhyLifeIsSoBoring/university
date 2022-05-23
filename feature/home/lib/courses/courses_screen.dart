import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/courses/bloc/courses_bloc.dart';
import 'package:presentation/presentation.dart';

class CoursesScreen extends StatefulWidget {
  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CoursesBloc>(
      create: (_) => CoursesBloc()..add(InitEvent()),
      child: BlocBuilder<CoursesBloc, CoursesState>(
        builder: (BuildContext context, CoursesState state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Подготовительные курсы',
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
                allCourses: state.allCourses,
                filteredCourses: state.filteredCourses,
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
    required List<Course> allCourses,
    required List<Course> filteredCourses,
    required String? errorMessage,
  }) {
    if (errorMessage == null && allCourses.isNotEmpty) {
      return Column(
        children: <Widget>[
          SearchBar(
            onClear: () {
              BlocProvider.of<CoursesBloc>(context)
                  .add(UpdateSearchText(newSearchText: ''));
              _searchController.clear();
            },
            onChanged: (String? newText) {
              BlocProvider.of<CoursesBloc>(context)
                  .add(UpdateSearchText(newSearchText: newText));
            },
            textController: _searchController,
          ),
          SizedBox(height: 10.0),
          if (filteredCourses.isNotEmpty) ...<Widget>{
            Expanded(
              child: ListView.builder(
                itemCount: filteredCourses.length,
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
                                filteredCourses[index].title,
                                style: TextStyle(fontSize: 16.0),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            SizedBox(
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<CoursesBloc>().add(
                                      OpenCurrentCourse(
                                          course: filteredCourses[index]));
                                },
                                child: Center(
                                  child: Text(
                                    'Описание',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
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
              'Подготовительные курсы не найдены',
              style: TextStyle(fontSize: 20),
            )
          }
        ],
      );
    } else if (errorMessage == null && allCourses.isEmpty) {
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
