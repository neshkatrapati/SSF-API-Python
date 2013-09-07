# Python-SSF API
## Intro

* This is wrapper over the C-API of the SSF Library using Cython
* This is not currently at deployable state

## Installing 

		$ sudo python setup.py install

## Usage 

		>>> import ssf 
		>>> node = ssf.node()
		>>> node.read_ssf_from_file("data/sample.ssf")
		>>> node.print_tree()

* Try the test1.py too.