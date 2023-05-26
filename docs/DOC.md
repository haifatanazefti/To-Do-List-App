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
* Creating a Task: To add a new task to your to-do list, follow these steps:

Open the app and navigate to the task list screen.
Tap the "+" button to create a new task.
Enter the title and details of the task.
Optionally, set a due date for the task.
Tap "Save" to add the task to your to-do list.
Editing a Task: To modify the details of an existing task, follow these steps:

Open the app and navigate to the task list screen.
Locate the task you want to edit.
Tap on the task to open the task details screen.
Tap the "Edit" button to enter the edit mode.
Make the necessary changes to the task's title, details, due date, or priority.
Tap "Save" to save the changes.
Deleting a Task: To remove a task from your to-do list, follow these steps:

Open the app and navigate to the task list screen.
Locate the task you want to delete.
Swipe left on the task to reveal the delete option.
Tap the "Delete" button to remove the task from your list.
Setting Due Dates: To assign a due date to a task, follow these steps:

Open the app and navigate to the task list screen.
Locate the task you want to set a due date for.
Tap on the task to open the task details screen.
Tap the "Due Date" field to open the date picker.
Select the desired due date from the calendar.
Tap "Save" to save the due date.
Prioritizing Tasks: To mark a task as high priority, follow these steps:

Open the app and navigate to the task list screen.
Locate the task you want to prioritize.
Tap on the task to open the task details screen.
Toggle the priority switch to the "On" position.
Tap "Save" to save the priority status.
Marking as Completed: To mark a task as completed, follow these steps:

Open the app and navigate to the task list screen.
Locate the task you want to mark as completed.
Tap on the task to open the task details screen.
Toggle the completion switch to the "On" position.
Tap "Save" to save the completion status.
Syncing with Cloud Service: To sync your tasks with a cloud service, follow these steps:

Open the app and navigate to the settings screen.
Tap the "Sync" option to open the sync settings.
Select the desired cloud service (Dropbox, Google Docs, OneDrive, etc.).
Follow the on-screen instructions to authorize the app with the selected service.
Once authorized, your tasks will automatically sync with the cloud service.
Developer Guide
Architecture
The To-Do List App follows the MVVM (Model-View-ViewModel) architectural pattern. It utilizes the following components:

Models: Represents the data structure of a task. Contains properties like id, title, dueDate, isPriority, and isCompleted.
Views: The user interface components responsible for displaying tasks and capturing user interactions.
ViewModels: Acts as an intermediary between the views and the data layer. Manages the logic for creating, editing, and deleting tasks.
Dependencies
The To-Do List App relies on the following dependencies:

flutter: The Flutter SDK for building cross-platform applications.
provider: A state management library for managing the app's state and implementing the MVVM pattern.
sqflite: A Flutter plugin for interacting with SQLite databases.
path_provider: A Flutter plugin for accessing the device's file system.
flutter_datetime_picker: A Flutter plugin for selecting dates and times from a picker.
fluttertoast: A Flutter plugin for displaying toast messages.
Project Structure
The project follows a modular structure, with the following directories:

lib: Contains the main source code of the application.
data: Contains the data layer components responsible for interacting with the database and cloud services.
models: Contains the model classes representing the task data structure.
ui: Contains the user interface components, including screens, widgets, and view models.
utils: Contains utility classes and functions used throughout the application.
test: Contains unit tests for various components of the application.
Contribution Guidelines
Contributions to the To-Do List App are welcome! If you want to contribute to the project, please follow these guidelines:

Fork the repository and create a new branch for your feature or bug fix.
Implement your changes, ensuring adherence to the project's coding style and guidelines.
Write unit tests for your changes to maintain code quality.
Commit your changes and push them to your forked repository.
Submit a pull request with a clear description of your changes and the problem it solves.
Participate in the code review process and address any feedback or comments.
Please note that all contributions are subject to review and approval by the project maintainers.

License
This project is licensed under the MIT License. See the LICENSE file for more details.
