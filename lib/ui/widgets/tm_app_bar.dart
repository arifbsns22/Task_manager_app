import 'package:flutter/material.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: Colors.deepOrange,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 16,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rahim Hasan',
                    style: textTheme.bodyLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600)),
                const SizedBox(),
                Text('rahim@gmail.com',
                    style: textTheme.bodySmall?.copyWith(color: Colors.white))
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
