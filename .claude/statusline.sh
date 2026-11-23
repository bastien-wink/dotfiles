#!/usr/bin/env bash
# Claude Code status line script
# Reads JSON from stdin and outputs: project (branch) | Model | $cost | +N/-N | Context: Nk (X%) | Week (⭮ Day HH:MM): X% | 5h Usage (⭮ HH:MM): X%

input=$(cat)

dir=$(echo "$input" | jq -r '.workspace.current_dir // "."')
model=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // 0' | awk '{printf "%.2f", $1}')
added=$(echo "$input" | jq -r '.cost.total_lines_added // 0')
removed=$(echo "$input" | jq -r '.cost.total_lines_removed // 0')
usage_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
usage_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
week_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
week_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')
ctx_tokens=$(echo "$input" | jq -r '.context_window.current_usage | if . then (.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens) else empty end')
ctx_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

out=$(basename "$dir")

branch=$(git -C "$dir" branch --show-current 2>/dev/null)
[ -n "$branch" ] && out="$out ($branch)"

out="$out | $model | \$$cost"

if [ "$added" -gt 0 ] || [ "$removed" -gt 0 ]; then
    out="$out | +$added/-$removed"
fi

if [ -n "$ctx_tokens" ]; then
    out=$(printf "%s | Context: %dk" "$out" "$((ctx_tokens / 1000))")
    [ -n "$ctx_pct" ] && out=$(printf "%s (%.0f%%)" "$out" "$ctx_pct")
fi

if [ -n "$week_pct" ]; then
    label="Week"
    [ -n "$week_reset" ] && label="Week (⭮ $(date -d "@$week_reset" '+%a %H:%M'))"
    out=$(printf "%s | %s: %.0f%%" "$out" "$label" "$week_pct")
fi

if [ -n "$usage_pct" ]; then
    label="5h Usage"
    [ -n "$usage_reset" ] && label="5h Usage (⭮ $(date -d "@$usage_reset" +%H:%M))"
    out=$(printf "%s | %s: %.0f%%" "$out" "$label" "$usage_pct")
fi

printf "%s" "$out"
