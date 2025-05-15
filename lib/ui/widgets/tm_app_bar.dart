import 'package:flutter/material.dart';
import 'package:task_management/ui/controllers/auth_controller.dart';
import 'package:task_management/ui/screens/login_screen.dart';
import 'package:task_management/ui/screens/update_profile_screen.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
    this.fromProfileScreen,
  });

  final bool? fromProfileScreen;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: Colors.deepOrange,
      title: GestureDetector(
        onTap: () {
          if (fromProfileScreen ?? false) {
            return;
          }
          _onTapProfileSection(context);
        },
        child: Row(
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
                  Text(AuthController.userModel?.fullName ?? 'Unknown',
                      style: textTheme.bodyLarge?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                  const SizedBox(),
                  Text(
                    AuthController.userModel?.mobile ?? 'Unknown',
                    style: textTheme.bodySmall?.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () => _onTapLogOutButton(context),
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }

  void _onTapProfileSection(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UpdateProfileScreen(),
      ),
    );
  }

  Future<void> _onTapLogOutButton(BuildContext context) async {
    await AuthController.clearUserData();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (predicate) => false);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
