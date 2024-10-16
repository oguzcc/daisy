import 'package:daisy/core/manager/remote/dio_client.dart';
import 'package:daisy/core/model/typedefs.dart';

abstract class I{{name.pascalCase()}}Repo {
  AsyncResMap method();
}

class {{name.pascalCase()}}Repo implements I{{name.pascalCase()}}Repo {
  {{name.pascalCase()}}Repo(this.dioClient);
  final DioClient dioClient;

  @override
  AsyncResMap method() async =>
      await dioClient.get({{name.pascalCase()}}Path.method.path);

}
