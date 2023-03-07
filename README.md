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
docker run -v pde:/root -p 5173:5173 -ti kentchiu/pde bash
```


## Reset

```bash
docker rm -f $(docker ps -a -q)
docker volume rm -f pde
```


## TODO

- [] command history
- [] focus on curren buffer when toggle nvim-tree
- [] code format (ts)
- [] code indent not in position(ts)
- [] keymap ft (find terminal) not work
- [] keymap uw (toggle word wrap)
- [] search highlight (/)
- [] jk not map to esc
