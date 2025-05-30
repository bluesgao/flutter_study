import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilipala/common/constants.dart';
import 'package:pilipala/common/widgets/network_img_layer.dart';
import 'package:pilipala/utils/utils.dart';

import '../../../models/user/sub_folder.dart';

class SubItem extends StatelessWidget {
  final SubFolderItemData subFolderItem;
  final bool isOwner;
  final Function(SubFolderItemData) cancelSub;

  const SubItem({
    super.key,
    required this.subFolderItem,
    required this.isOwner,
    required this.cancelSub,
  });

  @override
  Widget build(BuildContext context) {
    String heroTag = Utils.makeHeroTag(subFolderItem.id);
    return InkWell(
      onTap: () => Get.toNamed(
        '/subDetail',
        arguments: subFolderItem,
        parameters: {
          'heroTag': heroTag,
          'seasonId': subFolderItem.id.toString(),
          'type': subFolderItem.type.toString(),
        },
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
        child: LayoutBuilder(
          builder: (context, boxConstraints) {
            double width =
                (boxConstraints.maxWidth - StyleString.cardSpace * 6) / 2;
            return SizedBox(
              height: width / StyleString.aspectRatio,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: StyleString.aspectRatio,
                    child: LayoutBuilder(
                      builder: (context, boxConstraints) {
                        double maxWidth = boxConstraints.maxWidth;
                        double maxHeight = boxConstraints.maxHeight;
                        return Hero(
                          tag: heroTag,
                          child: NetworkImgLayer(
                            src: subFolderItem.cover,
                            width: maxWidth,
                            height: maxHeight,
                          ),
                        );
                      },
                    ),
                  ),
                  VideoContent(
                    subFolderItem: subFolderItem,
                    isOwner: isOwner,
                    cancelSub: cancelSub,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class VideoContent extends StatelessWidget {
  final SubFolderItemData subFolderItem;
  final bool isOwner;
  final Function(SubFolderItemData)? cancelSub;

  const VideoContent({
    super.key,
    required this.subFolderItem,
    required this.isOwner,
    this.cancelSub,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 2, 6, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subFolderItem.title!,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '合集 UP主：${subFolderItem.upper!.name!}',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '${subFolderItem.mediaCount}个视频',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            const Spacer(),
            isOwner
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        onPressed: () => cancelSub?.call(subFolderItem),
                        icon: Icon(
                          Icons.clear_outlined,
                          color: Theme.of(context).colorScheme.outline,
                          size: 18,
                        ),
                      )
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
