import 'dart:io';

class AdmobService{
  String getAdMobAppId(){
if (Platform.isAndroid)
{
  return 'ca-app-pub-1831099288763922~7593657328';

}
return null;
  }

  String getBannerAdId(){
if (Platform.isAndroid)
{
  return 'ca-app-pub-1831099288763922/8989896831';

}
return null;
  }
}