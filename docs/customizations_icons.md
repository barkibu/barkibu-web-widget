# Icon Customizations

The project has different images that you can customize for the experience of your clients with your own brand icons. 

## Brand Icon 

Brand Icon is configurable in the Yaml File, but first you have to place the icon in the [images folder](/web/assets/images). After that, you only have to put the path in the `brandLogo` feature flag of your yaml file. Additionally, you can configure the maximum size of this icon using another feature flag, `brandLogoWidth`.

## Application Icons

Application Icons are those integrated into the project through the [icon-component](lib/src/icons/icon_component.html). This component allows to encapsulate the way to use the icon. You will declare an `icon-component` with a specific type, and the right icon will be loaded. All the icons in the project are declared in the [icon-component](lib/src/icons/icon_component.html), except the brand icon.

There are two different ways to change an application icon:
* Replacing the .html content of each icon with a new SVG icon. 
* Creating a rule to manage different versions of icons in [icon-component](lib/src/icons/icon_component.html). You can add a new feature flag in your Yaml file and use it in the [icon-component](lib/src/icons/icon_component.html) to select wich icon you want to load (default or a new icon). You will have to create the new icon component too (.dart, .html and .scss) and declare it in the [icon-component.dart](lib/src/icons/icon_component.dart). This option allows you to manage different versions of the same type of icon. 
