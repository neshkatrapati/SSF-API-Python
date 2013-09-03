from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
import os

def get_includes(pkg):
	fp = os.popen("pkg-config --cflags-only-I %s 2> /dev/null" % (pkg,))
	includes = fp.read().strip().replace("-I", "").split(" ")
	fp.close()
	return includes

def get_libs(pkg):
	fp = os.popen("pkg-config --libs-only-L %s 2> /dev/null" % (pkg,))
	libdirs = fp.read().strip().replace("-L", "").split(" ")
	fp.close()
	fp = os.popen("pkg-config --libs-only-l %s 2> /dev/null" % (pkg,))
	libs = fp.read().strip().replace("-l", "").split(" ")
	fp.close()
	return libdirs, libs

def uniqify(l):
	seen = []
	for e in l:
		if not e or e in seen: continue
		seen.append(e)
	return seen

glib_dirs, glib_libs = get_libs("glib-2.0")

extra_includes = get_includes("glib-2.0") 
extra_includes = uniqify(extra_includes)

library_dirs = uniqify(glib_dirs)
libraries = uniqify(glib_libs)
print libraries

setup(
	name = "ssf",
	version = "0.1",
	author = "Ganesh Katrapati",
	author_email = "ganesh.katrapati@research.iiit.ac.in",
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("ssf", ["ssf.pyx"],libraries=libraries,include_dirs=extra_includes,library_dirs=library_dirs)]
)
