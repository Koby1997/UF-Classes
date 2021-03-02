void SYSCALL_DEFINE0(get_process_log_level);

void SYSCALL_DEFINE1(set_process_log_level, int, new_level);

void SYSCALL_DEFINE2(proc_log_message, int, level, char, *message);


asmlinkage int sys_get_proc_log_level(void);
asmlinkage int sys_set_proc_log_level(int new_level);
asmlinkage int sys_proc_log_message(int level, char *message);