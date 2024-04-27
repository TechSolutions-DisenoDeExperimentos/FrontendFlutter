import 'package:animate_do/animate_do.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CineclubHorizontalListview extends StatefulWidget {
  //Los cineclubs que quiere mostrar
  final List<Cineclub> cineclubs;
  final String? name;
  final String? subtitle;
  final VoidCallback? loadNextPage; //Scroll infinitamente

  const CineclubHorizontalListview({
    super.key,
    required this.cineclubs,
    this.name,
    this.subtitle,
    this.loadNextPage,
  });

  @override
  State<CineclubHorizontalListview> createState() =>
      _CineclubHorizontalListviewState();
}

class _CineclubHorizontalListviewState
    extends State<CineclubHorizontalListview> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  //ParA destruir el listener
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 210,
        child: Column(
          children: [
            //Title
            if (widget.name != null || widget.subtitle != null)
              _Title(title: widget.name, subtitle: widget.subtitle),

            const SizedBox(height: 10), //Padding entre el titulo y el slider

            //Listview
            Expanded(
              child: ListView.builder(
                controller: scrollController, //Para el scroll infinito
                scrollDirection: Axis.horizontal,
                itemCount: widget.cineclubs.length,
                physics:
                    const BouncingScrollPhysics(), //Anddroid y IOS se comporten igual
                itemBuilder: (context, index) {
                  //return _Slide(movie: widget.movies[index]);
                  return FadeInRight(
                      child: _Slide(cineclub: widget.cineclubs[index]));
                },
              ),
            )
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final Cineclub cineclub;

  const _Slide({required this.cineclub});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Imagen
          SizedBox(
              width: 130,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  cineclub.logoSrc,
                  fit: BoxFit.cover, //Todas las imágenes del mismo tamaño
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
                    return GestureDetector(
                      onTap: () => context.push('/cineclub/${cineclub.id}'),
                      child: FadeIn(child: child),
                    );
                  },
                ),
              )),

          const SizedBox(height: 5),

          //Titulo
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

          //Location
          Row(
            children: [
              const Icon(Icons.location_pin, color: Colors.black, size: 15),
              const SizedBox(width: 3),
              Text(cineclub.address,
                  style: const TextStyle(fontSize: 10, color: Colors.black)),
            ],
          )
        ]));
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
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final subtitleStyle = Theme.of(context).textTheme.titleSmall;

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
                  style:
                      const ButtonStyle(visualDensity: VisualDensity.compact),
                  onPressed: () {},
                  child: Text(
                    subtitle!,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF19F35),
                    ).merge(subtitleStyle),
                  )),
          ],
        ));
  }
}
