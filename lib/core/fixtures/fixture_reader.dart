import 'dart:io';

String fixture(String name) => File('res/data/$name')
.readAsStringSync();