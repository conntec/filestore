// Copyright (c) 2021 Hanoi University of Mining and Geology, Vietnam.
// All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

/// localfire library
library localfire;

import 'package:path/path.dart' as p;
import 'dart:math';

import 'src/utils/html.dart' if (dart.library.io) 'src/utils/io.dart';

part 'src/collection_ref.dart';
part 'src/collection_ref_impl.dart';
part 'src/document_ref.dart';
part 'src/document_ref_impl.dart';
part 'src/set_option.dart';
part 'src/localfire_base.dart';
part 'src/localfire_impl.dart';
