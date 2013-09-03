#include "c_api_v2.h"
#include <iostream>
using namespace std;

main(int argc, char *argv[])
{
	node *tree=create_tree();
	read_ssf_from_file(tree, argv[1]);
	print_tree_to_file(tree, "output");
}

