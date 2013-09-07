cdef extern from "stdio.h":
    cdef struct FILE:
        pass

    ctypedef FILE FILE

    FILE *fopen(const char *filename, const char *mode)


cdef extern from "glib.h":
    ctypedef struct GHashTable:
        pass

    ctypedef struct GList:
        pass

cdef extern from "c_api_v2/structures.h":
    ctypedef GList GList
    ctypedef GHashTable GHashTable
    
    cdef struct fs_struct:
        int key_count
        GList *keys
        GHashTable *hash
    
    ctypedef fs_struct fs_struct

    cdef struct or_node:
        int fs_count	
        fs_struct *fs[20]

    ctypedef or_node or_node

    cdef struct node:
        char node_tkn[100]
        char node_tag[100]
        GList *childs
        int child_count
        node *parent
        or_node *OR

    ctypedef node node      
    
    cdef struct list_of_nodes:
        int size
        node **l
    
    ctypedef list_of_nodes list_of_nodes

    cdef struct list_of_or_nodes:
        int size
        or_node **l

    ctypedef list_of_or_nodes list_of_or_nodes

    cdef struct list_of_fs_structs:
        int size
        fs_struct **l

    ctypedef list_of_fs_structs list_of_fs_structs

cdef extern from "c_api_v2/c_api_v2.h":
    ctypedef fs_struct fs_struct
    ctypedef or_node or_node
    ctypedef node node      
    ctypedef list_of_nodes list_of_nodes
    ctypedef list_of_or_nodes list_of_or_nodes
    ctypedef list_of_fs_structs list_of_fs_structs
    ctypedef FILE FILE

    node * create_tree()			

    node * create_node (node *parent)

    node * create_node_with_attr(char tkn[], char tag[], char fs[], node *parent)

    or_node * create_or_node ()

    fs_struct *create_fs_struct()

    void int_to_str(int num,char *str)

    void read_ssf_from_file (node *tree, char filename[])

    or_node * read_or_node( char str[])

    fs_struct *read_fs( char str[])
    
    char *make_fs_struct_to_string ( fs_struct *fs)

    char *get_fields (node *N )

    void print_tree_to_file( node *tree, char file[])

    void print_tree_to_fileptr(node *tree, FILE *f)

    void print_tree(node *tree)

    void print_node_without_index(node *N)

    node *get_nth_child(node *N, int number)

    char *get_field(node *N, int number )

    char *get_fields (node *N )

    int get_length_of_children(node *N)

    node *get_parent(node *N)

    int modify_field(node *N, int number,char str[])

    int insert_node_into_position(node *parent, node *child, int position)

    int delete_node(node *N)
