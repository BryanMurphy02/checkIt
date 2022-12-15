# CheckIt

CheckIt is a task management and social media app that allows users to make and track tasks. These tasks can be added to a feed where other users can see allowing them to potentially join in on the task if it permits.

## Getting Started

In order to run CheckIt, flutter must be intalled on your device. Click [here[(https://docs.flutter.dev/get-started/install) to see the steps to get up and running!

### IMPORTANT:

For projects with Firestore integration, you must first run the following commands to ensure the project compiles:

```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

This command creates the generated files that parse each Record from Firestore into a schema object.

### Getting started continued:

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
