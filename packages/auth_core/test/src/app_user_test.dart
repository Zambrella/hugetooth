import 'package:auth_core/src/app_user.dart';
import 'package:auth_core/src/auth_method.dart';
import 'package:test/test.dart';

void main() {
  group('AppUser', () {
    test('can be instantiated', () {
      const user = AppUser(
        id: '123',
        authMethod: AuthMethod.google,
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'http://example.com/photo.jpg',
      );

      expect(user.id, '123');
      expect(user.authMethod, AuthMethod.google);
      expect(user.email, 'test@example.com');
      expect(user.name, 'Test User');
      expect(user.photoUrl, 'http://example.com/photo.jpg');
    });

    test('supports value equality', () {
      const user1 = AppUser(
        id: '123',
        authMethod: AuthMethod.google,
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'http://example.com/photo.jpg',
      );

      const user2 = AppUser(
        id: '123',
        authMethod: AuthMethod.google,
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'http://example.com/photo.jpg',
      );

      expect(user1, equals(user2));
    });

    test('can be serialized to JSON', () {
      const user = AppUser(
        id: '123',
        authMethod: AuthMethod.google,
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'http://example.com/photo.jpg',
      );

      final json = user.toJson();
      expect(json, {
        'id': '123',
        'authMethod': 'google',
        'email': 'test@example.com',
        'name': 'Test User',
        'photoUrl': 'http://example.com/photo.jpg',
      });
    });

    test('can be deserialized from JSON', () {
      final json = {
        'id': '123',
        'authMethod': 'google',
        'email': 'test@example.com',
        'name': 'Test User',
        'photoUrl': 'http://example.com/photo.jpg',
      };

      final user = AppUser.fromJson(json);
      expect(user.id, '123');
      expect(user.authMethod, AuthMethod.google);
      expect(user.email, 'test@example.com');
      expect(user.name, 'Test User');
      expect(user.photoUrl, 'http://example.com/photo.jpg');
    });
  });
}
