#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/slab.h>
#include <linux/string.h>
#include <linux/timer.h>
#include <linux/major.h>
#include <linux/fs.h>
#include <linux/err.h>
#include <linux/ioctl.h>
#include <linux/init.h>
#include <linux/proc_fs.h>
#include <linux/version.h>
#if LINUX_VERSION_CODE > KERNEL_VERSION(3,10,1)
#include <linux/seq_file.h>
#endif

static struct proc_dir_entry* Our_Proc_Dir;
static struct proc_dir_entry *proc_openvisionmodule;

DEFINE_MUTEX(openvisionmodule_table_mutex);

#if LINUX_VERSION_CODE < KERNEL_VERSION(3,10,1)
static int openvisionmodule_read_proc (char *page, char **start, off_t off, int count, int *eof, void *data_unused)
{
        int len;
        off_t   begin = 0;

        mutex_lock(&openvisionmodule_table_mutex);

        len = sprintf(page, "https://openvision.tech\n");
        mutex_unlock(&openvisionmodule_table_mutex);
        if (off >= len+begin)
                return 0;
        *start = page + (off-begin);
        return ((count < begin+len-off) ? count : begin+len-off);
}

static int __init init_openvisionmodule(void)
{

		if ((proc_openvisionmodule = create_proc_entry( "stb/info/openvision", 0666, NULL )))
                proc_openvisionmodule->read_proc = openvisionmodule_read_proc;
        return 0;
}

static void __exit cleanup_openvisionmodule(void)
{
        remove_proc_entry( "stb/info/openvision", NULL);
}
#else
static int proc_openvisionmodule_show(struct seq_file *seq, void *v)
{
        off_t   begin = 0;

        seq_printf(seq, "https://openvision.tech\n");
        return 0;
}

int proc_openvisionmodule_open(struct inode *inode, struct file *file)
{ 
	return single_open(file, proc_openvisionmodule_show, PDE_DATA(inode));
}

static const struct file_operations proc_fops = {
	.owner		= THIS_MODULE,
	.open		= proc_openvisionmodule_open,
	.read		= seq_read,
	.llseek		= seq_lseek,
	.release	= single_release,
};

static int __init init_openvisionmodule(void)
{

	proc_openvisionmodule = proc_create_data( "stb/info/openvision", 0666, NULL, &proc_fops, NULL );
        return 0;
}

static void __exit cleanup_openvisionmodule(void)
{
        remove_proc_entry( "stb/info/openvision", NULL);
}
#endif
module_init(init_openvisionmodule);
module_exit(cleanup_openvisionmodule);

MODULE_LICENSE("CLOSED");
MODULE_AUTHOR("Open Vision Developers");
MODULE_DESCRIPTION("Open Vision Information");
