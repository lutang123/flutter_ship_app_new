import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum Flavor { dev, stg, prod }

/// Global function to return the current flavor
/// Always returns Flavor.prod on Flutter web (--flavor is not supported on web)
Flavor getFlavor() {
  if (kIsWeb) {
    return Flavor.prod;
  }
  return switch (appFlavor) {
    'prod' => Flavor.prod,
    'stg' => Flavor.stg,
    'dev' => Flavor.dev,
    null => Flavor.dev, // * if not specified, default to dev
    _ => throw UnsupportedError('Invalid flavor: $appFlavor'),
  };
}