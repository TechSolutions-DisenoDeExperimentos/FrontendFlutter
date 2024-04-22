import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Image.asset('assets/logoTuCine.png', width: 30, height: 30),
              const SizedBox(width: 5),
              Text(
                'TuCine App',
                style: titleStyle,
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: colors.primary,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}