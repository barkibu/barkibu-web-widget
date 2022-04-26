# Customize the styles of your app 
The project includes a method to configure different themes. In the [Readme](/README.md#Widget-theming) you can find more information on how to choose the theme to use. 

Although a theme has to be created before using that function. You can do it following the next steps: 
1. Create the theme file in the [css folder](/lib/src/scss). We recommend using the syntaxt _name_theme.scss. 
2. Import the created file in the global theme file [_themes.scss](/lib/src/scss/_themes.scss) and define here the new theme variables as default or alternative ones.
3. Declare the new theme in [_getThemeFromUrl in the file widget_configuration.dart](/lib/src/widget_configuration.dart), this will allow to use this theme by param. 
4. Optional: You can add this theme as `fallbackTheme` in your yaml to be loaded by default if no other theme has been provided in the load of the widget.  
