#ifndef GUARD_SCRIPT_H
#define GUARD_SCRIPT_H

struct ScriptContext;

typedef bool8 (*ScrCmdFunc)(struct ScriptContext *);

struct ScriptContext
{
    u8 stackDepth;
    u8 mode;
    u8 comparisonResult;
    u8 (*nativePtr)(void);
    u8 *scriptPtr;
    u8 *stack[20];
    ScrCmdFunc *cmdTable;
    ScrCmdFunc *cmdTableEnd;
    u32 data[4];
};

void script_env_init(struct ScriptContext *ctx, void *cmdTable, void *cmdTableEnd);
u8 script_setup_bytecode_script(struct ScriptContext *ctx, void *ptr);
void script_setup_asm_script(struct ScriptContext *ctx, void *ptr);
void script_stop(struct ScriptContext *ctx);
u8 sub_80653EC(struct ScriptContext *ctx);
u8 script_stack_push(struct ScriptContext *ctx, u8 *ptr);
u8 *script_stack_pop(struct ScriptContext *ctx);
void script_jump(struct ScriptContext *ctx, u8 *ptr);
void script_call(struct ScriptContext *ctx, u8 *ptr);
void script_return(struct ScriptContext *ctx);
u16 script_read_halfword(struct ScriptContext *ctx);
u32 script_read_word(struct ScriptContext *ctx);
void script_env_2_enable(void);
void script_env_2_disable(void);
bool8 script_env_2_is_enabled(void);
void script_env_1_init(void);
bool8 script_env_2_run_current_script(void);
void script_env_1_execute_new_script(u8 *ptr);
void sub_80655F0(void);
void script_env_2_enable_and_set_ctx_running();
void script_env_2_execute_new_script(u8 *ptr);

#endif // GUARD_SCRIPT_H
