# Why

To achieve the "build" goal, we need to support visualization and edition of the widgets as they were components in a circuit.

# What

## Terms to be known:

- Widget: Widget is the concept of a UI component as a whole. It isn't just the visual output. It also holds all the logic and the ins and outs required to render that widget.
- Widget Physical Representation: The physical representation of the widget, as they were a special gadget in the physical world. It supports multiple inputs (parameters) and one output (the build) or more (callbacks, etc). Think it as a electronic component or a music equipment that can be plugged-in to other things.
- Widget canvas: It's rendered inside the widget physical representation and is the pure UI signal of that widget, that will be passed to other widgets.
- Widget wire connection: It's literally the physical representation of a wiring connection between a widget and its children. For example, the Main Widget has as inputs an arbirtray number of children. And we could have a box as a child of that main widget. In terms of connection, this would mean that we have a wiring going from the output of Box Widget to the input of the main widget.
- Table: is the physical representation of the background, as circuits were layed out in a table. We can move the camera freely on this table to the side or to another, and the phyisical representation of the widgets must be fixed in this table.

## Requirements:

- We want to support the rendering of the widget physical representation on this table. It's what we already doing with the canvas, but we just encapsulate the canvas inside the physical scaffolding.
- We want to support multiple widgets on the table, and drag and drop them accordingly.
- We want to be able to connect, disconnect and reconnect any input to any output via wiring.
- We want to be able to see the outputs and inputs as fixed on the side of the physical representation and see their labels with a text.
- All of this must be reflected on the widget tree of the main canvas.

# How

- The main canvas must be moved inside a proper "Main widget". You can create a separate widget just for that on the engine, and represent very similar to what it's represented now on the shell.
- When we add a new box inside the main canvas, it must show the physical representation of the widget laid out on the table, by the side of the physical main widget, and of course, connected via the wire.
- You can consider neutral colors for the wire, and use the "coding" text theme from the thematization you already is provided to. Remebmer: any definition on colors, etc. must be done on this layer.
- For the physical representation of the widget and the canvas inside, you can create a nested Flutter widget that has the scaffolding part (that we can adjust the ui later), with a border and a padding, and inside of it the canvas itself which just renders the widget, with no UI changes.
- Does not implement the moving part of the table, just consider it as a context that we implement in next iterations.

# Final evaluation

- It produced overall good results, I would say a 80%. The rest 20% is that it doesn't allow me to delete/rewire and also the wires are plain bezier, which doesn't fit nicely when the widgets are on the other side of the connection.
- Another thing that bothered me in the code is that we have a physical representation for the main widget and also for separate widgets. They must be abstracted as the same thing.