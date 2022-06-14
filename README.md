# Isaac
A nifty script to speed up routine text inputs.

Script reads contents of templates.txt, allows rapid creation and pasting of routine texts.\
Running the script requires previous installation of AutoHotkey.\
I use the script with Razer Tartarus v2 (that's why keyboard "shortcuts" are long and reach F20), I'll try to add support for normal keyboard users (It's probably possible to create personalised key bindings using reWASD - haven't tested).

templates.txt tags:
```
<template>  </template>   - beginning and end of a template
<title>     </title>      - title of a template
|                         - separates variants
newline (Enter)           - separates sentences
```

Sample templates.txt:
```
  <template>\
    <title>
    Thank you for a hillarious cat picture.  
    </title>
    Dear Father!|Dear Mother!
    Thank you for a hillarious cat picture.
    It made me laugh a lot!|Me and my friends all laughed!||It was weird, but funny nonetheless.
    |Please don't send more.
    Lots of love!
  </template>
 ```
All tags (both template tags, both title tags) are mandatory.\
Newline separates sentences, | separates variants.\
Beginning a line with | will make it blank by default.\
Me and my friends all laughed!||It was weird, but funny nonetheless   <- will result in having blank as an option.

                                                                         
After running the script it is reuired to load the template file by pressing Shift+Ctrl+F20\
To choose a template press Shift+Ctrl+F1-F19.\
To toggle between options in sentences press Shift+Ctrl+F1-F19, after running out of options sentences will cycle to the beginning.\
Options will be displayed in Isaac window and as a tooltip near the mouse pointer.                                                                      
To paste created text press Shift+Ctrl+F20 (the cursor has to be active in the position where the text is pasted, otherwise text will be lost).
                                                                         

Known TODO's:\
  -add better explanation to what the script does, possibly images/video\
  -create autoupdate script\
  -translate comments to english, reformat code\
  -check syntax before loading script, add error messages\
  -allow for templates to be longer than 19 lines
