# Real-time Echo Cancellation Demo

A C++ application that demonstrates real-time acoustic echo cancellation using PortAudio and SpeexDSP libraries.

## Overview

This application captures audio from your microphone and system audio, applies echo cancellation using the SpeexDSP library, and outputs the cleaned audio in real-time. It's designed to reduce echo and feedback in audio applications.

## Features

- Real-time audio processing at 16kHz sample rate
- Acoustic echo cancellation using SpeexDSP
- Noise reduction and preprocessing
- Cross-platform audio I/O with PortAudio
- Configurable filter length and frame size

## Prerequisites

- Windows 10/11 (tested)
- Visual Studio 2019/2022 with C++ support
- CMake 3.15 or higher
- vcpkg package manager

## Dependencies

- **PortAudio**: Cross-platform audio I/O library
- **SpeexDSP**: Audio processing library for echo cancellation and noise reduction

## Installation

### 1. Clone the repository
```bash
git clone <your-repo-url>
cd aec_demo/demo
```

### 2. Install dependencies with vcpkg
```bash
# From the aec_demo directory
.\vcpkg\vcpkg.exe install portaudio:x64-windows
.\vcpkg\vcpkg.exe install speexdsp:x64-windows
```

### 3. Build the project
```bash
# From the demo directory
cmake -B build -S . -DCMAKE_TOOLCHAIN_FILE=../vcpkg/scripts/buildsystems/vcpkg.cmake
cmake --build build --config Release
```

### 4. Copy required DLLs
```bash
copy "..\vcpkg\installed\x64-windows\bin\*.dll" ".\build\Release\"
```

## Usage

Run the application from PowerShell:
```bash
cd C:\path\to\aec_demo\demo
.\build\Release\aec_demo.exe
```

The application will:
1. Initialize PortAudio and detect audio devices
2. Open microphone input, system audio reference, and speaker output streams
3. Start real-time echo cancellation processing
4. Display "Starting real-time echo cancellation. Press Ctrl+C to stop."

**To stop**: Press `Ctrl+C`

## Configuration

You can modify the audio parameters in `main.cpp`:

```cpp
const int SAMPLE_RATE = 16000;        // Sample rate in Hz
const int FRAME_SIZE = 160;           // Frame size (10ms at 16kHz)
const int FILTER_LENGTH = FRAME_SIZE * 10; // Echo tail length (100ms)
```

## Architecture

```
┌─────────────┐    ┌──────────────┐    ┌─────────────┐
│ Microphone  │───▶│    Echo      │───▶│  Speakers   │
│   Input     │    │ Cancellation │    │   Output    │
└─────────────┘    │   (SpeexDSP) │    └─────────────┘
                   │              │
┌─────────────┐    │              │
│ System Audio│───▶│              │
│ Reference   │    │              │
└─────────────┘    └──────────────┘

## Troubleshooting

### Application exits immediately
- Ensure microphone permissions are enabled in Windows Settings
- Check that audio devices are connected and working
- Verify DLL files are in the same directory as the executable

### Audio quality issues
- Adjust `FILTER_LENGTH` for different echo tail lengths
- Modify `FRAME_SIZE` for different latency/quality trade-offs
- Check audio device sample rate compatibility

### Build errors
- Ensure vcpkg toolchain path is correct
- Verify all dependencies are installed for x64-windows triplet
- Check that Visual Studio C++ tools are installed

## Known Limitations

- Currently uses default input/output devices only
- System audio capture may require specific loopback device setup
- No GUI for real-time parameter adjustment

## Acknowledgments

- [PortAudio](http://www.portaudio.com/) - Portable audio I/O library
- [Speex](https://www.speex.org/) - Audio codec and processing library
- [vcpkg](https://github.com/Microsoft/vcpkg) - C++ package manager
