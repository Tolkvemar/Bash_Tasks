#!/bin/bash

rsync -arb --info=BACKUP,MISC2,NAME2,REMOVE  /home/source/ /home/backup --log-file=/home/backup.log 
