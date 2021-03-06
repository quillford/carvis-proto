sshpass -p "password" ssh -tt -o StrictHostKeyChecking=no pi@carvis-proto.local "rm -rf ~/carvis-proto"

echo "purged directory... transferring new files"

sshpass -p "password" rsync -av --exclude "*.git" ../../carvis-proto/ pi@carvis-proto.local:~/carvis-proto

echo "new files transferred. starting server"

sshpass -p "password" ssh -tt -o StrictHostKeyChecking=no pi@carvis-proto.local "fuser -k 8080/tcp && python ~/carvis-proto/app/app.py &"