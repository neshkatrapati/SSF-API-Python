#CHANGELOG 
## Version 0.0.1
* Commit Name : "Added Some Changes"
### Changes
* Added a method in the C-Api in ssf_functions.h.
	
		int get_length_of_children(node *N){
			return g_list_length(N -> childs);
		}
