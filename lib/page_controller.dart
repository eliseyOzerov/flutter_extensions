import 'package:flutter/widgets.dart';

extension PageControllerExtension on PageController {
  bool isPageSelected(int index) {
    if (hasClients && page != null) {
      return page! >= index - 0.5 && page! < index + 0.5;
    }
    return initialPage == index;
  }

  int selectedPage(List items) {
    for (int i = 0; i < items.length; i++) {
      if (isPageSelected(i)) {
        return i;
      }
    }
    return 0;
  }
}
