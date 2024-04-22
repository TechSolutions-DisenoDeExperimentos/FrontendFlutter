import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_cine_app/domain/entities/movie.dart';

class MoviesHorizontalListview extends StatefulWidget {
  //Los cineclubs que quiere mostrar
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage; //Scroll infinitamente

  const MoviesHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subtitle,
    this.loadNextPage,
  });

  @override
  State<MoviesHorizontalListview> createState() => _MoviesHorizontalListviewState();
}

class _MoviesHorizontalListviewState extends State<MoviesHorizontalListview> {

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

  //ParA destruir el listener
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 330,
        child: Column(
          children: [
            //Title
            if (widget.title != null || widget.subtitle != null)
              _Title(title: widget.title, subtitle: widget.subtitle),

            const SizedBox(height: 10),

            //Listview
            Expanded(
              child: ListView.builder(
                controller: scrollController, //Para el scroll infinito
                itemCount: widget.movies.length,
                scrollDirection: Axis.horizontal,
                physics:
                    const BouncingScrollPhysics(), //Anddroid y IOS se comporten igual
                itemBuilder: (context, index) {
                  //return _Slide(movie: widget.movies[index]);
                  return FadeInRight(child: _Slide(movie: widget.movies[index]));
                },
              ),
            )
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [

          //Imagen
          SizedBox(
              width: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
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

                      onTap: () => context.push('/movie/${movie.id}'),
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
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textStyle.titleSmall,
              
            ),
          ),

          //Location

        ])
        
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
    final titleStyle = Theme.of(context).textTheme.titleLarge;

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
                    style: titleStyle?.copyWith(
                        fontSize: 12, color: const Color(0xffF19F35))),
              )
          ],
        ));
  }
}
