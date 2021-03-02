#include <linux/cred.h>
#include <linux/kernel.h>
#include <linux/sched.h>
#include <linux/pid.h>
#include <linux/syscalls.h>

int proc_log_level;
EXPORT_SYMBOL(proc_log_level);

SYSCALL_DEFINE0(get_proc_log_level)
{
        pr_err("\nI AM GETTING THE PROCESS LOG LEVEL NOW\n");
        int log_level = proc_log_level;
        printk(KERN_ERR "current log_level %d", log_level);
        pr_err("\n yup \n");

        return proc_log_level;
}

SYSCALL_DEFINE1(set_proc_log_level, int, new_level)
{
        pr_err("\nI AM SETTING THE PROCESS LOG LEVEL NOW\n");
        int test1 = new_level;
        printk(KERN_ERR "new level %d", test1);

        if(new_level > 7 || new_level < 0)
        {
                pr_err("\nERROR: INVALID LEVEL\n");
                return -1;
        }

        if(current_uid().val != 0)
        {
                pr_err("\nERROR: NOT A SUPERUSER\n");
                return -1;
        }

        pr_err("\nthis is the current proc_log_level\n");
        int test2 = proc_log_level;
        printk(KERN_ERR "current level %d", test2);

        proc_log_level = new_level;
        return proc_log_level;
}

SYSCALL_DEFINE2(proc_log_message, int, level, char, *message)
{
        printk("I AM IN THE LOG MESSAGE FUNCTION\n");

        int current_log_level = syscall(435);

        if(level > current_log_level)
        {
            return -1;
        }

        switch(level)
        {
                case 0:
                    printk(KERN_EMERG "%s", message);
                    return level;

                case 1:
                    printk(KERN_ALERT "%s", message);
                    return level;

                case 2:
                    printk(KERN_CRIT "%s", message);
                    return level;

                case 3: 
                    printk(KERN_ERR "%s", message);
                    return level;

                case 4:
                    printk(KERN_WARNING "%s", message);
                    return level;

                case 5:
                    printk(KERN_NOTICE "%s", message);
                    return level;

                case 6: 
                    printk(KERN_INFO "%s", message);
                    return level;

                case 7:
                    printk(KERN_DEBUG "%s", message);
                    return level;

                default:
                    return -1;
        }
        //shouldn't reach here but just in case
        return -1;
}



#define PROC_LOG_CALL <437>

int* retrieve_set_level_params(int new_level)
{
    int *p;
    int a[3] = {436, 1, new_level};
    p = a;
    return p;

}

int* retrieve_get_level_params()
{
    int *p;
    int a[2] = {435, 0};
    p = a;
    return p;
    //honestly might just be return a
}

int interpret_set_level_result(int ret_value)
{
    return ret_value;
}

int interpret_get_level_result(int ret_value)
{
    return ret_value;
}

int interpret_log_message_result(int ret_value)
{
    return ret_value;
}