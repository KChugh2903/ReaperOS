# ReaperOS

A multi-architecture microkernel operating system with support for ARM processors, featuring preemptive scheduling and modern OS capabilities.

## 🚀 Features

- **Multi-Architecture Support**: ARMv6, ARMv7-A, and ARMv8-A (AArch32/AArch64)
- **Preemptive Scheduling**: Advanced process scheduler with multiple process states
- **Memory Management**: Virtual memory with page tables and memory mapping
- **Process Management**: Full process lifecycle with fork/exec/wait system calls  
- **System Calls**: Complete syscall interface for userspace programs
- **Hardware Abstraction**: Timer, UART, IRQ handling across ARM architectures
- **Debug Support**: Built-in debugging and monitoring capabilities

## 🏗️ Architecture

ReaperOS is designed as a microkernel with a clean separation between kernel and userspace:

```
ReaperOS/
├── arch/                   # Architecture-specific code
│   ├── armv6/             # ARMv6 support
│   ├── armv7-a/           # ARMv7-A support  
│   └── armv8-a/           # ARMv8-A support (AArch32/AArch64)
│       ├── boot.S         # Boot assembly
│       ├── entry.S        # Exception vectors
│       ├── irq.S          # Interrupt handling
│       ├── scheduler.S    # Context switching
│       ├── system.S       # System register access
│       └── utils.S        # Utility functions
├── kernel/                # Core kernel implementation
│   ├── memory/            # Memory management
│   ├── monitor/           # System monitoring
│   └── proc/              # Process management
│       ├── proc.c         # Process lifecycle
│       ├── scheduler.c    # Process scheduler
│       └── syscall_*.c    # System call implementations
├── include/               # Header files
│   ├── armv6/            # ARMv6 headers
│   ├── armv8-a/          # ARMv8-A headers
│   ├── kernel/           # Kernel headers
│   ├── lib/              # Library headers
│   └── peripherals/      # Hardware peripheral headers
├── lib/                  # Standard library implementation
├── usr/                  # Userspace programs
└── armstub/             # ARM stub loader
```

## 🔧 Prerequisites

### Required Tools
- **Cross Compiler**: ARM GCC cross-compilation toolchain
  - For ARMv6/ARMv7-A: `arm-none-eabi-gcc`
  - For ARMv8-A: `aarch64-none-elf-gcc`
- **Make**: GNU Make for building
- **QEMU** (optional): For emulation and testing
  - `qemu-system-arm` for 32-bit ARM
  - `qemu-system-aarch64` for 64-bit ARM

### Hardware Support
- **Raspberry Pi** series (primary target)
- **QEMU ARM** virtual machines
- **Generic ARM** development boards

## 🚀 Building

### Quick Start
```bash
# Clone the repository
git clone https://github.com/KChugh2903/ReaperOS.git
cd ReaperOS

# Build for default architecture (ARMv8-A)
make

# Build for specific architecture
make ARCH=armv6     # ARMv6
make ARCH=armv7-a   # ARMv7-A  
make ARCH=armv8-a   # ARMv8-A (AArch64)
```

### Architecture-Specific Builds

#### ARMv6 (Raspberry Pi 1)
```bash
make ARCH=armv6 CROSS_COMPILE=arm-none-eabi-
```

#### ARMv7-A (Raspberry Pi 2/3 in 32-bit mode)
```bash
make ARCH=armv7-a CROSS_COMPILE=arm-none-eabi-
```

#### ARMv8-A (Raspberry Pi 3/4 in 64-bit mode)
```bash
make ARCH=armv8-a CROSS_COMPILE=aarch64-none-elf-
```

### Build Targets
```bash
make all        # Build kernel and userspace
make kernel     # Build kernel only
make clean      # Clean build artifacts
make distclean  # Deep clean including dependencies
```

## 🖥️ Running

### QEMU Emulation

#### ARMv8-A (AArch64)
```bash
qemu-system-aarch64 \
    -M virt \
    -cpu cortex-a57 \
    -kernel reaperos.elf \
    -m 1G \
    -nographic \
    -serial stdio
```

#### ARMv7-A (AArch32)
```bash
qemu-system-arm \
    -M virt \
    -cpu cortex-a15 \
    -kernel reaperos.elf \
    -m 512M \
    -nographic \
    -serial stdio
```

### Real Hardware (Raspberry Pi)
1. Copy `reaperos.img` to SD card as `kernel8.img` (64-bit) or `kernel7.img` (32-bit)
2. Add necessary `config.txt` entries for your Pi model
3. Insert SD card and power on

## 🧪 System Calls

ReaperOS provides a complete system call interface:

| System Call | Description |
|-------------|-------------|
| `exit(int)` | Terminate process |
| `getpid()` | Get process ID |
| `fork()` | Create child process |
| `exec(int)` | Execute program |
| `yield()` | Yield CPU to other processes |
| `wait(int)` | Wait for child process |

### Example Usage
```c
#include <kernel/syscall.h>

int main() {
    int pid = getpid();
    printf("Process ID: %d\n", pid);
    
    int child = fork();
    if (child == 0) {
        // Child process
        exec(1);  // Execute program 1
    } else {
        // Parent process  
        wait(child);
        printf("Child process completed\n");
    }
    
    return 0;
}
```

## 🔬 Development

### Process States
```
UNUSED → CREATED → READY → RUNNING → TERMINATED
              ↓      ↑         ↓
              → SLEEPING ←――――――
```

### Memory Layout
- **Kernel Space**: High memory (virtual addresses > 0x80000000)
- **User Space**: Low memory (virtual addresses < 0x80000000)  
- **Process Heap**: Dynamically allocated per process
- **Stack**: Separate kernel and user stacks per process

### Adding New System Calls
1. Define syscall number in `include/kernel/syscall.h`
2. Implement handler in `kernel/proc/syscall_*.c`
3. Add entry to syscall table in `kernel/ksyscall.c`
4. Update userspace library in `lib/`

### Debugging
ReaperOS includes built-in debugging support:
```c
// Enable debug output
#define DEBUG 1

// Debug process scheduler
dump_scheduler_status();

// Debug process context
proc_dump_context(process);
```

## 🏛️ Architecture Details

### ARMv8-A Features
- **Exception Levels**: EL0 (user), EL1 (kernel), EL2 (hypervisor), EL3 (secure)
- **64-bit Support**: Full AArch64 instruction set
- **Backward Compatibility**: AArch32 execution state support
- **Advanced SIMD**: NEON instruction support
- **Security**: TrustZone and secure/non-secure world separation

### Memory Management
- **Page Size**: 4KB pages
- **Address Space**: 48-bit virtual addressing (ARMv8-A)
- **Translation Tables**: 4-level page tables for ARMv8-A
- **Protection**: User/kernel space separation with proper permissions

### Interrupt Handling
- **Exception Vectors**: Centralized exception handling
- **Timer Interrupts**: Preemptive scheduling via timer
- **Hardware IRQs**: Device interrupt support
- **System Calls**: Software interrupt interface

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- ARM Architecture Reference Manuals
- Raspberry Pi Foundation for excellent documentation
- QEMU project for emulation support
- Open source OS development community
