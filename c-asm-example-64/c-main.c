//***************************************************************************
//
// Program for education in subject "Computer Architecture and Paralel Systems""
// petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
//
// Examples of addresing global variables
//
//***************************************************************************

#include <stdio.h>
#include <stdint.h>

#define N       10
#define LEN     128

// Functions ****************************************************************

// assign a constant into global variables
void set_variables();
// move value from g_value into g_index
void move_int_values();
// move value from g_character into g_integer
void move_char_to_int();
// move value from g_integer into g_longint
void move_int_to_long();

// rewrite content of global string
void set_string();
// rewrite content of global array
void set_int_array();
// rewrite content of global array
void set_long_array();

// rewrite one character of g_string at g_index position
void set_string_index();
// rewrite one element of g_int_array at g_index position
void set_int_array_index();
// rewrite one element of g_long_array at g_index position
void set_long_array_index();

// rewrite one character of g_string at g_index position with g_value
void set_int_array_index_value();
// rewrite one element of g_int_array at g_index position with g_value
void set_long_array_index_value();
// rewrite one element of g_long_array at g_index position with g_value
void set_string_index_value();


// Variables ****************************************************************

// global variables
char g_character = '\0';
int32_t g_integer = 0;          // equivalent to int
int64_t g_longint = 0;          // equivalent to long

int32_t g_index = 0;
int32_t g_value = 0;

// global arrays
char g_string[ LEN ] = "Hello World!";
int32_t g_int_array[ N ] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
int64_t g_long_array[ N ] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };


// Code *********************************************************************

void print_int_array()
{
    printf( "g_int_array: " );
    for ( int i = 0; i < 10; i++ )
        printf( "%d ", g_int_array[ i ] );
    printf( "\n\n" );
}

void print_long_array()
{
    printf( "g_long_array: " );
    for ( int i = 0; i < 10; i++ )
        printf( "%ld ", g_long_array[ i ] );
    printf( "\n\n" ); 
}

// Main *********************************************************************

int main()
{
    // assign a constant into global variables
    set_variables(); 
    printf( "g_character:'%c', g_integer:%d, g_longint:%lx\n\n", 
            g_character, g_integer, g_longint );

    // select code you want to test

#if 1 // move value from g_value into g_index
    g_value = 333;
    g_index = 0;
    move_int_values();
    printf( "g_value: %d, g_index: %d\n\n", g_value, g_index );
#endif
#if 1 // move value from g_character into g_integer
    g_character = 111;
    g_integer = 0;
    move_char_to_int();
    printf( "g_character: %d, g_integer: %d\n\n", g_character, g_integer );
#endif
#if 1 // move value from g_integer into g_longint
    g_integer = 1200300400 ;
    g_longint = 0;
    move_int_to_long();
    printf( "g_integer: %d, g_longint: %ld\n\n", g_integer, g_longint );
#endif
#if 1  // rewrite content of global string
    set_string();     
    printf( "g_string:'%s'\n\n", g_string );
#endif
#if 0 // rewrite content of global array
    set_int_array();
    print_int_array();
#endif
#if 0 // rewrite content of global array
    set_long_array();
    print_long_array();
#endif
#if 0 // rewrite one character of g_string at g_index position
    g_index = 1;
    set_string_index();
    g_index = 3;
    set_string_index();
#endif
#if 0 // rewrite one element of g_int_array at g_index position
    g_index = 5;
    set_int_array_index();
    g_index = 6;
    set_int_array_index();
    print_int_array();
#endif
#if 1 // rewrite one element of g_long_array at g_index position
    g_index = 4;
    set_long_array_index();
    g_index = 5;
    set_long_array_index();
    print_long_array();
#endif
#if 0 // rewrite one character of g_string at g_index position with g_value
    g_value = 'h';
    g_index = 0;
    set_string_index_value();
    g_value = 'E';
    g_index = 1;
    set_string_index_value();
    printf( "g_string:'%s'\n\n", g_string );
#endif
#if 0 // rewrite one element of g_int_array at g_index position with g_value
    g_value = 2020;
    g_index = 0;
    set_int_array_index_value();
    g_value = 2021;
    g_index = 1;
    set_int_array_index_value();
    print_int_array();
#endif
#if 1 // rewrite one element of g_long_array at g_index position with g_value
    g_value = -2020;
    g_index = 0;
    set_long_array_index_value();
    g_value = -2021;
    g_index = 1;
    set_long_array_index_value();
    print_long_array();
#endif

    return 0;
}


