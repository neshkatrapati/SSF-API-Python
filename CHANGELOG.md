#CHANGELOG 
## Version 0.0.1a1
* Commit Name : "Added Some Changes"
* Added a method in the C-Api in ssf_functions.h.
		
		// Returns the length of the children given
		// the node.
		int get_length_of_children(node *N){
			return g_list_length(N -> childs);
		}

* New Cython-Wrappers 
	
		/*Gives a nth field of a given node.*/
	    char *get_field(node *N, int number )

	    /* Gives all the fields in string format and returns the string */
	    char *get_fields (node *N )

    	int get_length_of_children(node *N)

    	/*Returns parent of a given node.*/
    	node *get_parent(node *N)

    	/*Modifies a particular field of a given node.
		*returns 1 on success and 0 on failure */
    	int modify_field(node *N, int number,char str[])

## Version 0.0.1a2
* Commit Name : "Docs and Insert Method"
* Added docs using Sphinx documentation.
* New Cython-Wrappers
		
		int insert_node_into_position(node *parent, node *child, int position);
		/* inserts the child at the given position. */
		

