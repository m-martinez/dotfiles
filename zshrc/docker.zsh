# Preffered docker stats output
function docker-stats() {
  docker stats --format "table {{.Name}}\t{{.ID}}\t{{.CPUPerc}}\t{{.MemUsage}}"
}

# Print total memory currently used by docker
function docker-memory() {
  docker stats --no-stream --format 'table {{.MemUsage}}' | sed 's/[A-Za-z]*//g' | awk '{sum += $1} END {print sum "MB"}'
}
