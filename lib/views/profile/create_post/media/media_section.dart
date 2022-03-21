import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';

import 'package:profile/bloc/home_bloc/home_bloc.dart';
import 'package:profile/views/profile/create_post/media/video_media.dart';
import 'package:profile/views/profile/widgets/custom_grid_view.dart';
import 'package:provider/src/provider.dart';

class MediaSection extends StatelessWidget {
  final Function setMedia;

  const MediaSection({
    Key key,
    this.setMedia,
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
                          child: lookupMimeType(snapshot.data[i].path)
                                      .split('/')
                                      .first ==
                                  'image'
                              ? Image.file(
                                  File(snapshot.data[i].path),
                                  width: 300,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : VideoMedia(
                                  width: 300,
                                  height: 100,
                                  videoPath: snapshot.data[i],
                                ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              context.read<HomeBloc>().deleteMedia = i;
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
