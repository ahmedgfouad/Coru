import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class DefaultSearchBar extends StatefulWidget {
  final Function(String)? onChanged;
  const DefaultSearchBar({super.key, this.onChanged});

  @override
  State<DefaultSearchBar> createState() => _DefaultSearchBarState();
}

class _DefaultSearchBarState extends State<DefaultSearchBar> {
  bool isSearch = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).colorScheme.primary,
      ),
      duration: const Duration(milliseconds: 700),
      width: isSearch
          ? MediaQueryHelper.width * .95
          : MediaQueryHelper.width * .11,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomIconButton(
            iconImage: AppImages.search,
            onPressed: () {
              setState(() {
                isSearch = !isSearch;
              });
            },
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 700),
            firstChild: AnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              opacity: isSearch ? 1 : 0,
              child: SizedBox(
                width: MediaQueryHelper.width * .8,
                child: TextFormField(
                    cursorColor: Theme.of(context).colorScheme.primary,
                    decoration: const InputDecoration(
                      hintText: 'Find a course...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    onChanged: widget.onChanged),
              ),
            ),
            secondChild: Container(),
            crossFadeState:
                isSearch ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          )
        ],
      ),
    );
  }
}
