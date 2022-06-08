import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testes_de_estudos/App/Data_Source/Domain/Entities/Post.dart';
import 'package:testes_de_estudos/App/LocalServices/Screen_Percent.dart';
import 'package:testes_de_estudos/App/Widgets/Show_Full_Image.dart';

class GaleriaGrid extends StatelessWidget {
  final BuildContext context;
  final EdgeInsets? margem;
  final Function? onTap;
  final String? buttonText;
  //
  final List<Post> posts;

  const GaleriaGrid({
    required this.context,
    this.margem,
    this.buttonText,
    this.onTap,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    var change = ValueNotifier<bool>(false);
    return ValueListenableBuilder(
      valueListenable: change,
      builder: (_context, _value, _child) {
        return Padding(
          padding: margem ?? EdgeInsets.zero,
          child: Column(
            children: [
              //button\/
              buttonText != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 2),
                      child: GestureDetector(
                        onTap: () => change.value = !change.value,
                        child: Row(
                          children: [
                            Text(
                              buttonText!,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width /
                                      100 *
                                      5,
                                  fontWeight: FontWeight.bold),
                            ),
                            change.value
                                ? Icon(Icons.keyboard_arrow_up_outlined)
                                : Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        ),
                      ),
                    )
                  : SizedBox(),
              //button/\
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(alturaDaTela(context, 1)),
                  width: larguraDaTela(context, 100),
                  color: Color(0xFF182C38),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Observer(builder: (contex) {
                      return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          //lanth\/
                          itemCount: change.value
                              ? posts.length
                              : posts.length < 8
                                  ? posts.length
                                  : 8,
                          //lanth/\
                          padding: EdgeInsetsDirectional.all(0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 1,
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 1),
                          itemBuilder: (_, index) {
                            var image = posts[index].image[0]['url'];
                            return ImageClick(url: image!);
                          });
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
