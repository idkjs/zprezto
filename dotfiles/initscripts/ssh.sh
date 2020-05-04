ssh-keygen -t rsa -b 4096 -C "aarmand.inbox@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
