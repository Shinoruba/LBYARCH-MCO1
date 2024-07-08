#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern void cvtRGBToGray(uint8_t *img2, uint8_t *img1, int m, int n);

int main() 
{
    int m = 3; // width
    int n = 3; // height
    uint8_t img1[3][3][3] = {
        {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}},
        {{1, 2, 6}, {2, 6, 7}, {9, 4, 8}},
        {{1, 5, 7}, {1, 3, 3}, {3, 4, 6}}
    };
    uint8_t img2[3][3] = {0}; // leave this '0' pls

    // Print: Original Image <-- Debugger lang, to make sure the program runs hehe
    printf("Original Image:\n");
    for (int i = 0; i < n; ++i) 
    {
        for (int j = 0; j < m; ++j) 
        {
            printf("(%d, %d, %d) ", img1[i][j][0], img1[i][j][1], img1[i][j][2]);
        }
        printf("\n");
    }

    cvtRGBToGray(&img2[0][0], &img1[0][0][0], m, n);
    
    // Print: Check if the function call returned <-- Also to debug, to make sure the program is/was called hehe
    printf("\nAssembly function called\n");

    // Print: Grayscale image = (R + G + B) / 3
    printf("Grayscale Image:\n");
    for (int i = 0; i < n; ++i) 
    {
        for (int j = 0; j < m; ++j) 
        {
            printf("%d ", img2[i][j]);
        }
        printf("\n");
    }
    return 0;
}
