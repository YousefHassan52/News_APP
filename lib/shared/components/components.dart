import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app2/modules/web%20view.dart';

import '../cubit/states.dart';

Widget buildArticleItem(article, context) {
  return InkWell(
    onTap: () {
      navigateTo(context, WebViewScreen(article["url"]));
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${article['urlToImage']}'))),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${article["title"]}",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    "${article["publishedAt"]}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget ScreenBuilder(list, {isSearchScreen = false}) {
  if (list.length > 0) {
    return ListView.builder(
      physics: BouncingScrollPhysics(

      ),
      itemBuilder: (context, index) => buildArticleItem(list[index], context),
      itemCount: list.length,
    );
  } else {
    if (isSearchScreen == false)
    {
      return Center(child: CircularProgressIndicator());
    } else
    {
      return Container();
    }
  }
}

Widget defaultTextFormField({
  Function? onChange,
  required TextEditingController controller,
  required FormFieldValidator<String> validate,
  required String text,
  required IconData prefixIcon,
  required TextInputType keyboardType,
  IconData? suffix,
  bool isPassword = false,
  Function? suffixPressed,
  Color textColor = Colors.grey,
  bool isClickable = true,
}) =>
    TextFormField(


      onChanged: (String value) {
        onChange!(value);
      },
      validator: validate,
      controller: controller,
      keyboardType: keyboardType,

      decoration: InputDecoration(
        labelText: text,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
        ),
        labelStyle: TextStyle(
          color: textColor,
        ),
        prefixIcon: Icon(prefixIcon),


        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: () {
                  suffixPressed!();
                },
              )
            : null,
        // lw passet 7aga lel suffix el suffixicon hayb2a beysawi el suffix el baseto else yeb2a mafeee4(null)

        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gapPadding: 30,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        filled: false,
      ),
      obscureText: isPassword,
      enabled: isClickable,
    );

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
