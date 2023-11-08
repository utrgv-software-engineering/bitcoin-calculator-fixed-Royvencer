## Overview 

<!-- Denote the type of change being made. Select all that apply. -->
**Type of Change**
- [ 1] Bug fix (non-breaking change which fixes an issue)
- [ ] UI change/fix (doesn't break core functionality that changes how app looks)
- [1 ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)
- [ 1] Code style update (formatting, renaming)
- [1 ] Refactoring (no functional changes, no API changes)
- [ ] Build related changes
- [ ] Documentation content changes  

<!-- Describe the change that is being made. -->
**Proposed Changes**  
*What is the current behavior?*
App wasnt properly running tests before, added couple tests, 
added button select and added flair
*What is the new behavior?*
app runs tests properly, and error ctaches have been added
*If this PR introduces a breaking change, what changes might users need to make in their application due to this PR?*  
The conversion might be whats broken if anything
<!-- If the UI has changed, you are required to show the before and after. If the UI has not been changed, delete this section. -->
**Screenshots**  
*Before*

*After*


## Other
<!-- Include this section if modifications were made to pubspec.yaml -->
*pubspec.yaml Changes* 

<!-- Include this section if you made changes to Github Actions files -->
*CI/CD Changes* 

<!-- Include this section if you made changes to the PR template -->
*PR Template Changes*

*Comments/Questions from the Author*

<!-- Before opening the PR ensure that you can check off all of these boxes. -->
## Self-Review  Checklist 
- [ 1] I have added unit and/or integration tests to cover my changes, or my changes did not require additional tests
- [1 ] All new and existing tests passed on my local machine.
- [1 ] I did not add unnecessary comments to the code
- [1 ] I did not add unnecessary logging or debugging code (print statements, for example).
- [ 1] Errors are properly handled for code that is risky.
- [ 1] Naming of methods, variables, and classes is proper.
- [1 ] I wrote a description of requested changes.
- [1 ] I performed a self-review of my own code.
