# birthday_app
Birthday UI app with clean architecture 

## Features
- Clean architecture
- Scalable UI

## Used packages
- State management with [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [Freezed](https://pub.dev/packages/freezed), code generator for data-classes/unions/pattern-matching/cloning and [freezed_annotation](https://pub.dev/packages/freezed_annotation)
- Localization with [intl](https://pub.dev/packages/intl)
- Firebase as remote database with [firebase_core](https://pub.dev/packages/firebase_core)
- Adaptive UI with [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
- Map with [yandex_mapkit](https://pub.dev/packages/yandex_mapkit)
- Navigation with [auto_route](https://pub.dev/packages/auto_route) and [auto_route_generator](https://pub.dev/packages/auto_route_generator)
- [build_runner](https://pub.dev/packages/build_runner)

# Overview
| Home view | Guest view | Category view 
|-----------|---------------|------------
|<img src="https://github.com/rel1nce/birthday_app/assets/101862863/883e77fe-00b0-49d1-b9a2-bb6f256cbae1" width="250">|<img src="https://github.com/rel1nce/birthday_app/assets/101862863/d9ca4fa1-db84-4812-a3c9-ee719cd3b2e0" width="250">|<img src="https://github.com/rel1nce/birthday_app/assets/101862863/07d47189-0edf-43cd-b7a6-b885fb14d095" width="250">|

# Demonstration
[overview.webm](https://github.com/rel1nce/birthday_app/assets/101862863/28adb56e-efb4-4910-895d-5945e1ccf0f7)

### Terms of use
*In order to run the project, you have to write commands below in your console in project folder:*
```
# get dependencies 
flutter pub get
# build generated files
dart run build_runner build
```

