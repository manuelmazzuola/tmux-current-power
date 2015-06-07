#!/usr/bin/env bash

BATT=BAT0

check_power_supply() {
	if [ ! -d /sys/class/power_supply/BAT0 ]
		then
			BATT=BAT1
	fi
}

print_power_consumtpion() {
	check_power_supply
	if [ -a /sys/class/power_supply/${BATT}/power_now ]
		then
			echo - | awk "{printf \"%.1f\", $(($(cat /sys/class/power_supply/${BATT}/power_now) / 1000000))}"
	elif [ -a /sys/class/power_supply/${BATT}/current_now ] && [ -a /sys/class/power_supply/${BATT}/voltage_now ]
		then
			echo - | awk "{printf \"%.1f\", $(( \
				$(cat /sys/class/power_supply/${BATT}/current_now) * \
				$(cat /sys/class/power_supply/${BATT}/voltage_now) \
			)) / 1000000000000 }"
	fi

}

main() {
	print_power_consumtpion
}
main
