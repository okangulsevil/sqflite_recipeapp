import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileImageWidget({
    Key key,
    this.imagePath,
    this.isEdit = false,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: Ink.image(
                image: NetworkImage(imagePath),
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                child: InkWell(
                  onTap: onClicked,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: ClipOval(
              child: Container(
                padding: EdgeInsets.all(3.0),
                color: Colors.white,
                child: ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.blue,
                    child: Icon(
                      isEdit ? Icons.add_a_photo : Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
