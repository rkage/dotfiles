Host git-ssh.mcf.io
  ProxyCommand cloudflared access ssh --hostname %h
