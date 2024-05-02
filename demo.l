%option reentrant
%option bison-bridge
%option bison-locations
%option noyywrap
%option extra-type="myextra *"

%top{
#include "demo.tab.h"
}

%%

