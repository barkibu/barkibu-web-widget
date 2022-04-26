import 'package:angular/angular.dart';

@Pipe('ellipsis')
class EllipsisPipe extends PipeTransform {
  String transform(String text, int cutOff) {
    if (text != null && text.isNotEmpty) {
      return (text.length <= cutOff) ? text : '${text.substring(0, cutOff)}...';
    } else {
      return '';
    }
  }
}
