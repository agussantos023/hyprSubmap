# Hyprland Submap Indicator for DankMaterialShell

Un widget ligero para DankMaterialShell (DMS) que muestra en tiempo real el submap (capa de atajos) activo en Hyprland.

## 📌 Requisitos Previos

Para que este plugin funcione correctamente en tu sistema necesitas tener instalado socat para escuchar los eventos del socket IPC de Hyprland:


```Bash
# Arch Linux / EndeavourOS
sudo pacman -S socat
```


## 🛠️ Instalación Manual

1. Clona este repositorio dentro del directorio de plugins de DankMaterialShell:

```Bash
git clone https://github.com/agussantos023/hyprSubmap.git ~/.config/DankMaterialShell/plugins/hyprSubmap
```

2. Reinicia la interfaz de DMS:

```Bash
dms restart
```
    
3. Ve a Ajustes > Barra > Widgets en DankMaterialShell y añade Hyprland Submap Indicator a la sección de la barra que prefieras.



## ⚙️ Configuración en Hyprland

Para probar que funciona, añade submaps en tu archivo ~/.config/hypr/hyprland.conf. Por ejemplo, una capa para cambiar el tamaño de las ventanas:
Ini, TOML

```Ini, TOML
# Entrar al submap 'resize'
bind = ALT, R, submap, resize

submap = resize
binde = , right, resizeactive, 10 0
binde = , left, resizeactive, -10 0
binde = , up, resizeactive, 0 -10
binde = , down, resizeactive, 0 10
bind = , escape, submap, reset
submap = reset
```

## 👨‍💻 Desarrollo y Contribuciones

Este repositorio sigue la siguiente estructura de ramas:

- main: Código estable listo para release.

- dev: Rama activa de desarrollo para nuevas características.

