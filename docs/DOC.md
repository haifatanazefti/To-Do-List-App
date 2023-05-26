# User Guide
## Overview
The To-Do List App is a Flutter application that helps you manage your tasks and stay organized. This guide provides instructions on how to use the app and its features effectively.

## Features
* Create a Task: Add new tasks to your to-do list.
* Edit a Task: Modify the details of an existing task.
* Delete a Task: Remove a task from your to-do list.
* Set Due Dates: Assign due dates to your tasks to prioritize them.
* Prioritize Tasks: Mark important tasks as high priority.
* Mark as Completed: Mark tasks as completed when finished.

## Installation
* Clone the repository:

```
git clone https://github.com/your-username/to-do-list-app.git
```
* Navigate to the project directory:

```
cd to-do-list-app
```
* Install the dependencies:

```
flutter pub get
```
* Run the app:
```
flutter run
```

## Usage
* Getting all the to do items ordered by due date.
* Creating a to do item : To add a new to do item to your to-do list, follow these steps:

  - Open the app and navigate to the to do list screen.
  - Tap the "+" button to create a new to do item.
  - Enter the title and details of the to do item.
  - Optionally, set a due date for the to do item.
  - Tap "Add" to add the to do item to your to-do list.

* Editing a to do item: To modify the details of an existing to do item, follow these steps:

  - Open the app and navigate to the task list screen.
  - Locate the to do you want to edit.
  - Tap on the to do item to open the to do item details screen.
  - Tap the "Edit" button to enter the edit mode.
  - Make the necessary changes to the to-do's title, details, due date, or priority.
  - Tap "Edit" to save the changes.

* Deleting a to do item: To remove a to-do from your to-do list, follow these steps:

  - Open the app and navigate to the to do list screen.
  - Locate the to do you want to delete.
  - Swipe left on the task to reveal the delete option.
  - Tap the "Delete" icon to remove the to do item from your list.

* Setting Due Dates: To assign a due date to a to do item, follow these steps:

  - Open the app and navigate to the to do item list screen.
  - Locate the to do item you want to set a due date for.
  - Tap on the to do item to open the task details screen.
  - Tap the "Due Date" field to open the date picker.
  - Select the desired due date from the calendar.
  - Tap "Save" to save the due date.

* Prioritizing to do items: To mark a task as high priority, follow these steps:

  - Open the app and navigate to the to do list screen.
  - Locate the to do item you want to prioritize.
  - Tap on the to do item to open the task details screen.
  - Toggle the priority switch to the "On" position.
  - Tap "Edit" to save the priority status.
  - <font color="red">**Note:**  priority to do items are marked with a red line</font>

* Marking as Completed: To mark a to do item as completed, follow these steps:

  - Open the app and navigate to the to do list screen.
  - Locate the to do item you want to mark as completed.
  - Toggle the completion switch to the "On" position in the checkbox in the left side.
  
# Developer Guide
## Dependencies
The To-Do List App relies on the following dependencies:

- flutter: The Flutter SDK for building cross-platform applications.
- sqflite: A Flutter plugin for interacting with SQLite databases.
- path: A Flutter plugin for accessing the device's file system.
- flutter_slider_drawer: A Flutter package with custom implementation of the Slider Drawer Menu. 

## Project Structure
The project follows a modular structure, with the following directories:

- lib: Contains the main source code of the application.
- data: Contains the data layer components responsible for interacting with the database.
- models: Contains the model classes representing the task data structure.
- screens: Contains the user interface including screens.
- dialogs: Contains the alert dialogs for adding and editing a to do item.
- components: Contains the user interface components.
- utils: Contains utility classes and functions used throughout the application.
- test: Contains unit tests for various components of the application.
