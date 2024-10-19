import 'package:daisy/app/app.dart';
import 'package:daisy/app/bootstrap.dart';
import 'package:daisy/core/config/api_options.dart';
import 'package:daisy/core/config/app_flavor.dart';

void main() {
  AppFlavor(apiOptions: ApiOption.staging());
  bootstrap(() => const App());
}
