
// import 'package:analyzer/dart/element/element.dart';
// import 'package:build/src/builder/build_step.dart';
// import 'package:generators/src/materialClass_visitor.dart';
// import 'package:html_generator/annotation.dart';
// import 'package:source_gen/source_gen.dart';

// class HtmlGenerators extends GeneratorForAnnotation<HtmlAnnotation>{
//   @override
// String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep,) {
//   final visitor = MaterialClassVisitor();
//   element.visitChildren(visitor);
//   String className = visitor.className;
//   final buffer = StringBuffer();
//   buffer.writeln('<!DOCTYPE html>');
//   buffer.writeln('<html>');
//   buffer.writeln('<head>');

//   buffer.writeln('''
// <!--
//   If you are serving your web app in a path other than the root, change the
//   href value below to reflect the base path you are serving from.

//   The path provided below has to start and end with a slash "/" in order for
//   it to work correctly.

//   For more details:
//   * https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base

//   This is a placeholder for base href that will be replaced by the value of
//   the `--base-href` argument provided to `flutter build`.
// -->
// ''');
//  buffer.writeln('<base href="\$FLUTTER_BASE_HREF">');
//  buffer.writeln('<meta charset="UTF-8">');
//  buffer.writeln('<meta content="IE=Edge" http-equiv="X-UA-Compatible">');
//  buffer.writeln('<meta name="description" content="A new Flutter project.">');
//  buffer.writeln('  ');
//  buffer.writeln('<!-- iOS meta tags & icons -->');
//  buffer.writeln('<meta name="apple-mobile-web-app-capable" content="yes">');
//  buffer.writeln('<meta name="apple-mobile-web-app-status-bar-style" content="black">');
//  buffer.writeln('<meta name="apple-mobile-web-app-title" content="example">');
//  buffer.writeln('<link rel="apple-touch-icon" href="icons/Icon-192.png">');
//   buffer.writeln('  ');
//   buffer.writeln('<!-- Favicon -->');
//   buffer.writeln('<link rel="icon" type="image/png" href="favicon.png"/>');
//   buffer.writeln('  ');
//   buffer.writeln('<title>$className</title>');
//   buffer.writeln(' <link rel="manifest" href="manifest.json">');


//   buffer.writeln('</head>');
//   buffer.writeln('</body>');
//   buffer.writeln('</body>');

//   buffer.writeln('<script src="flutter_bootstrap.js" async></script>');


//   buffer.writeln('</html>');

//   return buffer.toString();
// }
// }

import 'dart:io';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:html_generator/annotation.dart';

import 'materialClass_visitor.dart';

class HtmlGenerators extends GeneratorForAnnotation<HtmlAnnotation> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    
    // Visit the annotated element to retrieve the class name.
    final visitor = MaterialClassVisitor();
    element.visitChildren(visitor);
    String className = visitor.className;

    // Create the HTML content
    final htmlContent = '''
<!DOCTYPE html>
<html>
<head>
  <base href="\$FLUTTER_BASE_HREF">
  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="description" content="A new Flutter project.">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="example">
  <link rel="apple-touch-icon" href="icons/Icon-192.png">
  <link rel="icon" type="image/png" href="favicon.png"/>
  <title>$className</title>
  <link rel="manifest" href="manifest.json">
</head>
<body>
  <div id="app"></div>
  <script src="flutter_bootstrap.js" async></script>
</body>
</html>
    ''';

    // Define the path for the output file in the /web directory
    final outputPath = 'web/$className.html';

    // Write the HTML content to the file
    File(outputPath).writeAsStringSync(htmlContent);

    // Return an empty string since we are writing to a file and not generating Dart code.
    return '';
  }
}
