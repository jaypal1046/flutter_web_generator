
import 'package:annotation/annotation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Test cases for HtmlGenerator class
  test('HtmlGenerator test cases', () {
    // Create a custom HtmlGenerator instance
    const htmlGenerator = HtmlGenerator(route: '/test', title: 'Test Page');
    expect(htmlGenerator.route, '/test');
    expect(htmlGenerator.title, 'Test Page');

    // Test default generator instance
    const defaultGenerator = flutterWebHtml;
    expect(defaultGenerator.route, '/');
    expect(defaultGenerator.title, 'FlutterWeb3');
  });
}
