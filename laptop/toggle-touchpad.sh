#!/bin/bash

TOUCHPAD_ID=10

# Получите текущее состояние тачпада
STATUS=$(xinput list-props $TOUCHPAD_ID | grep "Device Enabled" | awk '{print $4}')

if [ "$STATUS" -eq 1 ]; then
    # Если тачпад включен, отключите его
    xinput disable $TOUCHPAD_ID
else
    # Если тачпад отключен, включите его
    xinput enable $TOUCHPAD_ID
fi

