# GTK Hindi/English Notepad
Basic text editor for Linux written in C/GTK which support multi languages with the help of i18n.

This gtk-notepad is a basic text editor, "GTK Notepad," utilizing the GTK2 library for its graphical user interface. 
It provides standard text editing features, including file management options like creating new files, opening existing ones, saving, and saving as. 
The application incorporates cut, copy, paste, delete, and select all operations, with word wrapping functionality for long lines. 
It features a status bar showing the current cursor position, an "About" dialog, and the ability to insert the current date and time. 
The program offers font selection and clipboard support for text manipulation. 
One notable feature is its robust support for internationalization (i18n), which is implemented through the use of the "libintl" library. 
This allows for the translation of user interface elements into different languages, making the application accessible to a global audience. 
It manages errors associated with file operations and can be invoked from the command line, with the capability to open a specified file. 
This code exemplifies the creation of a straightforward text editor with extensive i18n support using GTK in a Linux or Unix environment.

# Internationalization (i18n)
The internationalization (i18n) implementation in the "GTK Notepad" project is evident in its directory structure. 
The "i18n" directory contains language-specific subdirectories, such as "hi_IN" (Hindi - India), each of which includes 
two key files: "hi_IN.po" (Portable Object) and "notepadi18.mo" (Machine Object). The "hi_IN.po" file is a human-readable text file that contains 
message translations for the application's user interface elements, while "notepadi18.mo" is a binary file generated from the ".po" file and is used 
by the application to display translated messages. In addition, the "locale" directory includes another set of "notepadi18.mo" files for Hindi (hi) 
translations. The "libintl" library is used in the C code to load these translated messages based on the user's locale settings. 
This comprehensive i18n approach allows the "GTK Notepad" to support multiple languages, making it accessible to users from diverse linguistic 
backgrounds by providing translations of user interface elements and messages.

The i18n implementation in "GTK Notepad" is managed through an intelligently designed Makefile. 
Users can utilize a series of commands to generate and edit localization files, allowing the application to seamlessly adapt its user interface 
elements and messages to different languages. By executing make locale-init, users can initiate the i18n setup, which automatically extracts text 
for translation from the source code and creates corresponding Portable Object (PO) files. These PO files are then used to generate binary Machine 
Object (MO) files, enabling the program to display localized content. Users can edit these translation files using make edit-locale to fine-tune and 
customize the localization to suit their preferences. Once translations are ready, the make patch-locale command applies them to the program, 
facilitating a seamless experience for users of various linguistic backgrounds.



### Installation
Use `make all` to build it (no installation yet). You need gtk-2.0 to compile this program.

To generate locales
```bash
make locale-init
make edit-locale
make patch-locale
```

To run with specified locale, use `make run`. Or set env var `LANGUAGE` to specified language locale.
