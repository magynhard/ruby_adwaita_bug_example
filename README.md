# ruby_adwaita_bug_example
> Demonstrate a problem when using adwaita with ruby and GTK4

## Reproduce problem
Either on Windows 11 native or WSL Ubuntu 22.04:
* Ruby 3.2.2 is installed

In this project run
```
bundle install
```
to install all dependencies. Ensure that for native extensions the necessary libraries are installed to finish successful.

Then run
```
ruby main.rb
```
or
```
bundle exec ruby main.rb
```

### Output
The output on native MS Windows or WSL will be:
```
main.rb:48:in `show': uninitialized constant Adwaita::AboutDialog
```
The same will happen for `Adwaita::ButtonRow` if you comment the line 48.


But the interesting fact is, that other Adwaita components/classes are loaded, available and found and working fine, for example:
```
Adwaita::Application
Adwaita::PreferencesGroup
Adwaita::ActionRow
```

When commenting the code with `dialog` and `button_row`, the app is running properly on MS Windows and WSL.