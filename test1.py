import ssf 
import sys
import time

s = time.time()



node = ssf.node()
node.read_ssf_from_file(sys.argv[1])
node_number = int(sys.argv[2])
if node_number == -1:
	print "Printing the Tree"
	node.print_tree()
else:
	t = time.time()
	target_node = node.children[node_number]
	print "Getting the target node",time.time() - t 

	t = time.time()
	target_node.print_tree() # Node Children Indexing, Printing 
	print "Printing the target node",time.time() - t 
	
	t = time.time()
	print target_node.token # Print Token
	print "Printing the target node token",time.time() - t 
	
	t = time.time()
	print len(target_node.children)
	print "Printing the children length",time.time() - t 
	
	t = time.time()
	for child in target_node.children:
		print child,child.tag
	print "Looping ovet target node children",time.time() - t 

	t = time.time()
	print target_node.parent
	print "Parent of target node",time.time() - t 

	t = time.time()
	target_node.children[0].tag = "NNP"
	print "Modifying tag attribute of first child",time.time() - t 

	t = time.time()
	node.children.insert(target_node,node_number)
	print "Inserting nodes",time.time() - t 

	

	#node.get(node_number).print_tree()

print time.time() - s
