part of './part_of_learn.dart';

class _PartofAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _PartofAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('a'),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.abc_rounded))],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
