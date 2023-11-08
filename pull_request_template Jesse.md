## Overview 

<!-- Denote the type of change being made. Select all that apply. -->
**Type of Change**
- [x] Bug fix (non-breaking change which fixes an issue)
- [x] UI change/fix (doesn't break core functionality that changes how app looks)
- [x] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)
- [ ] Code style update (formatting, renaming)
- [x] Refactoring (no functional changes, no API changes)
- [ ] Build related changes
- [x] Documentation content changes  

<!-- Describe the change that is being made. -->
**Proposed Changes**  
*What is the current behavior?*
App was non functional. modified USD=>BTC
*What is the new behavior?*
App now functions to exchange usd to btc and vice versa
*If this PR introduces a breaking change, what changes might users need to make in their application due to this PR?*  
We would take it step by step in reverse until the state of the app is working and move forward from there.
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
- [x] I have added unit and/or integration tests to cover my changes, or my changes did not require additional tests
- [x] All new and existing tests passed on my local machine.
- [x] I did not add unnecessary comments to the code
- [x] I did not add unnecessary logging or debugging code (print statements, for example).
- [ ] Errors are properly handled for code that is risky.
- [x] Naming of methods, variables, and classes is proper.
- [ ] I wrote a description of requested changes.
- [x] I performed a self-review of my own code.
