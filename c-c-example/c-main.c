//***************************************************************************
//
// Program for education in subject "Assembly Languages" and "APPS"
// petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
//
// Example of linking of two modules in C.
//
//***************************************************************************

#include <stdio.h>

// Variables

// public global variable
int g_main_pub_x;

// local variable
static int g_main_loc_x;

// external variable
extern int g_module_pub_x;

// Functions

// public function
int main_fun_pub()
{
  g_main_pub_x = -3;
  g_main_loc_x = -2;
  g_module_pub_x = -1;
  //g_module_loc_x = 0; // impossible
}

// local function
static int main_fun_loc()
{
  g_main_pub_x = 1;
  g_main_loc_x = 2;
  g_module_pub_x = 3;
  //g_module_loc_x = 0; // impossible
}

// external function
extern int tool_fun_pub();
extern int tool_fun_loc();


// print function
int print()
{
  printf( "g_main_pub_x=%d g_main_loc_x=%d g_module_pub_x=%d\n", 
          g_main_pub_x, g_main_loc_x, g_module_pub_x );
}

int main()
{
  main_fun_loc();
  print();
  main_fun_pub();
  print();
  tool_fun_pub();
  print();
  //tool_fun_loc(); // impossible
  //print();
}
