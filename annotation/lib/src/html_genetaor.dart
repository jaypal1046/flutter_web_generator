/// A class that generates HTML content for a specific route and title.
class HtmlAnnotation {
  /// The route path for the HTML content.
  final String route;
  
  /// The title of the HTML document.
  final String title;
  
  /// Creates a new [HtmlAnnotation] instance with the required route and title.
  const HtmlAnnotation({required this.route, required this.title});
}

/// Default HTML generator instance for Flutter Web3 application.
const flutterWebHtml = HtmlAnnotation(route: '/', title: 'FlutterWeb3');
