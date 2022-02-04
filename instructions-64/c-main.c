//***************************************************************************
//
// Program for education in subject "Computer Architectures and Paralel Systems"
// petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
//
// Usage of Arithmetic and Bitwise Instruction
// Usage of Conditional Jumps
//
//***************************************************************************

#include <stdio.h>

// Functions ****************************************************************

// move low nibbles from g_int_val1 to g_int_val2
void move_low_nibbles();
// compute mean value of g_long_array
void mean_long_array();
// multiply g_int_number by 10 using shl and add
void mult_int_number_10();
// mean value of g_int_array
void mean_int_array();
// count odd numbers in g_int_array
void odd_numbers_int_array();
// count lenght of g_char_array
void char_array_length();
// replace digits in g_char_array with g_char_replace
void char_array_replace();


// Variables ****************************************************************

int g_int_val1 = 0xABACDEDF;
int g_int_val2 = 0x12345678;
int g_int_number = 333333;

long g_long_array[ 4 ] = { 1010, 7070, 2020, 6060 };
long g_long_mean = 0;

int g_int_array[ 8 ] = { 11, 22, 33, 44, 55, 66, 77, 88 };
int g_int_mean = 0;
int g_odd_numbers = 0;

char g_char_array[] = "Earth radius is 6 378 km.";
char g_char_array_len = 0;
char g_char_replace = '_';

// Main *********************************************************************

int main()
{
    move_low_nibbles();
    printf( "Move bits: g_int_val1: %08X, g_int_val2: %08X\n", g_int_val1, g_int_val2 );

    mean_long_array();
    printf( "Mean value of g_long_array: %ld\n", g_long_mean );

    mult_int_number_10();
    printf( "Number multiplied by 10: %d\n", g_int_number );

    mean_int_array();
    printf( "Mean value of g_int_array: %d\n", g_int_mean );

    odd_numbers_int_array();
    printf( "Odd numbers in g_int_array: %d\n", g_odd_numbers );

    char_array_length();
    printf( "Length of char_array is: %d\n", g_char_array_len );

    char_array_replace();
    printf( "String with replaced digits: '%s'\n", g_char_array );

}

