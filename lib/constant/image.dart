import 'package:flutter/cupertino.dart';

class ImagesClass {
  static Image imagecoustom = Image.asset('asset/profile.jpg');

  static Image ImgeProfile = Image.network(
    'https://scontent.fdac110-1.fna.fbcdn.net/v/t39.30808-1/421750988_913338270136654_635347076248654908_n.jpg?stp=dst-jpg_s200x200&_nc_cat=111&ccb=1-7&_nc_sid=50d2ac&_nc_ohc=vklSyDWtzyYQ7kNvgFTq5ww&_nc_ht=scontent.fdac110-1.fna&_nc_gid=A0U1Tu8PWDwskyDc20XULMl&oh=00_AYCgTCRe53t_ysb7WU0F7G1LDU1mF57n_id85heP9Uk29w&oe=66F99066',
    height: 100,
    width: 100,
    fit: BoxFit.fill,
  );
}
