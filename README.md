# Notifications v0.1 for Multi Theft Auto
> Powered by animate.css
>https://daneden.github.io/animate.css/
## About

This is a resource which allows scripters to easily create beautiful on-screen notifications for Multi Theft Auto.

There are 4 types of notifications: ``info``, ``warning``, ``error`` and ``success``. Please see the example below.

## Example
```lua
local notify = exports.notifications

notify:info("Hello there!")
notify:warning("Warning!!")
notify:error("An error has occured...")
notify:success("Mission passed!")
```
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
		backgroundColor = "rgba(0,0,0,0.5)",
		fontSize =  "20px",
		borderRadius =  "5px",
		marginBottom =  "0"
	}
}
notify:info("Hello there!", options)
```
## Options
| Key | Description |
|--|--|
| animIn | Set the the fade in animation name. Check out https://daneden.github.io/animate.css/ to find a list of options. Defaults to ``rubberBand`` |
| animOut | Set the the fade out animation name. Check out https://daneden.github.io/animate.css/ to find a list of options. Defaults to ``flipOutY`` |
| animDuration | Set the duration of the animations. A high number means long animations and low means slow animations. Defaults to ``1``|
| animInDelay | Set the delay in seconds before the fade in animation starts. Defaults to ``1``|
| animOutDelay | Set the delay in seconds before the fade out animation starts. This will change how long the notification will be visible before it fades out. Defaults to ``4``|
| style | A table with CSS styles. See example. |
#### Animation types
Please visit https://daneden.github.io/animate.css/ for a complete list of animation types.
