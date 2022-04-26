@JS('analytics')
library segment;

import 'package:js/js.dart';

external void load(String writeKey);
external void page(String pageName);
external void track(String eventName, [dynamic properties]);
external void identify(String userId, dynamic properties);
