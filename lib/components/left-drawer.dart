import 'package:flutter/material.dart';

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const _SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
        style: const TextStyle(
          color: Colors.black, fontFamily: 'BalsamiqSans_Regular')),
      leading: Icon(iconData, color: Colors.black),
      onTap: () => onTap?.call(title)
    );
  }
}
class SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: ListView(
        children: <Widget>[
          const SizedBox( height: 30,),
          CircleAvatar(
            radius: 53,
            backgroundColor: Colors.deepOrange[200],
            child: CircleAvatar(
              radius: 50,
              backgroundImage: Image.network('https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FFAC.2Fvar.2Ffemmeactuelle.2Fstorage.2Fimages.2Famour.2Fcoaching-amoureux.2Fcest-quoi-belle-femme-temoignages-43206.2F14682626-1-fre-FR.2Fc-est-quoi-une-belle-femme-temoignages.2Ejpg/1200x1200/quality/80/crop-from/center/c-est-quoi-une-belle-femme-temoignages.jpeg').image,
            ),
          ),
          const SizedBox(height: 20,),
          const Text(
            'Tanazefti Haifa',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox( height: 5,),
          const Text(
            'haifatanazefti97@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...[
            Menu(Icons.home_rounded, 'Home'),
            Menu(Icons.analytics_rounded, 'Analytics'),
            Menu(Icons.notifications_active, 'Notification'),
            Menu(Icons.favorite, 'Likes'),
            Menu(Icons.settings, 'Setting'),
            Menu(Icons.arrow_back_ios_new_rounded, 'LogOut')
          ].map((menu) => _SliderMenuItem(
              title: menu.title,
              iconData: menu.iconData,
              onTap: onItemClick))
          .toList(),
        ],
      ),
    );
  }
}
class Menu {
  final IconData iconData;
  final String title;

  Menu(this.iconData, this.title);
}
