
- [ ] verificar a versão do android

# para testes:

```
flutter clean
flutter doctor --android-licenses
flutter doctor -v
```

# configurações:
## configurações necessárias para usar o `jdk` na versão 17:

> [!] configurações foram revertidas depois de aplicadas pois comando `flutter` não atualizava a versão usada, mesmo após as alterações 

- alterar versão padrão do `java` e `javac` com os comandos:
   - `sudo update-alternatives --config javac`
   - `sudo update-alternatives --config javac`
- no Android Studio: em `Build, Execution, Deployment >> Build Tools >> Gradle`, o path em `Default Gradle JDK:` foi alterado para `/usr/lib/jvm/java-17-openjdk-amd64/`
- no `.bashrc`, inserir:
```
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 # para desenvolvimento flutter
export PATH=$JAVA_HOME/bin:$PATH # para desenvolvimento flutter
```


# Erros:
## Erro dia 14/01:

> dia 14/01
> `[!] This is likely due to a known bug in Android Gradle Plugin (AGP) versions less than 8.2.1`

```
joseph@joseph-81s9:~/Semestre-2024-2/PIT/Ayvu_app$ flutter run --debug
Launching lib/main.dart on SM A546E in debug mode...
Warning: SDK processing. This version only understands SDK XML versions up to 3 but an SDK XML file of version 4 was encountered. This can happen if you use versions of Android Studio and the command-line tools that were released at different times.
warning: [options] source value 8 is obsolete and will be removed in a future release
warning: [options] target value 8 is obsolete and will be removed in a future release
warning: [options] To suppress warnings about obsolete options, use -Xlint:-options.
3 warnings

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':path_provider_android:compileDebugJavaWithJavac'.
> Could not resolve all files for configuration ':path_provider_android:androidJdkImage'.
   > Failed to transform core-for-system-modules.jar to match attributes {artifactType=_internal_android_jdk_image, org.gradle.libraryelements=jar, org.gradle.usage=java-runtime}.
      > Execution failed for JdkImageTransform: /home/joseph/Android/Sdk/platforms/android-34/core-for-system-modules.jar.
         > Error while executing process /usr/local/android-studio/jbr/bin/jlink with arguments {--module-path /home/joseph/.gradle/caches/transforms-3/9fb51353889e697c585cdd0167b151a4/transformed/output/temp/jmod --add-modules java.base --output /home/joseph/.gradle/caches/transforms-3/9fb51353889e697c585cdd0167b151a4/transformed/output/jdkImage --disable-plugin system-modules}

* Try:
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.
> Run with --scan to get full insights.
> Get more help at https://help.gradle.org.

BUILD FAILED in 1m 20s
Running Gradle task 'assembleDebug'...                             82.1s

┌─ Flutter Fix ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ [!] This is likely due to a known bug in Android Gradle Plugin (AGP) versions less than 8.2.1, when                                   │
│   1. setting a value for SourceCompatibility and                                                                                      │
│   2. using Java 21 or above.                                                                                                          │
│ To fix this error, please upgrade your AGP version to at least 8.2.1. The version of AGP that your project uses is likely defined in: │
│ /home/joseph/Semestre-2024-2/PIT/Ayvu_app/android/settings.gradle,                                                                    │
│ in the 'plugins' closure (by the number following "com.android.application").                                                         │
│  Alternatively, if your project was created with an older version of the templates, it is likely                                      │
│ in the buildscript.dependencies closure of the top-level build.gradle:                                                                │
│ /home/joseph/Semestre-2024-2/PIT/Ayvu_app/android/build.gradle,                                                                       │
│ as the number following "com.android.tools.build:gradle:".                                                                            │
│                                                                                                                                       │
│ For more information, see:                                                                                                            │
│ https://issuetracker.google.com/issues/294137077                                                                                      │
│ https://github.com/flutter/flutter/issues/156304                                                                                      │
└───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
Error: Gradle task assembleDebug failed with exit code 1
```
