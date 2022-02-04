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
int g_module_pub_x;

// local variable
static int g_module_loc_x;

// external variable
extern int g_main_pub_x;

// Functions

// public function
int tool_fun_pub()
{
  g_main_pub_x = 40;
  //g_main_loc_x = 30; // impossible
  g_module_pub_x = 20;
  g_module_loc_x = 10;
}

// local function
static int tool_fun_loc()
{
  g_main_pub_x = 100;
  //g_main_loc_x = 200; //impossible
  g_module_pub_x = 300;
  g_module_loc_x = 400;
}

