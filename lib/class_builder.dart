import 'package:kovilhomam/profile.dart';
import 'package:kovilhomam/home.dart';
import 'package:kovilhomam/schedules.dart';
import 'package:kovilhomam/settings.dart';
import 'package:kovilhomam/notifications.dart';
import 'package:kovilhomam/stats.dart';
import 'package:kovilhomam/testimonials.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    //register<Profile>(() => Profile());
    register<Notifications>(() => Notifications());
    register<Stats>(() => Stats());
    register<Testimonials>(() => Testimonials());
    //register<Settings>(() => Settings());
  }

  static dynamic fromString(String type) {
    return _constructors[type]!();
  }
}