# CheckIt
## Description
CheckIt is a task management and social media mobile app for iOS and Android built with Flutter SDK and Dart. Created tasks can be added to a feed where other users can see allowing them to potentially join in on the task if it permits

## Features
- Task creation and tracking
- Organize tasks based on subject
- Collaborate with others by posting tasks onto the home feed

## Development Method and Documentation
CheckIt was conceputalized and designed using the waterfall software development method. The method uses the main phases of requirements gathering, design, and implementation. The waterfall method alos has a heavy emphasis on documentation. The following is contained in Documents folder:
- System Requests Document(SRD)
- System Requirements Specification(SRS)
- System Design Document(SDD)

## Architecture
CheckIt uses a three layer architecture pattern made up of the UI, domain, and data layer. This architecture ensures seperation of concerns between the different layers and enables efficient communication

## Installation

In order to locally run CheckIt there are two requirements:
1. Install and setup flutter. Steps to do so can be found [here](https://docs.flutter.dev/get-started/install).
2. Run the following commands below in order to compile. These commands create the generated files that parse each Record from Firestore into a schema object.
```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```
