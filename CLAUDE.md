# Alchimia

- This is a default Flutter app that runs primarily on Desktop.
- We favor clear and concise code, always well documented.
- We favor very well-written unit tests because this application is planned to be very big and complex, and we want to be able to refactor it without fear of breaking things.
- We favor the creation of packages to separate concerns and make the code more modular and reusable.

## Structure

- All routes are defined in `lib/app/app_router.dart`.
- Packages are defined in `packages`.



## Workflow

Mainly those two agents come in play in separate moments of the development process. First:

- `flutter-architect`: Helps writing the overall plan and removing any ambiguity from the requirements and acceptance criteria. It's the one responsible for writing the plan and giving instructions to the `flutter-expert-builder` agent.

Then:
- `flutter-expert-builder`: Responsible for writing the planned code and tests, following the instructions given by the `flutter-architect` agent. It can ask for clarification to the `flutter-architect` agent if something is not clear to it.

And at the end:
- `flutter-architect`: Reviews the code written by the `flutter-expert-builder` agent and gives feedback on how to improve it, not only in terms of functionality but also in terms of readability, maintainability, and scalability. It also gives feedback on how to improve the tests, not only in terms of coverage but also in terms of quality and relevance.

This workflow is not strict, and it can be iterated as many times as needed until the code is good enough.

## Documentation

Key folders to be aware and can be used for your tasks:

- `documentation`: The parent folder for everything documented. It contains:
- `product`: The parent folder for everything related to the product, such as the product requirements and acceptance criteria.
- `product/brainstorming`: It's encouraged to use this folder for any brainstorming that will be useful for later reference with the PM.
- `product/ready_to_development`: Always consider this as the root folder for tackling new things
- `engineering`: The parent folder for everything related to the architecture, such as the architectural discussions, decisions, and guidelines.
- `engineering/brainstorming`: Use it to promote discussions between agents in MD files.