import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isolate_cv_example/bloc/book_bloc/book_bloc.dart';
import 'package:isolate_cv_example/bloc/book_bloc/book_event.dart';
import 'package:isolate_cv_example/bloc/book_bloc/book_state.dart';
import 'package:isolate_cv_example/data/model/book_model.dart';
import 'package:isolate_cv_example/data/model/category_model.dart';
import 'package:isolate_cv_example/screens/book/widgets/book_widget.dart';
import 'package:isolate_cv_example/screens/book/widgets/wrap_item.dart';
import 'package:open_filex/open_filex.dart';
import '../../data/local/local_variables.dart';
import '../../services/book_manager_services.dart';
import '../../utils/app_colors/app_colors.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  String categoryString = "all";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_F9F9F9,
      body: SingleChildScrollView(
        child: BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            debugPrint("CURRENT MB: ${state.progress}");
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 29.w),
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.c_6B6B6B,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 29.w, vertical: 5.h),
                  child: Text(
                    "The World of books",
                    style: TextStyle(
                      color: AppColors.c_263238,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 22.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: TextField(
                    style: TextStyle(
                      color: AppColors.c_979797,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textInputAction: TextInputAction.next,
                    onChanged: (v) {
                      context
                          .read<BookBloc>()
                          .add(SearchBooksEvent(searchBooks: books, value: v));
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Icon(
                          Icons.search,
                          color: AppColors.c_29BB89,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 14.h),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: AppColors.c_979797,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.white,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.white,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.white,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  height: 242,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(height: 29.h),
                      ...List.generate(
                        state.searchBooks.length,
                        (index) {
                          BookBloc fileManagerBloc = BookBloc();
                          return Container(
                            margin: EdgeInsets.only(right: 20.w),
                            width: 150.w,
                            child: BookItem(
                              newFileLocation: state.newFileLocation,
                              image: context
                                  .read<BookBloc>()
                                  .state
                                  .searchBooks[index]
                                  .imagePath,
                              bookName: context
                                  .read<BookBloc>()
                                  .state
                                  .searchBooks[index]
                                  .bookName,
                              onTap: () async {
                                if (state.newFileLocation.isEmpty) {
                                  fileManagerBloc.add(
                                    DownLoadEvent(
                                      bookModel: context
                                          .read<BookBloc>()
                                          .state
                                          .searchBooks[index],
                                    ),
                                  );
                                } else {
                                  await OpenFilex.open(state.newFileLocation);
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 29.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 33.w),
                  child: Text(
                    "Category",
                    style: TextStyle(
                      color: AppColors.c_263238,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 11.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.h),
                  child: Wrap(
                    spacing: 11,
                    children: [
                      ...List.generate(
                        CategoryModel.values.length,
                        (index) => WrapItem(
                          title: CategoryModel.values[index].name,
                          onTap: () {
                            context.read<BookBloc>().add(
                                  CategoryBooksEvent(
                                    categoryModel: CategoryModel.values[index],
                                    books: books,
                                  ),
                                );
                            categoryString = CategoryModel.values[index].name;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 29.w),
                  child: Text(
                    "$categoryString books",
                    style: TextStyle(
                      color: AppColors.c_263238,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Visibility(
                  visible: state.progress != 0,
                  child: LinearProgressIndicator(
                    value: state.progress,
                    backgroundColor: Colors.grey,
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(25),
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 15.w,
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      children: [
                        ...List.generate(
                          context.read<BookBloc>().state.books.length,
                          (index) {
                            BookModel fileDataModel =
                                context.read<BookBloc>().state.books[index];

                            BookBloc fileManagerBloc = BookBloc();

                            return BlocProvider.value(
                              value: fileManagerBloc,
                              child: BlocBuilder<BookBloc, BookState>(
                                builder: (context, state) {
                                  debugPrint("CURRENT MB: ${state.progress}");
                                  String filePath = FileManagerService.isExist(
                                    fileDataModel.bookUrl,
                                    fileDataModel.bookName,
                                  );
                                  return BookItem(
                                    newFileLocation: filePath,
                                    image: fileDataModel.imagePath,
                                    bookName: fileDataModel.bookName,
                                    onTap: () async {
                                      if (filePath.isNotEmpty) {
                                        await OpenFilex.open(filePath);
                                      } else {
                                        fileManagerBloc.add(
                                          DownLoadEvent(
                                            bookModel: fileDataModel,
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
