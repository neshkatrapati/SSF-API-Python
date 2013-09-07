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
	
# Experimental : Children Class
cdef class Children(object):
	"""
	Represents the children of the node 
	"""
	cdef node
	cdef iter_index
	cdef length
	def __cinit__(self, node):
		self.node = node
		self.iter_index = -1
		self.length = len(self)

	def __getitem__(self,n):
		return self.node.get_nth_child(n)
	def __iter__(self):
		return self
	def __next__(self):
		if self.iter_index < self.length + 1:
			self.iter_index += 1
			return self.node.get_nth_child(self.iter_index)
		else:
			raise StopIteration
	def __len__(self):
		return self.node.get_length_of_children()

	def insert(self,node,position):
		self.node.insert_node_into_position(node,position)



cdef class node(object):
	"""
	Represents the node class
	"""
	cdef cssf.node *_node_obj
	cdef Children _children
	def __cinit__(self):
		self._node_obj = cssf.create_tree()
		self._children = Children(self)
		
		
	def read_ssf_from_file(self,char *file_name):
		#cdef libc.stdio.FILE *fp = libc.stdio.fopen(file_name,"r")
		cssf.read_ssf_from_file(self._node_obj,file_name)

	def print_tree(self):
		cssf.print_tree(self._node_obj)

	def get_nth_child(self,int n):
		cdef cssf.node *nd = cssf.get_nth_child(self._node_obj,n)
		cdef node ndd = node()
		ndd._node_obj = nd
		return ndd

	def get_field(self,int n):
		cdef char* field = cssf.get_field(self._node_obj,n)
		return field

	def get_fields(self):
		cdef char* fields = cssf.get_fields(self._node_obj)
		return fields

	def get_length_of_children(self):
		return cssf.get_length_of_children(self._node_obj)

	def get_parent(self):
		cdef cssf.node *parent = cssf.get_parent(self._node_obj)
		cdef node _parent = node()
		_parent._node_obj  = parent
		return _parent

	def modify_field(self,int num,char string[]):
		return cssf.modify_field(self._node_obj,num,string)

	def insert_node_into_position(self,node ins_node,int position):
		return cssf.insert_node_into_position(self._node_obj,ins_node._node_obj,position)

	def delete(self):
		return cssf.delete_node(self._node_obj)

	# Start of Property Methods

	property token:
		def __get__(self):
			return self.get_field(1)
		def __set__(self, value):
			self.modify_field(1,value)	
		
	property tag:
		def __get__(self):
			return self.get_field(2)
		def __set__(self, value):
			self.modify_field(2,value)
		

	property children:
		def __get__(self):
			return self._children	

	property parent:
		def __get__(self):
			return self.get_parent()
	

	def __str__(self):
		return self.token
		

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
