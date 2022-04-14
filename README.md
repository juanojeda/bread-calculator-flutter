# Bread Calculator App

Based on my WIP web project [Bread Calculator](https://github.com/juanojeda/bread-calculator), but for native mobile.

Built using Flutter, to learn Flutter and Dart.

# Dependencies

- [Flutter](https://docs.flutter.dev/get-started/install/macos#android-setup)
- [Android Studio](https://developer.android.com/studio/index.html)
- [Cocoapods](https://guides.cocoapods.org/using/getting-started.html#installation)
- You may need to [set up the Android emulator](Shttps://docs.flutter.dev/get-started/install/macos#android-setup) on your workspace
- [install android SDK CLI tools](https://stackoverflow.com/questions/60475481/flutter-doctor-error-android-sdkmanager-tool-not-found-windows)
- run `flutter doctor --android-licenses`
- if running on a mac, run `flutter config --enable-macos-desktop`

# How to run it locally
- [Ensure that USB debugging is enabled](https://developer.android.com/studio/debug/dev-options) on your android device
- Plug your device into the computer using a USB cable
- Run `flutter devices` to verify that Flutter recognises the device

## TODO

- [x] Create recipe (add ingredients from the list)
- [x] Save recipe to a list of recipes
- [x] Persist recipes to phone memory
- [x] Display a recipe from the saved recipes
- [ ] Edit recipe (add/remove ingredients to/from the list)
- [x] Delete recipes from db
- [ ] Scale recipe
- [ ] Scale by percentage (whole recipe)
- [ ] Scale by weight of 1 ingredient
- [ ] Edit ingredient
- [ ] Edit ingredient by percentage
- [x] Sort ingredients by flour desc, then other desc.
