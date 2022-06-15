# GameShell-Scripts
Upgrade the functionalities of your GameShell.

## Quick Usage

If your kernel version > 5.3.6 then you need to switch to kernel 5.3.6. This is the most stable one.

**Upgrade graphics:**

```bash
bash <(curl -s https://raw.githubusercontent.com/zzxzzk115/GameShell-Scripts/main/scripts/graphics/upgrade_graphics.sh)
```

如果你在中国大陆，请使用以下脚本：

```bash
bash <(curl -s https://raw.fastgit.org/zzxzzk115/GameShell-Scripts/main/scripts/graphics/upgrade_graphics_cn.sh)
```

Then you need to reboot your GameShell：

```bash
sudo reboot
```

**Change apt source:**

目前支持中国大陆用户，一键更换apt源为清华源：

```bash
bash <(curl -s https://raw.fastgit.org/zzxzzk115/GameShell-Scripts/main/scripts/apt_source/tsinghua.sh)
```

## License

The project is under the [MIT](./LICENSE) License.
