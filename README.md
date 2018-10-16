# Notifications v1.0 for Multi Theft Auto
> Powered by **animate.css**
>https://daneden.github.io/animate.css/
## About

This is a resource which allows scripters to easily create beautiful on-screen notifications for Multi Theft Auto.

The notifications can be fully customized with CSS styles.

There are 4 types of notifications: ``info``, ``warning``, ``error`` and ``success``. Please see the example below.

> Default and custom notifications

> ![
](https://i.imgur.com/3OuaCdl.png)

## Getting Started

> **Note:** Make sure the resource is started before running any of the code below.
#### Example
```lua
local notify = exports.notifications

notify:info("Hello there!")
notify:warning("Warning!!")
notify:error("An error has occured...")
notify:success("Mission passed!")
```
#### Options
You can supply an options table as the second argument to change a notification's style and behaviour.
```lua
local options = {
	animIn = "lightSpeedIn",
	animOut = "hinge"
	animDuration = 1,
	animOutDelay = 4,
	animInDelay = 0
}

notify:info("Hello there!", options)
```
#### Custom CSS styles
You can apply custom styles by supplying a style table in the options table. The style names are the same as CSS styles used within javascript where you'd do ``body.style.fontSize = '24px';``.
```lua
local options = {
	style = {
		backgroundColor = "rgba(0, 0, 0, 0.5)",
		fontSize =  "20px",
		borderRadius =  "0",
		marginBottom =  "0"
	}
}

notify:info("Hello there!", options)
```
#### Animation Types
Please visit https://daneden.github.io/animate.css/ for a complete list of animation types.
## Options Table
A list of options and what each one does.

| Key | Description |
|--|--|
| animIn | Set the fade-in animation type. Check out https://daneden.github.io/animate.css/ to find a list of animation types. Defaults to ``rubberBand`` |
| animOut | Set the the fade-out animation type. Check out https://daneden.github.io/animate.css/ to find a list of animation types. Defaults to ``flipOutY`` |
| animDuration | This sets the duration of both fade-in/out animations. A high number means slower animations and low means faster animations. Defaults to ``1``|
| animInDelay | Set how many seconds it takes before the first animation kicks in. Defaults to ``1``|
| animOutDelay | This will change how many seconds the notification lasts before the last animation kicks in. Defaults to ``4``|
| style | A table with CSS styles. See example. |
