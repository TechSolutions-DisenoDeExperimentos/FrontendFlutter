import 'package:animate_do/animate_do.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';
import 'package:flutter/material.dart';

class CineclubListviewMovie extends StatefulWidget {
  final List<Cineclub> cineclubs;
  final String? name;
  final String? subtitle;
  final String? movieId;
  final VoidCallback? loadNextPage;
  final Function(String) onTapCineclub;

  const CineclubListviewMovie({
    super.key,
    required this.cineclubs,
    this.name,
    this.subtitle,
    this.loadNextPage,
    this.movieId,
    required this.onTapCineclub,
  });

  @override
  State<CineclubListviewMovie> createState() => _CineclubListviewMovieState();
}

class _CineclubListviewMovieState extends State<CineclubListviewMovie> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
        children: [
          if (widget.name != null || widget.subtitle != null)
            _Title(title: widget.name, subtitle: widget.subtitle),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.cineclubs.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return FadeInRight(
                  child: _Slide(
                    cineclub: widget.cineclubs[index],
                    onTap: widget.onTapCineclub,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Cineclub cineclub;
  final Function(String) onTap;

  const _Slide({required this.cineclub, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(cineclub.id.toString());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeIn(
                  child: Image.network(
                    cineclub.logoSrc,
                    fit: BoxFit.cover,
                    width: 130,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                      }
                      return child;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 130,
              child: Text(
                cineclub.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                const Icon(Icons.location_pin, color: Colors.black, size: 15),
                const SizedBox(width: 3),
                Text(cineclub.address, style: const TextStyle(fontSize: 10, color: Colors.black)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );

    return Container(
        padding: const EdgeInsets.only(
            top: 10), //Padding entre el titulo y el slider
        margin: const EdgeInsets.symmetric(
            horizontal: 10), //Para que el texto no quede pegado a los bordes
        child: Row(
          children: [
            if (title != null) Text(title!, style: titleStyle),
            const Spacer(),
            if (subtitle != null)
              FilledButton.tonal(
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text(subtitle!,
                    style: titleStyle.copyWith(
                        fontSize: 12, color: const Color(0xffF19F35))),
              )
          ],
        ));
  }
}
