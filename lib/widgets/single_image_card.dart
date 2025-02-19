import 'package:flutter/material.dart';

class SingleImageCard extends StatefulWidget {
  final String imageurl;
  const SingleImageCard({required this.imageurl, super.key});

  @override
  State<SingleImageCard> createState() => _SingleImageCardState();
}

class _SingleImageCardState extends State<SingleImageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 2,
            offset: const Offset(2, 2),
          ),
        ],
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            widget.imageurl,
          )),
    );
  }
}
