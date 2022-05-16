import 'package:core/core.dart';
import 'package:domain/domain.dart';

class SchoolsState extends Equatable {
  final String searchText;
  final List<School> allSchools;
  final List<School> filteredSchools;
  final String? errorMessage;

  static const List<School> _EMPTY_LIST = <School>[];

  SchoolsState({
    this.searchText = '',
    this.allSchools = _EMPTY_LIST,
    this.filteredSchools = _EMPTY_LIST,
    this.errorMessage,
  });

  SchoolsState copyWith({
    String? searchText,
    List<School>? allSchools,
    List<School>? filteredSchools,
    String? errorMessage,
  }) {
    return SchoolsState(
      searchText: searchText ?? this.searchText,
      allSchools: allSchools ?? this.allSchools,
      filteredSchools: filteredSchools ?? this.filteredSchools,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        searchText,
        allSchools,
        filteredSchools,
        errorMessage,
      ];
}
