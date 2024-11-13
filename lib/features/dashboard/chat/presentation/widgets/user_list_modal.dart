import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../tools/custom_text.dart';
import '../../../../login/domain/user.dart';
import '../../../profile/widgets/profile_name_photo.dart';

class UserListModal extends StatelessWidget {
  const UserListModal({
    super.key,
    required this.users,
    this.onTap,
  });

  final List<User> users;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.sp,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            title: const CustomText(
              'Crear grupo o canal',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            leading: const Icon(Icons.add),
            onTap: () {},
          ),
          const SizedBox(height: 10),
          Flexible(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: ListTile(
                    selected: true,
                    onLongPress: () {
                      // Navigator.pushNamed(context, '/profile', arguments: users[index]);
                      // Selectable tile
                    },
                    onTap: () => {
                      if (onTap != null)
                        {
                          onTap!(users[index]),
                        }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: CustomText(
                      users[index].firstName,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    // subtitle: CustomText(
                    //   RolesUtils()
                    //       .getJobPosition(users[index].jobPosition?.name ?? ''),
                    //   fontSize: 12,
                    // ),
                    leading: UserPhoto(
                      radius: 20.sp,
                      urlImage: null,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
