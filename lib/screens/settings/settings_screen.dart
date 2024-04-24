import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isolate_cv_example/bloc/book_bloc/book_bloc.dart';
import 'package:isolate_cv_example/bloc/book_bloc/book_event.dart';
import 'package:isolate_cv_example/bloc/book_bloc/book_state.dart';
import 'package:isolate_cv_example/data/model/book_model.dart';
import 'package:isolate_cv_example/utils/app_colors/app_colors.dart';
import 'package:open_filex/open_filex.dart';

import '../../services/book_manager_services.dart';

class FileManagerScreen extends StatelessWidget {
  const FileManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          "My projects",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(),
    );
  }
}
