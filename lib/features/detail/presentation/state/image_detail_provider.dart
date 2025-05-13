import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final randomImageProvider = Provider.autoDispose<String>((ref) {
  final random = Random();
  return flutterImages[random.nextInt(flutterImages.length)];
});

const List<String> flutterImages = [
  'https://redwerk.es/wp-content/uploads/2019/10/f-image.png',
  'https://miro.medium.com/v2/resize:fit:1400/1*-6WdIcd88w3pfphHOYln3Q.png',
  'https://thinkupsoft.com/blog/wp-content/uploads/2024/04/Blog-Nota-4.png',
  'https://cdn.prod.website-files.com/5f049e5db08fbfceae4cf2d3/660ee418d8d74186cd2b3085_Desarrollo%20de%20software%20flutter.webp',
  'https://bs-uploads.toptal.io/blackfish-uploads/components/blog_post_page/4093279/cover_image/retina_1708x683/0722_Flutter_Advantages_and_Benefits_Zara_Newsletter___blog__1_-15db0c4f9f7a5d7390dfd7ee1b66eb71.png',
  'https://blog.back4app.com/wp-content/uploads/2020/09/flutter-backend.png',
  'https://redwerk.es/wp-content/uploads/2020/08/f-image.png',
  'https://www.addevice.io/storage/ckeditor/uploads/images/65f840d316353_mobile.app.development.1920.1080.png',
  'https://bairesdev.mo.cloudinary.net/blog/2023/10/Steps-of-Mobile-App-Development.jpg?tx=w_1920,q_auto',
  'https://zd-brightspot.s3.us-east-1.amazonaws.com/wp-content/uploads/2023/10/12122423/mobile-app-development.jpg',
  'https://www.moolnet.ca/services-img/mobile-app-development.png',
  'https://media.istockphoto.com/id/1174690086/photo/software-developer-freelancer-working-at-home.jpg?s=612x612&w=0&k=20&c=loFqul06ggwtkwqSmzZnYfA72Vk7nFQOvDSzAN6YbtQ=',
  'https://www.codemotion.com/magazine/wp-content/uploads/2020/12/altumcode-PuxTq4DwUHE-unsplash-896x504.jpg',
  'https://raygun.com/blog/images/native-app-development/feature-2023.jpg',
  'https://d3hfl9xoa8vpcx.cloudfront.net/Understanding%20Android%20SDK.webp',
  'https://www.qt.io/hs-fs/hubfs/Qt_Phone_Pine_Green2%20(1).webp?width=850&name=Qt_Phone_Pine_Green2%20(1).webp',
  'https://litslink.com/wp-content/uploads/2019/10/Best-mobile-app-development-blogs.png',
  'https://cdn.prod.website-files.com/5db35de024bb988f5fb4e168/6616842e14f7fd0044604e2f_61e13fe824a0f7e552684313_what-is-unit-testing-in-mobile-development.jpeg'
];
