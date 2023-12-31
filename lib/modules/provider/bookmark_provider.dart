import 'package:flutter/foundation.dart';
import 'package:gov_services_app/modules/model/bookmark_model.dart';

class BookmarkProvider extends ChangeNotifier {
  List<Bookmark> bookmarks = [];

  void addBookmark(String title, String url) {
    bookmarks.add(Bookmark(title: title, url: url));
    notifyListeners();
  }
}
