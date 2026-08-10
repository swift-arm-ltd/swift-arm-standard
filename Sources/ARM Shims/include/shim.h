// ===----------------------------------------------------------------------===//
//
// This source file is part of the swift-arm-primitives open source project
//
// Copyright (c) 2024-2025 Coen ten Thije Boonkkamp and the swift-arm-primitives project authors
// Licensed under Apache License v2.0
//
// See LICENSE for license information
//
// ===----------------------------------------------------------------------===//

#ifndef SWIFT_ARM_SHIM_H
#define SWIFT_ARM_SHIM_H

#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

// Symbol Versioning Rule:
// All symbols use _v1 suffix. Symbols are never removed, only superseded.

// System Register IDs for swift_arm_register_read_v1
#define SWIFT_ARM_REGISTER_FREQUENCY 0  // CNTFRQ_EL0
#define SWIFT_ARM_REGISTER_PHYSICAL  1  // CNTPCT_EL0
#define SWIFT_ARM_REGISTER_VIRTUAL   2  // CNTVCT_EL0

// System Register Access (MRS)
// Returns the value of the specified system register
unsigned long long swift_arm_register_read_v1(int register_id);

// Event Wait (WFE)
// Waits for an event signal
void swift_arm_event_wait_v1(void);

// Event Wait for Interrupt (WFI)
// Waits for an interrupt
void swift_arm_event_wait_interrupt_v1(void);

// Event Send (SEV)
// Sends an event to all cores
void swift_arm_event_send_v1(void);

// Event Send Local (SEVL)
// Sends an event to the local core only
void swift_arm_event_send_local_v1(void);

// Physical Timestamp (CNTPCT_EL0)
// Returns the physical counter value (not affected by hypervisor offset)
unsigned long long swift_arm_timestamp_physical_v1(void);

#ifdef __cplusplus
}
#endif

#endif // SWIFT_ARM_SHIM_H
