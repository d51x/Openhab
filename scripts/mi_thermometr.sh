
#!/bin/bash

CMD="gatttool -b $1 --char-read --handle=$2"

data=$($CMD | awk -F ' ' '{print $4$3}' | tr [:lower:] [:upper:] )
if [ -n "$data" ]; then
  data=$(printf "%d" "0x"$data)
  #data=$(bc <<< "scale=1;  $data/10"  )
  echo $data
fi
