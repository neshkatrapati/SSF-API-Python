cimport cstructures
cimport libc.stdio



cdef class fs_struct:
	cdef cstructures.fs_struct *_fs_struct
	def __cinit__(self):
		pass

cdef class or_node:
	cdef cstructures.or_node *_or_node
	def __cinit__(self):
		pass
	
cdef class node:
	cdef cstructures.node *_node
	def __cinit__(self):
		self._node = cstructures.create_tree()

	def read_ssf_from_file(self,char *file_name):
		#cdef libc.stdio.FILE *fp = libc.stdio.fopen(file_name,"r")
		cstructures.read_ssf_from_file(self._node,file_name)

	def print_tree(self):\
		cstructures.print_tree(self._node)

	def __str__(self):
		pass
		


cdef class list_of_nodes:
	cdef cstructures.list_of_nodes *_list_of_nodes
	def __cinit__(self):
		pass

cdef class list_of_or_nodes:
	cdef cstructures.list_of_or_nodes *_list_of_or_nodes
	def __cinit__(self):
		pass

cdef class list_of_fs_structs:
	cdef cstructures.list_of_fs_structs *_list_of_fs_structs
	def __cinit__(self):
		pass
