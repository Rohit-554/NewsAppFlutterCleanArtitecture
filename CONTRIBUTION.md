# Contributing guidelines

## Prerequisites

Before you can contribute to this project, you'll need to have the following tools and dependencies installed on your development environment:-
- Android Studio
    - [Android Studio Download](https://developer.android.com/studio)
- Visual Studio Code
    - [Visual Studio Code](https://code.visualstudio.com/download)
- Git: Version control to perform various tasks
    - [Git](https://git-scm.com/downloads)
- Gpg4win: To sign commits
    - [Gpg4win](https://gpg4win.org/download.html)

## How to contribute

Step 1: Fork the project
- You can click on the fork option in upper right corner in the screen
- Add this repo in your account

Step 2: Clone this repository to your local system
> git clone https://github.com/Rohit-554/NewsAppFlutterCleanArtitecture.git

Step 3: Change the directory to start contributing
> cd NewsAppFlutterCleanArtitecture

Step 4: Create a branch
> git checkout -b "branch_name"

Step 5: Make changes and commit 
- Run the project in your local system
- Go through the documentations
- Go through the issues you want to work with
- If you want to add on something, raise an issue
- Make the changes according to the issues and then commit
> git add .
> git commit -m "Your commit"

Step 6: Push the changes to your remote repository
> git push --set-upstream origin branch_name

## Points to note

- Make sure you commit the changes in the branch **you** created
- Kindly wait to be assigned before start working
- Remember to sign off commits
- Branch naming convention
    - Keep it short and descriptive
    - Add the issue number, if possible
- Commit message
    - Keep it clear and descriptive
- Pull requests {PR}
    - PR should have a meaningful description
    - Try to keep a PR focused on one feature
    - If possible, add code snippets of what changes **you** made in comments
    - Do not create pull request on main branch
- Make sure your code is readable i.e., others can read your code and work on it
    - Add indents and comments if needed
- In order to avoid conflicts
    - Make sure to keep your local repo synced with the original remote repo
    > git checkout <branch>
    > git remote add upstream https://github.com/Rohit-554/NewsAppFlutterCleanArtitecture.git
    > git fetch upstream
    > git merge upstream/branch
    - The next time you try to fetch changes 
    > git pull


**Thanks for contributing to NewsAppFlutterCleanArtitecture!**
