#include "include/shim.h"

#if defined(__aarch64__) || defined(__arm64__) || defined(_M_ARM64)
    #define SWIFT_ARM64 1
#elif defined(__arm__) || defined(_M_ARM)
    #define SWIFT_ARM32 1
#endif

unsigned long long swift_arm_register_read_v1(int register_id) {
#if SWIFT_ARM64
    unsigned long long val;
    switch (register_id) {
        case SWIFT_ARM_REGISTER_FREQUENCY:
            __asm__ __volatile__("mrs %0, cntfrq_el0" : "=r"(val));
            return val;
        case SWIFT_ARM_REGISTER_PHYSICAL:
            __asm__ __volatile__("mrs %0, cntpct_el0" : "=r"(val));
            return val;
        case SWIFT_ARM_REGISTER_VIRTUAL:
            __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(val));
            return val;
        default:
            return 0;
    }
#elif SWIFT_ARM32

    unsigned int lo, hi;
    switch (register_id) {
        case SWIFT_ARM_REGISTER_FREQUENCY:
            __asm__ __volatile__("mrc p15, 0, %0, c14, c0, 0" : "=r"(lo));
            return (unsigned long long)lo;
        case SWIFT_ARM_REGISTER_PHYSICAL:
            __asm__ __volatile__("mrrc p15, 0, %0, %1, c14" : "=r"(lo), "=r"(hi));
            return ((unsigned long long)hi << 32) | lo;
        case SWIFT_ARM_REGISTER_VIRTUAL:
            __asm__ __volatile__("mrrc p15, 1, %0, %1, c14" : "=r"(lo), "=r"(hi));
            return ((unsigned long long)hi << 32) | lo;
        default:
            return 0;
    }
#else
    (void)register_id;
    return 0;
#endif
}

void swift_arm_event_wait_v1(void) {
#if SWIFT_ARM64 || SWIFT_ARM32
    __asm__ __volatile__("wfe" ::: "memory");
#else

    (void)0;
#endif
}

void swift_arm_event_wait_interrupt_v1(void) {
#if SWIFT_ARM64 || SWIFT_ARM32
    __asm__ __volatile__("wfi" ::: "memory");
#else

    (void)0;
#endif
}

void swift_arm_event_send_v1(void) {
#if SWIFT_ARM64 || SWIFT_ARM32
    __asm__ __volatile__("sev" ::: "memory");
#else

    (void)0;
#endif
}

void swift_arm_event_send_local_v1(void) {
#if SWIFT_ARM64
    __asm__ __volatile__("sevl" ::: "memory");
#elif SWIFT_ARM32

    __asm__ __volatile__("sev" ::: "memory");
#else

    (void)0;
#endif
}

unsigned long long swift_arm_timestamp_physical_v1(void) {
#if SWIFT_ARM64
    unsigned long long val;
    __asm__ __volatile__("mrs %0, cntpct_el0" : "=r"(val));
    return val;
#elif SWIFT_ARM32

    unsigned int lo, hi;
    __asm__ __volatile__("mrrc p15, 0, %0, %1, c14" : "=r"(lo), "=r"(hi));
    return ((unsigned long long)hi << 32) | lo;
#else
    return 0;
#endif
}
