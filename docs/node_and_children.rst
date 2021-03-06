Node and Children
*****************

Introduction
============
Of all the structures in the API, node by far is the most important. 
Most of the operations take place on it and most of the other structures are parts of the node itself.

Structure of the Node
=====================
.. class:: node()
.. attribute:: token

	This is represented by the second column of the SSF file. 
	This is generally the word or the chunk marking.

.. attribute:: tag

	This is represented by the thrid column of the SSF file
	This is generally the POS or the CHUNK tag.

.. attribute:: children

	Children of the node represented by the Children class.

.. attribute:: parent
	
	A node object representing the parent of the node.

Methods of the Node
====================
.. method:: node.read_ssf_from_file(filename)
	
	Reads the contents of the ssf file into the node object.

.. method :: node.print_tree()

	Prints the tree to stdout 

		>>>  node = ssf.node()
		>>>  node.read_ssf_from_file("sample.ssf")
		>>>  node.print_tree()
		1       <Sentence id='2'>
		2       ((      NP      <fs name='NP' drel='rsp:NP2'>
		2.1     subaha  NN      <fs af='subaha,n,f,sg,3,o,0,0' name='subaha' posn='10'>
		2.2     se      PSP     <fs af='se,psp,,,,,,' name='se' posn='20'>
        		))
		3       ((      NP      <fs name='NP2' drel='k7t:VGF'>
		3.1     SAma    NN      <fs af='SAma,n,f,sg,3,o,0,0' name='SAma' posn='30'>
		3.2     waka    PSP     <fs af='waka,psp,,,,,,' name='waka' posn='40'>
        		))
        		</Sentence>

.. method :: node.get_field(n)
	
	Gets the specific field of the node.

		>>> node.print_tree() # Assume
			2       ((      NP      <fs name='NP' drel='rsp:NP2'>
			2.1     subaha  NN      <fs af='subaha,n,f,sg,3,o,0,0' name='subaha' posn='10'>
			2.2     se      PSP     <fs af='se,psp,,,,,,' name='se' posn='20'>
        			))
        			
        >>> node.get_field(1) # Also node.token
        ((
        >>> node.get_field(2) # Also node.tag
        NP

		










