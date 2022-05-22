import 'package:core/core.dart';
import 'package:domain/domain.dart';

class CoursesState extends Equatable {
  final String searchText;
  final List<Course> allCourses;
  final List<Course> filteredCourses;
  final String? errorMessage;

  static const List<Course> _EMPTY_LIST = <Course>[];

  const CoursesState({
    this.searchText = '',
    this.allCourses = _EMPTY_LIST,
    this.filteredCourses = _EMPTY_LIST,
    this.errorMessage,
  });

  CoursesState copyWith({
    String? searchText,
    List<Course>? allCourses,
    List<Course>? filteredCourses,
    String? errorMessage,
  }) {
    return CoursesState(
      searchText: searchText ?? this.searchText,
      allCourses: allCourses ?? this.allCourses,
      filteredCourses: filteredCourses ?? this.filteredCourses,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        searchText,
        allCourses,
        filteredCourses,
        errorMessage,
      ];
}
