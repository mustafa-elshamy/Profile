import 'package:flutter/material.dart';
import 'package:profile/views/light_profile/home/post.dart';
import 'package:profile/views/light_profile/widgets/custom_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomGridView(
      horizontalPadding: 10,
      horizontalAlignment: MainAxisAlignment.center,
      children: [
        /// this is dummy data
        const Post(
          text: "1 photo(s) "
              "hkdjfhdkljfhadkjfhkdjfhdksjfhdkjfhkdjfhkdjfhksjfhkdsjfaskdf"
              "hkdjfhdkljfhadkjfhkdjfhdksjfhdkjfhkdjfhkdjfhksjfhkdsjfaskdf"
              "hkdjfhdkljfhadkjfhkdjfhdksjfhdkjfhkdjfhkdjfhksjfhkdsjfaskdf"
              "hkdjfhdkljfhadkjfhkdjfhdksjfhdkjfhkdjfhkdjfhksjfhkdsjfaskdf",
          images: [
            "https://cdn.vox-cdn.com/thumbor/iKqbD98GVm9t-VgiKdSjA2oHomE=/0x0:2439x1625/920x613/filters:focal(1025x618:1415x1008):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69123675/5.0.png",
          ],
          likesNumber: "10K",
          commentsNumber: "200",
        ),
        for (int i = 2; i < 5; i++)
          Post(
            text: "$i photo(s) ",
            images: [
              for (int j = 1; j <= i; j++)
                "https://cdn.vox-cdn.com/thumbor/iKqbD98GVm9t-VgiKdSjA2oHomE=/0x0:2439x1625/920x613/filters:focal(1025x618:1415x1008):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69123675/5.0.png",
            ],
            likesNumber: "10K",
            commentsNumber: "200",
          ),
        const Post(
          images: [
            "https://cdn.vox-cdn.com/thumbor/iKqbD98GVm9t-VgiKdSjA2oHomE=/0x0:2439x1625/920x613/filters:focal(1025x618:1415x1008):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69123675/5.0.png",
            "https://cdn.vox-cdn.com/thumbor/iKqbD98GVm9t-VgiKdSjA2oHomE=/0x0:2439x1625/920x613/filters:focal(1025x618:1415x1008):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69123675/5.0.png",
            "https://cdn.vox-cdn.com/thumbor/iKqbD98GVm9t-VgiKdSjA2oHomE=/0x0:2439x1625/920x613/filters:focal(1025x618:1415x1008):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69123675/5.0.png",
            "https://cdn.vox-cdn.com/thumbor/iKqbD98GVm9t-VgiKdSjA2oHomE=/0x0:2439x1625/920x613/filters:focal(1025x618:1415x1008):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69123675/5.0.png",
            "https://cdn.vox-cdn.com/thumbor/iKqbD98GVm9t-VgiKdSjA2oHomE=/0x0:2439x1625/920x613/filters:focal(1025x618:1415x1008):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69123675/5.0.png",
            "https://cdn.vox-cdn.com/thumbor/iKqbD98GVm9t-VgiKdSjA2oHomE=/0x0:2439x1625/920x613/filters:focal(1025x618:1415x1008):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69123675/5.0.png",
            "https://cdn.vox-cdn.com/thumbor/iKqbD98GVm9t-VgiKdSjA2oHomE=/0x0:2439x1625/920x613/filters:focal(1025x618:1415x1008):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69123675/5.0.png",
            "https://cdn.vox-cdn.com/thumbor/iKqbD98GVm9t-VgiKdSjA2oHomE=/0x0:2439x1625/920x613/filters:focal(1025x618:1415x1008):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69123675/5.0.png",
            "https://cdn.vox-cdn.com/thumbor/iKqbD98GVm9t-VgiKdSjA2oHomE=/0x0:2439x1625/920x613/filters:focal(1025x618:1415x1008):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69123675/5.0.png",
          ],
          likesNumber: "10K",
          commentsNumber: "200",
        ),
      ],
    );
  }
}
