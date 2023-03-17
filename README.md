# neovim_docker

Config neovim as PDE in docker

## Build

```bash
docker build -t kentchiu/pde --build-arg CACHEBUST=$(date +%s) . 
```

## Run


```bash
docker volume create pde
```

```bash
docker run -e TERM -e COLORTERM -e LC_ALL=C.UTF-8 -p 5173:5173 -p 4200:4200 -p 8122:8122  -v pde:/root -v /home/kent/.ssh:/root/.ssh -ti kentchiu/pde
```


## Reset

```bash
docker rm -f $(docker ps -a -q)
docker volume rm -f pde
```


## TODO


- [] spell check correct in quick fix or code aciton
- [] spell check auto enable by file type
- [] spell check toggle 
- [x] dracula theme
- [x] Tokyo night theme 
- [x] File changes history (Lazy Git or Telescope)
- [x] Insert mode by default in terminal
- [x] slient exit terminal
- [] telescope filter by file type
- [x] auto-save
- [x] telescope grep_string
- [x] command history
- [x] focus on curren buffer when toggle nvim-tree
- [x] code format (ts)
- [x] code format not regrade to tab stops
- [x] code indent not in position(ts)
- [x] keymap ft (find terminal) not work
- [x] keymap uw (toggle word wrap)
- [x] search highlight (/)
- [x] jk not map to esc
- [x] project scope diagnostics
