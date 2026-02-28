# Why

Alchimia is an App construction platform. That can turn itself into a game. That can turn itself into a educational platform. Whatever we could use with that platform, to engage people in learning and developing the software engineering craft.

The reason of this task is that we want to have all the architecture for the Alchimia App consolidated from the day one and avoid future headaches.

# What

You will concern yourself with building the grounds for the three main things on the app:

- Engine: An engine that holds a catalogue of widgets and is capable of rendering everything and interpret code from simple payloads.
- Shell: An interface that makes visualization and edition good for every aspect that we want to inspect from this engine.
- Thematics: The skin and thematics of the engine, which can be customized depending on the visuals that we want and also the stories and gamification strategies we want to introduce.

# How

- You will build a separate package for each of the three parts of the app
- You will create the capability of the engine to render a very simple component: a flutter Container. The engine should be capable of receiving a payload with the type of container with only its properties: height width and color, and then produce a visual output with those.
- You will plug the engine to the shell (as a package dependency)
- You will make the shell interact with the engine in the very simple way:
	- It will show the user a real menu, where it can select from a list of widgets (for now just a container). You can put a square with a text called "box" for now.
	- There will be a rectangular canvas where the user can drag the box from this menu and it will be added to the engine.
	- The canvas then, which is just a shell around the engine output will render the container
- You will make a thematics package that actually implements the visuals that the shell wants. For now nothing special, you can use the flutter theme to do that and for example use the Menlo font family and the appropriate color to show the shell for the user.
- Thematization package is independent from shell and shell is also independent from thematization.
- Shell depends on engine and only this.
- Engine doesn't depend on nothing and is standalone.
- You will call the shell on the main app from the creation route widget, using the thematization implementation and you will need to call the canvas and the menu. Put the menu on the left and the canvas on the side.
- The canvas must be a good size, it's like the phone screen, so it can take a good amount of the desktop, and also of course, must be vertical.

# Final evaluation (after the task is done)

- Everything is working as expected!
- The code is very clean and succint
- Documentation doesnt follow the pattern of dart docs (@macros)
- Sometimes the separation of concerns leaked. For example, the shell has some colors but it needed to be only on the thematics engine. 