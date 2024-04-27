import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/cineclubs/cineclub_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';

class CineclubScreen extends ConsumerStatefulWidget {
  static const name = 'showtime-screen';

  final String cineclubId;

  const CineclubScreen({super.key, required this.cineclubId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<CineclubScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(cineclubInfoProvider.notifier).loadCineclub(widget.cineclubId);
  }

  @override
  Widget build(BuildContext context) {
    final Cineclub? cineclub =
        ref.watch(cineclubInfoProvider)[widget.cineclubId];

    if (cineclub == null) {
      return const Scaffold(
          body: Center(child: CircularProgressIndicator(strokeWidth: 2)));
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(cineclub: cineclub),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MovieDetails(cineclub: cineclub),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Cineclub cineclub;

  const _CustomSliverAppBar({required this.cineclub});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        title: Text(
          cineclub.name,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                cineclub.logoSrc,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) return const SizedBox();
                  return FadeIn(child: child);
                },
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1.0],
                    colors: [
                      Colors.transparent,
                      Colors.black87,
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    stops: [0.0, 0.3],
                    colors: [
                      Colors.black87,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  final Cineclub cineclub;

  const _MovieDetails({required this.cineclub});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  cineclub.logoSrc,
                  width: size.width * 0.3,
                ),
              ),

              const SizedBox(width: 10),

              //Description
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cineclub.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ).merge(textStyles.titleLarge),
                    ),
                    Text(cineclub.description),
                    Row(
                      children: [
                        const Icon(Icons.people),
                        const SizedBox(width: 5),
                        Text('${cineclub.capacity} personas'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(width: 5),
                        Text(cineclub.address),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.phone),
                        const SizedBox(width: 5),
                        Text(cineclub.phone),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time),
                        const SizedBox(width: 5),
                        Text(cineclub.openingHours),
                      ],
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
