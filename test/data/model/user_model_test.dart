import 'package:flutter_test/flutter_test.dart';
import 'package:simple_feed/app.dart';

import '../data/user_data.dart';

main() {
  test("UserModel parsing from json has no errors", () {
    expect(() => UserModel.fromJson(userJson), returnsNormally);
  });
  test("UserModel data is parsed from json and to json correctly", () {
    var user = UserModel.fromJson(userJson);
    expect(user.toJson(), userJson);
  });

  test("UserModel parsing from json has no errors (Null Check)", () {
    expect(() => UserModel.fromJson({}), returnsNormally);
  });
}
