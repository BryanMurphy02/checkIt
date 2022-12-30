# CheckIt
## Description
CheckIt is a task management and social media app that allows users to make and track tasks. These tasks can be added to a feed where other users can see allowing them to potentially join in on the task if it permits.

## Documentation
The documentation folder contains the planning and requirements documents that were created in the process of developing CheckIt. Within the folder there are the System Requests Document(SRD), the System Requirements Specification(SRS), and the System Design Document(SDD).

## Getting Started

In order to locally run CheckIt there are two requirements:
1. Install and setup flutter. Steps to do so can be found [here](https://docs.flutter.dev/get-started/install).
2. Run the following commands below in order to compile. These commands create the generated files that parse each Record from Firestore into a schema object.
```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```
