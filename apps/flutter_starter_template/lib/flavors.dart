import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flavors.g.dart';

enum Flavor {
  dev('development'),
  staging('staging'),
  prod('production');

  const Flavor(this.name);

  final String name;
}

@Riverpod(keepAlive: true)
class FlavorNotifier extends _$FlavorNotifier {
  @override
  Flavor build() {
    return Flavor.dev;
  }

  // ignore: use_setters_to_change_properties
  void setFlavor(Flavor flavor) {
    state = flavor;
  }
}
