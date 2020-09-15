#!/bin/bash
seq 5 | xargs echo "Hello"
seq 5 | xargs -n 1 echo "Hello"
ls -l | xargs echo "Hello"
ls -l | xargs -n 1 echo "Hello"
ls | xargs -n 1 chgrp cdrom

ls | xargs -I{} -n 1 chgrp yingying {}

find ./ -name .sh | xargs -I{} -n 1 chgrp yingying {}
