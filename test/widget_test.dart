// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/testing.dart';
// import 'package:mockito/annotations.dart';
// import 'package:testapp/main.dart';
// import 'package:testapp/screens/widgets.dart';
// import 'package:testapp/theme/utils.dart';
// import 'package:http/http.dart' as http;

// @GenerateMocks([http.Client])
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // });
  testWidgets('finds a specific instance', (tester) async {
    const childWidget = Padding(padding: EdgeInsets.all(30));

    // Provide the childWidget to the Container.
    await tester.pumpWidget(Container(child: childWidget));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
