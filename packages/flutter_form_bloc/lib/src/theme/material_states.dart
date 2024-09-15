import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/src/utils/to_string.dart';

class SimpleWidgetStateProperty<T> extends Equatable
    implements WidgetStateProperty<T> {
  final T normal;
  final T disabled;

  const SimpleWidgetStateProperty({
    required this.normal,
    required this.disabled,
  });

  @override
  T resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) return disabled;
    return normal;
  }

  @override
  List<Object?> get props => [normal, disabled];

  @override
  String toString() {
    return (ToString(runtimeType)
          ..add('normal', normal)
          ..add('disabled', disabled))
        .toString();
  }
}
