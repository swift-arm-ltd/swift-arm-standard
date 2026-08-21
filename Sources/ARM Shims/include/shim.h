#ifndef SWIFT_ARM_SHIM_H
#define SWIFT_ARM_SHIM_H

#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

#define SWIFT_ARM_REGISTER_FREQUENCY 0
#define SWIFT_ARM_REGISTER_PHYSICAL  1
#define SWIFT_ARM_REGISTER_VIRTUAL   2

unsigned long long swift_arm_register_read_v1(int register_id);

void swift_arm_event_wait_v1(void);

void swift_arm_event_wait_interrupt_v1(void);

void swift_arm_event_send_v1(void);

void swift_arm_event_send_local_v1(void);

unsigned long long swift_arm_timestamp_physical_v1(void);

#ifdef __cplusplus
}
#endif

#endif
