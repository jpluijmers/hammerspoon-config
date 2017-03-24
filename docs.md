# Other enhancements

defaults write com.apple.Terminal FocusFollowsMouse -string YES
defaults write com.apple.Terminal FocusFollowsMouse -string NO


If it doesnt exist. Create
nano ~/Library/KeyBindings/DefaultKeyBinding.dict

{
/* Remap Home / End keys to be correct */
"\UF729" = "moveToBeginningOfLine:"; /* Home */
"\UF72B" = "moveToEndOfLine:"; /* End */
"$\UF729" = "moveToBeginningOfLineAndModifySelection:"; /* Shift + Home */
"$\UF72B" = "moveToEndOfLineAndModifySelection:"; /* Shift + End */
"^\UF729" = "moveToBeginningOfDocument:"; /* Ctrl + Home */
"^\UF72B" = "moveToEndOfDocument:"; /* Ctrl + End */
"$^\UF729" = "moveToBeginningOfDocumentAndModifySelection:"; /* Shift + Ctrl + Home */
"$^\UF72B" = "moveToEndOfDocumentAndModifySelection:"; /* Shift + Ctrl + End */
}


logitech mouse settings:
http://support.logitech.com/en_us/software/logitech-control-center-for-macintosh-os-x\
http://support.logitech.com/en_za/product/gaming-mouse-g500