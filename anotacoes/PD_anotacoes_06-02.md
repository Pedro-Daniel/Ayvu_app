# erros encontrados durante a build do app no SM A546E(celular do José):

> obs: não impediu a build de ser realizada

```
Your project is configured with Android NDK 23.1.7779620, but the following plugin(s) depend on a different Android NDK version:
- audio_session requires Android NDK 25.1.8937393
- flutter_sound requires Android NDK 25.1.8937393
- geolocator_android requires Android NDK 25.1.8937393
- path_provider_android requires Android NDK 25.1.8937393
- permission_handler_android requires Android NDK 25.1.8937393
Fix this issue by using the highest Android NDK version (they are backward compatible).
Add the following to C:\Users\pedro\Desktop\Ayvu_app\android\app\build.gradle:

    android {
        ndkVersion = "25.1.8937393"
        ...
    }

Warning: SDK processing. This version only understands SDK XML versions up to 3 but an SDK XML file of version 4 was encountered. This can happen if you use versions of Android Studio and the command-line tools that were released at different times.
```


```
Error: ADB exited with exit code 1
Performing Streamed Install

adb: failed to install C:\Users\pedro\Desktop\Ayvu_app\build\app\outputs\flutter-apk\app-debug.apk: Failure [INSTALL_FAILED_UPDATE_INCOMPATIBLE: Existing package com.example.ayvu_app signatures do not match newer version; ignoring!]
```
