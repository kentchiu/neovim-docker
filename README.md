# neovim_docker

Config neovim as PDE in docker

## Build

```bash
docker build . -t kentchiu/pde
```

## Run


```bash
docker volume create pde
```

```bash
docker run -v pde:/root -p 5173:5173 -ti kentchiu/pde bash
```


