//***************************************************************************
//
// Program for education in subject "Assembly Languages" and "APPS"
// petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
//
// Usage of variables in Assembly language
//
//***************************************************************************

#include <stdio.h>

#define L 10

// global public variables
char g_c_hello[] = "Good message for all programmers!";
int g_c_array[ L ] = { 4, 8, 12, 16, 20, 24, 28, 32, 36, 40 };
int g_c_array_length = L;
int g_c_int = 3333;
char g_c_byte = 99;
int g_c_4chars = 0x454C4946;

// external variables
extern int g_a_int;
extern int g_a_first_last[];
extern int g_a_byte_int;
extern char g_a_4chars[];

// external function
void access_int();
void access_char();
void access_array();
void access_string();

int main()
{
    access_int();
    printf( "Variables g_c_int=%d, g_a_int=%d\n", g_c_int, g_a_int );

    access_char();
    printf( "Variables g_c_byte a g_a_byte_int %d=%d\n", g_c_byte, g_a_byte_int );

    access_array();
    printf( "First and last member of array g_c_array: %d %d\n", 
                g_c_array[ 0 ], g_c_array[ L - 1 ] );
    printf( "Content of array g_a_first_last: %d %d\n", 
                g_a_first_last[ 0 ], g_a_first_last[ 1 ] );

    printf( "Original  g_c_hello: '%s'\n", g_c_hello );
    access_string();
    printf( "Modifies  g_c_hello: '%s'\n", g_c_hello );
    printf( "Retezec g_a_4chars: '%s'\n", g_a_4chars );
}

