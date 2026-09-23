import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';

class DeepLinkService {
  final AppLinks _appLinks = AppLinks();

  StreamSubscription<Uri>? _subscription;

  Future<void> initialize({required void Function(Uri uri) onLink}) async {
    // App was completely closed.
    final initialUri = await _appLinks.getInitialLink();

    if (initialUri != null) {
      debugPrint('Initial deep link: $initialUri');

      onLink(initialUri);
    }

    // App is already running/background.
    _subscription = _appLinks.uriLinkStream.listen(
      (uri) {
        debugPrint('Incoming deep link: $uri');

        onLink(uri);
      },
      onError: (error) {
        debugPrint('Deep link error: $error');
      },
    );
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
  }
}
