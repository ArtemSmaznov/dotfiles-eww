#!/usr/bin/env bash

utilization=$(cat /sys/class/drm/card1/device/gpu_busy_percent)
vram_used=$(cat /sys/class/drm/card1/device/mem_info_vram_used)
vram_total=$(cat /sys/class/drm/card1/device/mem_info_vram_total)

json_output="""{
  \"name\": \"amdgpu\",
  \"avg\": \"$utilization\",
  \"vram\": {
    \"used\": \"$vram_used\",
    \"total\": \"$vram_total\"
  }
}
"""

echo "${json_output%,}" | jq .
