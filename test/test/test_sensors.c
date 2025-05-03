#include "unity.h"
#include "sensors.h"

void setUp(void) {}
void tearDown(void) {}

void test_temp_high_triggers_alert(void) {
    TEST_ASSERT_TRUE(check_temperature(45.0));
}

void test_temp_normal_does_not_trigger_alert(void) {
    TEST_ASSERT_FALSE(check_temperature(36.5));
}

