import 'package:daisy/core/types/data_exception.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

typedef AsyncRes<T> = Future<Either<Err, T>>;

typedef AsyncResList<T> = Future<Either<Err, List<T>>>;

typedef AsyncResMap = Future<Response<Map<String, dynamic>>>;

typedef AsyncResDyn = Future<Response<dynamic>>;

typedef NullableStringValueSetter = String? Function(String?)?;
