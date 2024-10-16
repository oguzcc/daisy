import 'package:daisy/core/model/data_exception.dart';
import 'package:daisy/core/model/typedefs.dart';
import 'package:daisy/data/repo/{{name.snakeCase()}}_repo.dart';
import 'package:fpdart/fpdart.dart';

abstract class IAuthService {
  AsyncRes<{{name.pascalCase()}}Model> method();
}

class {{name.pascalCase()}}Service implements I{{name.pascalCase()}}Service {
  {{name.pascalCase()}}Service(this.{{name.camelCase()}}Repo);
  final I{{name.pascalCase()}}Repo {{name.camelCase()}}Repo;

  @override
  AsyncRes<{{name.pascalCase()}}Model> method() async {
    try {
      final json = {{name.camelCase()}}Repo.method();
      return right({{name.pascalCase()}}Model.fromJson(json.data!));
    } catch (e) {
      return left(Err(e));
    }
  }
}
