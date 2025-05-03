#include <stdint.h>

// Fallback type definitions
typedef int ssize_t;
typedef int pid_t;
typedef int ptrdiff_t;

// Minimal struct for fstat
struct stat { int st_mode; };
#define S_IFCHR 0020000

// --- Minimal Syscalls for Embedded ---
int _close(int file) { return -1; }

int _fstat(int file, struct stat *st) {
    st->st_mode = S_IFCHR;
    return 0;
}

int _isatty(int file) { return 1; }

int _read(int file, char *ptr, int len) {
    return 0;  // No input supported
}

int _write(int file, char *ptr, int len) {
    // Could map this to UART later
    return len;
}

void _exit(int status) {
    while (1);
}

int _kill(pid_t pid, int sig) { return -1; }

pid_t _getpid(void) { return 1; }

// --- Heap Allocator (_sbrk) for malloc/printf ---
extern char _end;  // Defined in linker script
static char *heap_end;

void* _sbrk(ptrdiff_t incr) {
    if (!heap_end)
        heap_end = &_end;

    char *prev_heap_end = heap_end;
    heap_end += incr;
    return (void*)prev_heap_end;
}

// --- Reentrant I/O stub needed by newlib ---
int _lseek(int file, int ptr, int dir) {
    return 0;
}

int _lseek_r(void *reent, int file, int ptr, int dir) {
    return _lseek(file, ptr, dir);
}

