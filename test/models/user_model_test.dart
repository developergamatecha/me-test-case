import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_case/models/user_model.dart';

import '../dummy_data/dummy_object.dart';

void main() {
  test('should return a valid model from JSON', () async {
    // Arrange
    final jsonMap = tUserJson;
    // Act
    final result = UserModel.fromJson(jsonMap);
    // Assert
    expect(result, tUserModel);
  });

  test('should return a JSON containing proper data', () async {
    // Act
    final result = tUserModel.toJson();
    // Assert
    expect(result, tUserJson);
  });
}
