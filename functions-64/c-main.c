//***************************************************************************
//
// Program for education in subject "Assembly Languages"
// petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
//
// Implementation of functions with parameters
//
//***************************************************************************

#include <stdio.h>

// functions prototypes
// sum of two int
int sum_int( int t_a, int t_b );

// sum of two long
long sum_long( long t_a, long t_b );

// char t_c is in range?
int char_in_range( char t_c, char t_low, char t_high );

// sum of array
int sum_int_array( int *t_array, int t_N );

// average of array
int average_int_array( int *t_array, int t_N );

// length of string 
long strlength( char *t_str );

// division of two int with remainder
int division_int( int t_a, int t_b, int *t_remainder );

// division of two long with remainder
long division_long( long t_a, long t_b, long *t_remainder );

// string mirror
char *strmirror( char *t_str );

// convert int to string
char *int2str( int t_number, char *t_str );

// length of string with string instruction
long strlength2( char *t_str );

// remove spaces from string
char *strnospaces( char *t_str );

int main()
{
    printf( "Sum of two numbers: %d\n\n", sum_int( 1111, 2222 ) );
    printf( "Sum of two numbers: %ld\n\n", sum_long( 1111111111111, 2222222222222 ) );

    printf( "Char %s in range.\n", char_in_range( 'v', 'a', 'z' ) ? "is" : "is not" );
    printf( "Char %s in range.\n\n", char_in_range( 'V', 'a', 'z' ) ? "is" : "is not" );

    int i_array[ 10 ] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    printf( "Sum of array elements: %d\n\n", sum_int_array( i_array, 10 ) );
    printf( "Average of array elements: %d\n\n", average_int_array( i_array, 10 ) );

    int remainder_int;
    long remainder_long;
    printf( "Division of two numbers: %d\n", division_int( 100, 31, &remainder_int ) );
    printf( "Remainder after division: %d\n\n", remainder_int );
    printf( "Division of two numbers: %ld\n", division_long( 100000000000, 31000000000, &remainder_long ) );
    printf( "Remainder after division: %ld\n\n", remainder_long );

    char strformirror[] = "String before mirror.";
    printf( "Lenght of string is %ld\n", strlength( strformirror ) );
    printf( "Mirrored string: '%s'\n\n", strmirror( strformirror ) );

    char str[ 32 ];
    printf( "Positive number:  %s\n", int2str( 7621, str ) );
    printf( "Zero           :  %s\n", int2str( 0, str ) );
    printf( "Negative number:  %s\n\n", int2str( -2389, str ) );

    char mezery[] = "  T e xt w a  s fu l l   o f spa c e s.   ";
    printf( "String length before: %ld\n", strlength2( mezery ) );
    printf( "Text bez mezer: '%s'\n", strnospaces( mezery ) );
    printf( "String length after:  %ld\n", strlength2( mezery ) );

}

