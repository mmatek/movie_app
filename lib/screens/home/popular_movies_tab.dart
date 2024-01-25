import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import 'providers/movie_genre_provider.dart';
import 'providers/movie_pagination_provider.dart';
import 'providers/movie_provider.dart';
import 'widgets/movie_list_tile.dart';

class PopularMoviesTab extends ConsumerWidget {
  const PopularMoviesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listMovies = ref.watch(movieStateProvider);
    final listGenres = ref.watch(genreListProvider);

    return Scaffold(
      backgroundColor: AppColors.secondaryDarkBlue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'film-icon',
                child: SvgPicture.asset(
                  AppAssets.kFIcon,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor, BlendMode.srcOut),
                  height: 44.h,
                  width: 32.w,
                ),
              ),
              SizedBox(height: 12.h),
              const Text(
                'Popular',
                style: AppTextStyles.title,
              ),
              SizedBox(height: 20.h),
              // List of movies
              listMovies.when(
                data: (movieListData) => Expanded(
                  child: ListView.builder(
                    itemCount: movieListData.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        MovieListTile(
                          movie: movieListData[index],
                          listGenres: listGenres,
                        ),
                        if (index == movieListData.length - 1)
                          GestureDetector(
                            onTap: () => loadMore(ref),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: const Text(
                                'Load more',
                                style: AppTextStyles.subtitle,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                error: (error, stackTrace) => Text('Error occurred: $error'),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadMore(WidgetRef ref) {
    ref.read(currentPageProvider.notifier).state++;
    ref.read(movieStateProvider.notifier).getMovies();
  }
}
