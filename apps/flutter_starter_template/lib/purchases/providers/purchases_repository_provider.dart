import 'package:purchases_core/purchases_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'purchases_repository_provider.g.dart';

@Riverpod(keepAlive: true)
PurchasesRepository purchasesRepository(PurchasesRepositoryRef ref) {
  return FakePurchasesRepository();
}
