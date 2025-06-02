import 'package:sqflite_common/sqlite_api.dart';
import 'package:flutter/foundation.dart';

Future<void> insertLanguageData(Database db) async {
  try {
    await db.insert(
      'language_img',
      {
        'language': 'Java',
        'url_img':
            'https://blogger.googleusercontent.com/img/a/AVvXsEi0-dekCw_KGXlOZGyb3gJcb6AS3DoSBA4MTUhdOkVsPQvye3sivmpVIR_L_wo375sTIL-tiqheLww5Yn7Anf0RQQksqFjdpcWp8yjgsjcweYZ_niMWOy6tbx0n0gD4NMCFMo6T5iSdpZuV-zcIuHRQjjyJz__8dgoz9WsFxldKvwDuUFTDstsyubi4'
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    debugPrint('Java insertado correctamente');
  } catch (e, stackTrace) {
    debugPrint('Error al insertar Java: $e');
    debugPrint('Stack trace: $stackTrace');
  }

  try {
    await db.insert(
      'language_img',
      {
        'language': 'Python',
        'url_img':
            'https://blogger.googleusercontent.com/img/a/AVvXsEhYKKTEvsemWOSg8V93QLkX6iZhYd2AAiX5B1x7kj22ZIouo0CI36ctN7yHTafR-Ejyc7gYznfOFQmfsRA_6M55TaMjsU-W9K-AjYB_08s_RHZCWtxVlKLdwUc2NhanbtKV5nnvyu-c6knoyGvfkz0jVSCbg-1Au5Ext2x3kSdI_iJD4iNP3VRUt1SO'
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    debugPrint('Python insertado correctamente');
  } catch (e, stackTrace) {
    debugPrint('Error al insertar Python: $e');
    debugPrint('Stack trace: $stackTrace');
  }

  try {
    await db.insert(
      'language_img',
      {
        'language': 'JavaScript',
        'url_img':
            'https://blogger.googleusercontent.com/img/a/AVvXsEhgZJJmh4ySGtW7mZxJy9TSrbH9RmxFj4OiPIednInl2BekL6iBNfjFFYz_nvG3-XrfYN-TCXlkxIBsV6v9YftSvHmQF-3g9NaeK8t_XSpDCXvCBhMurM6GvuhbpI183Glb0f5DJKkikNGYohX5bH0P4GnvabuiSyinQyF66qfxZVdJDla2CTw5NsZY'
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    debugPrint('JavaScript insertado correctamente');
  } catch (e, stackTrace) {
    debugPrint('Error al insertar JavaScript: $e');
    debugPrint('Stack trace: $stackTrace');
  }

  try {
    await db.insert(
      'language_img',
      {
        'language': 'C++',
        'url_img':
            'https://blogger.googleusercontent.com/img/a/AVvXsEjAkTnx1O62jM3tsmUD5MzPqgjSKIDKRpOSmogTwOPtdzqyc8_ofg_3FXxLo9KuaHeRq8FMkd4zuhowmg1nkF0B4njByOJ4DDAt_IVmuG6rLA54tYTAAPyBf9oKkfWIPh7j4C8H9uF3qIVX24Cqs4MEJpp1KbcmW63JZztXF_V7YNo91pdrgn7vHXPL'
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    debugPrint('C++ insertado correctamente');
  } catch (e, stackTrace) {
    debugPrint('Error al insertar C++: $e');
    debugPrint('Stack trace: $stackTrace');
  }

  try {
    await db.insert(
      'language_img',
      {
        'language': 'Flutter',
        'url_img':
            'https://blogger.googleusercontent.com/img/a/AVvXsEiMh3wU2kjyes2tNMJ2S7iaT0HUx-ke9uBNjwzCFb45fsthGTMc4tUjT26BtWrgoWQVc_meYSyZtiDICr1EF6SAPc9Nt173GlnGTX_Dg5tTdsi-VgLgRgSgROGxSR39HAvDruIKWn2f_GqBK3xkJr-GygzGEQS_vZPSyhutaZUeh3YszE3nv0-eh2TE'
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    debugPrint('C++ insertado correctamente');
  } catch (e, stackTrace) {
    debugPrint('Error al insertar flter: $e');
    debugPrint('Stack trace: $stackTrace');
  }

  try {
    await db.insert(
      'language_img',
      {
        'language': 'Aws',
        'url_img':
            'https://blogger.googleusercontent.com/img/a/AVvXsEhpE_mDQ6yzXjlidfHfdb2WKCA0TlV3BWjOfcb92jk92-vg0w1qAkLhBmAATpAHbxsr5tUni-pAz04ygqrN1Z-RYVeH6ZwuFKezC7WQtQKNdMFgXXe1cvIue2pef6ZC0XpCab4W8DfhhJ7BC6naniROcLuq2QnZbP-wnb3EhxDd5agEYcS1j2oTBXlA'
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    debugPrint('C++ insertado correctamente');
  } catch (e, stackTrace) {
    debugPrint('Error al insertar aws: $e');
    debugPrint('Stack trace: $stackTrace');
  }

  try {
    await db.insert(
      'language_img',
      {
        'language': 'Linux',
        'url_img':
            'https://blogger.googleusercontent.com/img/a/AVvXsEgTFKtju6NNM6vKvw5WrwtTZozJVk0kLMJZ68bcoIrqnpR235AHmKAfW8uYN2lxobCMaDDwTyDcFTnI5uTOmAvij56YmrVC3CqJs_GMqkCoMJXi6pvGfacPZEMEK2DZO_T86wPFHYRM8hFocbrBGN7O_tbZexGXkDoX5c8P8V9w3M2nt4LUt7i_uyO-'
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    debugPrint('C++ insertado correctamente');
  } catch (e, stackTrace) {
    debugPrint('Error al insertar linux: $e');
    debugPrint('Stack trace: $stackTrace');
  }
}
