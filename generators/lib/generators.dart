// library generators;


import 'package:build/build.dart';
import 'package:generators/src/html_generators.dart';
import 'package:source_gen/source_gen.dart';

Builder generateHtmlfile(BuilderOptions builderOptions) =>SharedPartBuilder([HtmlGenerators()], '_');