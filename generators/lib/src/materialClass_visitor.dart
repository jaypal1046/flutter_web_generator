import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
class MaterialClassVisitor extends SimpleElementVisitor<void>{
  String className='';
  String route='';
  String title='';

  @override
  void visitConstructorElement(ConstructorElement element){
    final returnType=element.returnType.toString();
    className=returnType.replaceAll('*', '');
    
    for (final metadata in element.metadata) {
      final value = metadata.computeConstantValue();
      if (value != null) {
        final routeValue = value.getField('route')?.toStringValue();
        final titleValue = value.getField('title')?.toStringValue();
        if (routeValue != null) route = routeValue;
        if (titleValue != null) title = titleValue;
      }
    }
  }
}
