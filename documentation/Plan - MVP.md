---
created: 2026-02-25T20:19
updated: 2026-02-26T07:58
---

The plan for the Alchimia app is very simple. 

We want to make software engineering not just easy (AIs are doing that), but actually enjoyable in the sense of using crafts, tools and interactive environments to build what you want.

# Why

This connects heavily to my own childhood where I grew up in a maker environment, doing fun stuff. I started learning programming at 10 with Macromedia Flash, just to do fun animations.

Those animations turned to smaller games until I created a engine inside it. I wanted to abstract the experience of making animations and games. So I always liked to think about the tool.

When I grew up a little bit more, I engaged into mechanics and electronics. More hardware stuff. From there, I learnt the pleasure of having physical tools, of being able to see, measure and touch things.

Then, turning into code again in my career, I have been realizing that we are able to produce a more "human-like"/"physical-like" experience to software engineering. Because software engineering practice is not bad, I do think we have some good tools, but it could be funnier.\

Just writing stuff everytime is boring, we are more than words for some occasions.

# What

Alchimia is an App construction platform. That can turn itself into a game. That can turn itself into a educational platform. Whatever we could use with that platform, to engage people in learning and developing the software engineering craft.

Imagine you having an idea in an afternoon, and instead of just seeing the AI build all the code for you, you be able to visually select all the elements, one by one, as you do in a puzzle? However, the joy of this is that you don't need to read tons and tons of files, words, docs. 

If you could just, see. Or use instruments to inspect. But the majority of things is the WYSIWYG pure philosophy.

If we were cooking, the ingredients would be the source materials and the knifes, blenders, ovens, etc would be the tools to transform them.

If we were in a workshop, we would have the metals and wood and we would cut things with lathes, drills, milling machines. 

So we have the material, which for Flutter are very simple: Widgets. They are the objects of transformation.

And we have the tools. Which are the things that shape our app and produce widgets.

We can inspect our app live, as we can do with Flutter. At the same time, we can inspect any part of it, as we do with Flutter. But we can do like an organism.



# How

The Alchimia app has three domains:

- Engine: An engine that holds a catalogue of widgets as well as ways to connect with them and manipulate them in real time (more real time than hot-reload).
- Shell: An interface that makes visualization and edition good for every aspect that we want to inspect from this engine.
- Thematics: The skin and thematics of the engine, which can be customized depending on the visuals that we want and also the stories and gamification strategies we want to introduce.

## Engine

- For sake of simplicity, we can provide the material_ui and flutter default widgets for the widgets, we use the 5 most used for the MVP.
- Each widget corresponds to an object that can be parsed to JSON, stored and manipulated easily.
- We have a generic stateless widget and a generic stateful widget, that also can be parsed to those objects. 
- Those objects are called WidgetData and they contain information about the type of the widget, its child.
- The WidgetData for stateless widgets are very simple, they just need to contain the child property.
- The WidgetData for stateful widget need to contain logic data, which should be an object called state.
- The state is just a list of serializable properties that itself can be multiple types:
	- Primitives: String, int, double
	- Maps
	- Objects
	- List of those mentioned above
- The logic that connects the widgets is considered isolated from the widgets structure and has its own structure
- The logic object is actually just the definition of function
- For example, the onPressCallback requires a Function object, which contains a list of arguments (such as the state) and returns another type of object.
- Inside the Function object, besides the listOfArguments and return, it also has the list of instructions.
- The list of instructions is just a list of other functions.

## Engine: modifying everything on the run

- We want to be able to inspect every aspect of the engine and also modify it, in real time.
- This means the current state of an application is always subject to individual changes in one of its parts.
- This means that for every WidgetData that we create we have an associated bloc created with it that holds its state information.
- Even the constant informations can be changed, because this will be crucial for the shell layer.
- All state and the information of the app is visible and able to inspect, having for the shell the challenge to present it in a simple way.

## Shell

- The shell is a thin wrapper around the engine which concerns itself mainly on how to dispose information for the user in a sane and simple way. 
- It's concerned mainly with listening to user interactions and menus and translation to the world of the engine, via messages (those messages are just internal methods, as the implementation).
- The shell is capable of viewing any part of the system, including knowing how to render and run everything that the engine provides. So the engine must provide this transpilation and the Shell just executes in the Flutter application layer (engine doesn't need to pass just serialized data, but actual working Widgets). 
- The shell is capable of fully rendering the Application in any screen that also is passed from the engine.


## Thematics

- Thematics just not be confused with just "Theme" or "App UI/Colors/Text", but all the context involved.
- It can be musics, business logics, screens, steps. 
- The only purpose of shell is to provide agnostic interfaces, but the way it's manipulated and actually shown for the user is controlled by the thematics.
- Thematics can provide fun or engaging experiences, intercept anything from the shell (that the shell intercepts from the engine), and put something there. For example, it can play a timer while you debug something, play a music that you choose, invoke an AI wizard to help you out!
- Thematics can interact with anything directly of the shell, without needing the user permission.


## Final considerations

- For the near feature, we can build a code generator because we want to close the loop and make the engine write actual code that could be built outside the engine. That way we also stay reality check and try to make code as simple as possible as it must be exported.
- This is probably feasible right after the first simple working set of things, is not a priority for MVP, but should not be postponed because it can generate huge refactors in the future.
- We will have three phases:
	- Minimal viable code: it's literally just it holding up, with all the structure above mentioned. It's not even MVP because the user can't benefit, it's just a usable working code that validates above planned works. Example: a simple widget (like a button) that can be tapped and run some function. All of this while you can pick it from a menu and drag to a screen and make it visible on the side of the screen at the same time.
	- Beta: With a lack of better naming, this would be more "friends & family" stuff that you share. Something unstable but potential to be share. It must have minimal UI decency, at least three interesting widgets, able to open in your cellphone, something you may be excited, even if very basic.
	- Open to public: from this stage on, we are mature enough to not ridicule ourselves in the "Open to public" journey. It must be stable, the MVP achieved (5) widgets, a theme kind of less resolved (doesn't need to be perfect). It should be pretty usable and people need to be interested to know what's coming more (and a lot of things should be coming because you already validated everything basic and now we can think on more interesting things)
	- Open to public+: This is a very interesting scenario where you can literally build anything you dream of and research on more heavy stuff. Other people might contribute.di

