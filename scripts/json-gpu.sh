#!/usr/bin/env bash

jq -n \
	--arg name "amdgpu" \
	--argjson avg $(cat /sys/class/drm/card1/device/gpu_busy_percent) \
	--argjson vram_used $(cat /sys/class/drm/card1/device/mem_info_vram_used) \
	--argjson vram_total $(cat /sys/class/drm/card1/device/mem_info_vram_total) \
	'{
        name: $name,
        avg: $avg,
        vram: {
            used: $vram_used,
            total: $vram_total
        }
    }'
