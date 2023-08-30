


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/state/repo.dart';
import 'package:search_repo/application/usecase/initial.dart';

import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/infrastructure/repo/http_client.dart';
import 'package:search_repo/infrastructure/repo/shared_preference.dart';
import 'package:search_repo/presentation/pages/list_page.dart';
import 'package:search_repo/presentation/router/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mock_data.dart';





class MockHttpServer extends Mock implements RepoModel {}
void main() {

  testWidgets('listが表示されるかテストします。', (WidgetTester tester) async {

    var server = MockHttpServer();
    var uri = Uri.parse('http://localhost:8080');
    when(RepoModel.fromJson(server as Map<String, dynamic>)).thenReturn(uri);
    SharedPreferences.setMockInitialValues({});
    const data = MockData.jsonMock;
    final mockClient = MockClient((request) {});
    repoNotifierProvider.client = MockClient((request) {});
    when(mockClient.get(any as Uri))
        .thenAnswer((_) async => http.Response(data, 200));
    await tester.pumpWidget(
      ProviderScope(overrides: [
        //mock clientでDI
        httpClientProvider.overrideWithValue(mockClient),
        //sharedPreferencesを初回で上書き
        sharedPreferencesProvider.overrideWithValue(
          await SharedPreferences.getInstance(),
        ),
      ], child: const App()),
    );

    expect(find.text('List Page'), findsOneWidget);
  });
}

