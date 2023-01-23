import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final String imageUrl = "https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cached Images"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://imgcc-a.akamaihd.net/offers/432171/636731231620597426.jpg?width=1024&height=614&anchor=middlecenter&cropxunits=100&cropyunits=100&mode=crop&crop=(0.0,4.39189,100.0,93.6776)&scale=both',
              imageBuilder: (context, imageProvider) => Container(
                width: 500,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                    /* colorFilter: const ColorFilter.mode(
                      Colors.red,
                      BlendMode.hue,
                    ) */
                  ),
                  // shape: BoxShape.circle,
                  // border: Border.all(color: Colors.blue),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              height: 100,
            ),
            CachedNetworkImage(
              width: 500,
              height: 200,
              imageUrl:
                  imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  print("OK");
                  CachedNetworkImage.evictFromCache(
                      imageUrl);
                },
                child: const Text('Remove Cached Images')),
          ],
        ),
      ),
    );
  }
}
