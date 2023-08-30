


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/application/usecase/initial.dart';
import 'package:search_repo/domain/types/repo_abstract.dart';

import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/http_client.dart';
import 'package:search_repo/infrastructure/repo/shared_preference.dart';
import 'package:search_repo/presentation/pages/list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mock_data.dart';


class MockClient extends Mock implements http.Client {}
class MockYourRepository extends Mock implements PostRepository {
  @override
  Future<RepoModel> getPosts() async {
    // ここでモックデータを返す
    const mockData = MockData.jsonMock;
    final Map<String, dynamic> data = json.decode(mockData);
    final RepoModel repo = RepoModel.fromJson(data);
    return repo;
  }
}

void main() {
  testWidgets('listが表示されるかテストします。', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    const data = MockData.jsonMock;
    final mockClient = MockClient();
    when(mockClient.getPosts())
        .thenAnswer((_) async => http.Response(data, 200));



    final client = MockClient();
    final mockRepository = MockYourRepository();
    final result = mockRepository.getPosts();
    final repo = RepoModel.fromJson(json.decode(MockData.jsonMock) as Map<String, dynamic>);

    when(mockRepository.getPosts()).thenAnswer((_) async {
      return repo;
    });
    final container = ProviderContainer();
    final notifier = container.read(repoNotifierProvider.notifier);

    /*final forgeryInitUseCase = InitAppUsecase(
      postRepositoryImpl: repoIml,
      repoProviderNotifier: notifier,
    );*/


    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // httpClientProviderを置き換える
          httpClientProvider.overrideWithValue(client),
          // repoNotifierProviderを置き換える
          sharedPreferencesProvider.overrideWithValue(
            await SharedPreferences.getInstance(),
          ),
        ],
        child: const MaterialApp(home: ListPage()),
      ),
    );

    expect(find.text('List Page'), findsOneWidget);
  });
}

