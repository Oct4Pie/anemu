
# Scrcpy for apple silicon

<img src="https://github.com/Genymobile/scrcpy/raw/master/app/data/icon.svg" width="128" height="128" alt="scrcpy" align="right" />

This project attempts to enhance [scrcpy](https://github.com/Genymobile/scrcpy), an application for controlling Android devices from a desktop. The focus is on expanding keymapping functionalities to improve the experience of playing Android games on Apple Silicon Macs. The improvements include directional texture handling, key mapping, and dynamic configuration through JSON, and an interactive toolbar for quick access to action buttons.

## Features

- **Directional Textures:**  Improves the gaming experience by enhancing user interaction.
- **Dynamic Key Mapping:** Enables to dynamically configure key mappings through a graphical interface and allows for customized control schemes best for gaming.
- **JSON Configuration:** For easy sharing and modification of control schemes by supporting saving and loading configurations as JSON files.
- **Interactive Toolbar:** A new toolbar that includes quick access buttons for functions like minimize, close, and other customizable actions.

## Demo
https://github.com/Oct4Pie/anemu/assets/65843843/d8e5f8bc-ee9b-4393-bcce-4ecaa11730dd

## Getting Started

### Prerequisites

Make sure the following libraries are installed on your system:
- SDL2
- SDL2_image
- SDL2_ttf
- cJSON
- Android Studio (if creating custom AVD instances)

These can be installed using [Homebrew](https://brew.sh):

```bash
brew install sdl2 sdl2_image sdl2_ttf cJSON
```

### Building

1. **Clone the repository**:
   ```bash
   git clone --recurse-submodules https://github.com/oct4pie/anemu.git
   ```
2. **Navigate to the cloned directory**:
   ```bash
   cd anemu/scrcpy
   ```
3. **Compile the project** (ensure paths are correctly adjusted):
   ```bash
   meson setup x --buildtype=release --strip -Db_lto=true --optimization=3  -Db_pgo=generate -Dprebuilt_server=/path/to/scrcpy-server --reconfigure --prefix=/path/to/prefix --datadir=/path/to/prefix-or-custom/scrcpy.app/Contents/Resources && ninja -Cx install
   ```

### Usage

Depending on the compilation process, either execute the compiled binary from the build directory:

```bash
./x/app/scrcpy
```

or simply run the generated `scrcpy.app` from the specified prefix

You can use the graphical interface to configure key mappings specific to your gaming needs. These mappings can be saved to and loaded from JSON files for easy management.

### Configuring Key Mappings

The application provides a dynamic graphical interface that allows for control setup:

- **Circle Triggers**: Use the interface to create and configure circles that represent different key mappings. When you select a circle and press a keyboard key, the circle will register to that key. The key presses will trigger actions assigned to that circle.

- **Draggable Circles**: Each circle can be dragged across the screen to specify the exact location of the trigger. This feature is useful for aligning control schemes with specific game interfaces or preferences.
- Also, see [Keymap Shortcuts](#keymap-shortcuts)

### Saving and Loading Configurations

- **Save Configurations**: After setting up your controls, you can save your configurations to a JSON file. This allows to preserve your setup across different gaming sessions or share it with others.
  
- **Load Configurations**: You can load your saved configurations from a JSON file that allows for quick setup changes and easy sharing between devices and users.

## Downloading the Application

A pre-compiled `.app` bundle of this project is available in the [Releases](https://github.com/oct4pie/anemu/releases) section of the GitHub repository. This bundle is  packaged for macOS, on Apple Silicon Macs. 

### How to Download and Use the `.app` Bundle

1. **Navigate to Releases**:
   - Visit the [Releases page](https://github.com/oct4pie/anemu/releases) of the repository.
   - Look for the latest release that includes the `.app` bundle.

2. **Download the `.app` Bundle**:
   - Click on the `.app` file under the "Assets" section of the release to download it.

3. **Open the Application**:
   - Once downloaded, double-click on the `.app` file to open it.
   - If macOS displays a security warning because the app was downloaded from the internet, right-click the `.app` file and select `Open` to launch it anyway. This will register an exception in your macOS security settings.


### Setting Up the Android Emulator

You have two options to set up an Android emulator for connecting via `scrcpy`:

1. **Using Android Studio**:
   - Open Android Studio and navigate to the AVD Manager.
   - Click on "Create Virtual Device" and select a device configuration that suits your needs.
   - Choose an Android version and download the system image if it's not already available.
   - Once the setup is complete, start the AVD from the AVD Manager.

2. **Using the Preconfigured Emulator via `setup.sh`**:
   - Run the `setup.sh` script included in the repository to automatically download and set up a preconfigured emulator:
     ```bash
     ./setup.sh
     ```
   - This script will set up an emulator with specific configurations optimized for use with `scrcpy`, including all necessary tools and a system image with Google APIs (Google Play enabled).
   - Run the emulator:
       ```bash 
       cd android_files && ./start.sh
       ```

## Keymap Shortcuts

These keyboard shortcuts are designed to enable quick modifications and  management of key mappings in a dynamic, interactive environment:

| Action                    | Shortcut    | Description                                    |
| ------------------------- | ----------- | ---------------------------------------------- |
| Add Circle                | `Cmd + "+"` | Adds a new circle for key mapping              |
| Remove Selected Circle    | `Cmd + "-"` | Removes the currently selected circle         |
| Save Configuration        | `Cmd + S`   | Saves the current configuration to a JSON file |
| Load Configuration        | `Cmd + O`   | Loads a configuration from a JSON file         |
| Add Gesture Circle        | `Cmd + L`   | Adds a circle  for mouse controls              |
| Add Joystock Circles      | `Cmd + J`   | Adds 4 circles  for joystick controls          |
| Toggle Keymapping Mode    | `Cmd + K`   | Toggles the keymapping mode on and off         |
| Toggle Keymapping Capture | `Cmd + E`   | Toggles the capture state of inputs            |

Also, see [scrcpy shortcuts](https://github.com/Genymobile/scrcpy/blob/master/doc/shortcuts.md)

## Contributing

Encountering bugs is a part of the development process, especially in a project that tries to extend functionality in new directions. If you encounter any issues or have suggestions for improvements:
- Please open an issue on the GitHub repository with a detailed description of the bug and relevant details to reproduce it.
- Screenshots or logs that provide additional context are highly appreciated.

Contributions that enhance or extend the functionality are welcome. Please submit a pull request or open an issue to discuss your ideas.

## To-Do

- **Organizing the Structure of Added Functions**: Streamline the architecture of newly added functionalities to improve maintainability and scalability.
- **Handling Multiple Gesture Inputs**: Implement support for simultaneous multiple gesture inputs, especially multiple mouse support
- **Adding Mouse Keys to Keymapping**: Add mouse keys into the keymapping options
- **Allowing User Custom Configuration**: Allow users to create and modify their configurations through an interface.
## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.

## Acknowledgments
-  Thanks to the original `scrcpy` project for providing the foundation.
