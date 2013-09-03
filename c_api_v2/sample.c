#include "c_api_v2.h"
main(int argc, char *argv[])
{
	node *tree=create_tree();
	read_ssf_from_file(tree, argv[1]);
	print_tree(tree);
}

