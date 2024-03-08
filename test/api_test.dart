import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/model/function.dart';
import 'package:testapp/model/genres.dart';

void main() {
  group('check api response', () {
    checkGenreListNotNull();
    checkGenreList();
    checkGenreIdisString();
  });
}

void checkGenreListNotNull() {
  test('check genre list is not null', () async {
    GenresList genres;
    genres = await fetchGenres();
    expect(genres, isNotNull);
  });
}

void checkGenreList() {
  test('check genre list is a list', () async {
    GenresList genres;
    genres = await fetchGenres();
    expect(genres, isA<GenresList>());
  });
}

void checkGenreIdisString() {
  test('check genre id is String', () async {
    GenresList genresList;
    genresList = await fetchGenres();
    Genres firstGenre = genresList.genres![0];
    expect(firstGenre.id, isA<int>());
  });
}
