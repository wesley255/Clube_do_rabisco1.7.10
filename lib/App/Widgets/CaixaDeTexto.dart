// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../LocalServices/Screen_Percent.dart';

class CaixaDeTexto extends StatelessWidget {
  final Color? labelColor;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margem;
  final VoidCallback? iconClick;
  final void Function(String)? onChanged;
  final String? label;
  final Color? color;
  final Widget? icon;
  final double? borderRadius;
  final int? muiltline;
  final bool? obiscureText;
  final TextInputType? keyboardType;
  final Color? textColor;
  final double? width;
  final Color? bordercolor;
  final double? borderLaft;
  final double? borderRiad;
  final double? bordertopLaft;
  final double? borderTopRiad;
  final double? borderall;
  final double? heith;
  final bool? textCenter;
  final int? maxLength;
  final bool? heathFlacsivo;

  const CaixaDeTexto({
    this.maxLength,
    this.onChanged,
    this.labelColor,
    this.controller,
    this.label,
    this.margem,
    this.iconClick,
    this.icon,
    this.borderRadius,
    this.muiltline,
    this.obiscureText,
    this.keyboardType,
    this.color,
    this.textColor,
    this.width,
    this.bordercolor,
    this.borderLaft,
    this.borderRiad,
    this.bordertopLaft,
    this.borderTopRiad,
    this.borderall,
    this.heith,
    this.textCenter,
    this.heathFlacsivo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(),
        margin: margem ?? EdgeInsets.symmetric(vertical: 5),
        constraints: BoxConstraints(
            maxHeight: 150, maxWidth: width ?? larguraDaTela(context, 99)),
        child: Stack(
          children: [
            //border stlyle\/
            ClipRRect(
              borderRadius: borderRadius == null
                  ? BorderRadius.only(
                      bottomLeft: borderLaft == null
                          ? Radius.circular(0)
                          : Radius.circular(borderLaft!),
                      bottomRight: borderRiad == null
                          ? Radius.circular(0)
                          : Radius.circular(borderRiad!),
                      topLeft: bordertopLaft == null
                          ? Radius.circular(0)
                          : Radius.circular(bordertopLaft!),
                      topRight: borderTopRiad == null
                          ? Radius.circular(0)
                          : Radius.circular(borderTopRiad!),
                    )
                  : BorderRadius.circular(borderRadius!),
              //border style/\
              child: TextField(
                obscureText: obiscureText == null ? false : obiscureText!,
                maxLength: maxLength,
                // Text Style\/
                style: TextStyle(
                  color: textColor ?? Colors.black,
                ),
                //text style /\
                //funcoes\/
                maxLines: (heathFlacsivo == null || !heathFlacsivo!)
                    ? muiltline ?? 1
                    : null,
                onChanged: onChanged,
                keyboardType: keyboardType,
                controller: controller,

                //funcoes/\
                //style input \/

                decoration: InputDecoration(
                  counterText: '',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderSide: bordercolor == null
                        ? BorderSide.none
                        : BorderSide(color: bordercolor!),
                  ),
                  label: label != null
                      ? H2(
                          text: label!,
                          color: labelColor,
                        )
                      : Text(''),
                  filled: true,
                  fillColor: color ?? Colors.white,
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                      right: 10,
                      bottom: 8,
                      top: heith == null ? 8 : heith!,
                      left: 10),
                ),
              ),
            ),
            //icone\/
            Positioned(
              top: -6,
              right: -2,
              child: icon != null
                  ? IconButton(onPressed: iconClick, icon: icon!)
                  : SizedBox(),
            ),
            //icone/\
          ],
        ));
  }
}

class MyInputDecoration {
  MyInputDecoration._();
}

class H2 extends StatelessWidget {
  final Color? color;
  final String text;
  final double? size;
  const H2({required this.text, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Color(0xffAEAEAE),
        fontSize: size == null ? 15 : size,
      ),
    );
  }
}
