cimport cssf
cimport libc.stdio



cdef class fs_struct:
	cdef cssf.fs_struct *_fs_struct
	def __cinit__(self):
		pass

cdef class or_node:
	cdef cssf.or_node *_or_node
	def __cinit__(self):
		pass
	
cdef class node:
	cdef cssf.node *_node_obj
	def __cinit__(self):
		self._node_obj = cssf.create_tree()
		
	def read_ssf_from_file(self,char *file_name):
		#cdef libc.stdio.FILE *fp = libc.stdio.fopen(file_name,"r")
		cssf.read_ssf_from_file(self._node_obj,file_name)

	def print_tree(self):
		cssf.print_tree(self._node_obj)

	def __getitem__(self,n):
		return self.get_nth_child(n)

	def get_nth_child(self,int n):
		cdef cssf.node *nd = cssf.get_nth_child(self._node_obj,n)
		cdef node ndd = node()
		ndd._node_obj = nd
		return ndd

	def get_field(self,int n):
		cdef char* field = cssf.get_field(self._node_obj,n)
		return str(field)

	def get_fields(self):
		cdef char* fields = cssf.get_fields(self._node_obj)
		return fields

	# Start of Property Methods

	@property
	def token(self):
		return self.get_field(1)
	@token.setter
	def token(self, value):
		#self._node_obj.node_tkn = value	
		pass

	@property
	def tag(self):
	    return self.get_field(2)
	@tag.setter
	def tag(self, value):
	    pass


	

	def __str__(self):
		pass
		

cdef class list_of_nodes:
	cdef cssf.list_of_nodes *_list_of_nodes
	def __cinit__(self):
		pass

cdef class list_of_or_nodes:
	cdef cssf.list_of_or_nodes *_list_of_or_nodes
	def __cinit__(self):
		pass

cdef class list_of_fs_structs:
	cdef cssf.list_of_fs_structs *_list_of_fs_structs
	def __cinit__(self):
		pass
