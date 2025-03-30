set $lastcs = -1

echo + target remote localhost:26000\n
target remote localhost:26000

echo + symbol-file reaper_os.elf\n
symbol-file ./reaper_os.elf