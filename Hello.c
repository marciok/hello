#include <ruby.h>

void hello_from_ruby() 
{
	/* construct the VM */
if (ruby_setup())
	{
		fprintf(stderr, "Failed to init Ruby VM\n");
	}

  rb_require("./test");
  rb_funcall(rb_mKernel, rb_intern("some_ruby_method"), 0, NULL);


	/* destruct the VM */
	ruby_cleanup(0);
}
