# RGB to Grayscale Image Conversion

The project aims to convert an RGB (Red, Green, Blue) image to a grayscale image. The specifications include:

- Input: A 3D array representing an RGB image (width x height x 3 color channels)
- Output: A 2D array representing a grayscale image (width x height)
- The conversion should be done using assembly language, callable from C
- The project is for a Windows environment using x64 NASM assembly and C99

## Purpose of Assembly Code:
The assembly code (asm_rgb.asm) is responsible for the core image conversion algorithm.
- Efficiently process each pixel of the input RGB image
- Calculate the grayscale value for each pixel by averaging its R, G, and B values
- Store the resulting grayscale values in the output array
- Handle the low-level memory access and arithmetic operations for performance

The assembly code is designed to be called from C, taking parameters for the input and output image pointers, as well as the image dimensions.
## Purpose of C Code:
- Set up the test data: It defines a sample 3x3 RGB image as input
- Provide the main program structure and flow control
- Handle input/output operations (printing the original and converted images)
- Interface with the assembly code by declaring the external function and calling it
- Allocate memory for the input and output images
- Demonstrate how to use the assembly function in a C program


It continues this process for all pixels in the image.

### Built Using
* ![ASSEMBLY](https://img.shields.io/badge/_-ASM-6E4C13.svg?style=for-the-badge)
* ![C](https://img.shields.io/badge/_-C-555555.svg?style=for-the-badge)

## Prerequisites

Before running this project, ensure you have the following installed on your system:
- NASM (Netwide Assembler)
- TDM-GCC (GCC for Windows)

## Files

- `c_rgb.c`: The main C program that sets up the RGB image and calls the assembly function.
- `asm_rgb.asm`: The assembly file that contains the function to convert the RGB image to grayscale.

## Usage
You should manually execute these 3 commands in order to run the program. If you're using VS Code terminal to run the executable, run it like this: `.\c_rgb.exe`.

### Option 1
1. **Compile the assembly file**:
    ```bash
    nasm -f win64 asm_rgb.asm -o asm_rgb.o
    ```

2. **Compile the C file and link it with the assembly object file**:
    ```bash
    gcc -std=c99 -o c_rgb c_rgb.c asm_rgb.o
    ```

3. **Run the executable**:
    ```bash
    c_rgb.exe
    ```
