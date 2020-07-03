import 'package:flutter/material.dart';

class StoryActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildCameraButton(),
        _buildInputStoryReply(),
        _buildSendButton(),
      ],
    );
  }

  _buildSendButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.send),
    );
  }

  _buildInputStoryReply() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Send Message',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Icon(Icons.more_vert)
          ],
        ),
      ),
    );
  }

  _buildCameraButton() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.camera_alt,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
