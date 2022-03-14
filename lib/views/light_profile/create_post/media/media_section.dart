import 'dart:io';

import 'package:flutter/material.dart';
import 'package:profile/bloc/home_bloc/home_bloc.dart';
import 'package:profile/views/light_profile/widgets/custom_grid_view.dart';
import 'package:provider/src/provider.dart';

class MediaSection extends StatelessWidget {
  final List media;
  final Function setImages;

  const MediaSection({
    Key key,
    this.media,
    this.setImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.read<HomeBloc>().postMedia,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CustomGridView(
              columnsCount: 4,
              horizontalPadding: 2,
              verticalPadding: 2,
              children: [
                for (int i = 0; i < snapshot.data.length; i++)
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(snapshot.data[i].path),
                            width: 300,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              snapshot.data.remove(snapshot.data[i]);
                              context.read<HomeBloc>().modifyMedia =
                                  snapshot.data;
                            },
                            child: const Icon(
                              Icons.cancel,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ],
            );
          }
          return Container();
        });
  }
}
