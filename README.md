# GameShell-Scripts
Upgrade the functionalities of your GameShell.

## Quick Usage

If your kernel version > 5.3.6 then you need to switch to kernel 5.3.6. This is the most stable one.

**Upgrade graphics:**

```bash
bash <(curl -sL https://raw.githubusercontent.com/zzxzzk115/GameShell-Scripts/main/scripts/graphics/upgrade_graphics.sh)
```

如果你在中国大陆（或 GitHub 访问不稳定），请改用 jsDelivr 获取脚本：

```bash
bash <(curl -sL https://cdn.jsdelivr.net/gh/zzxzzk115/GameShell-Scripts@main/scripts/graphics/upgrade_graphics.sh)
```

The script tests GitHub and a few public GitHub proxies (ghfast.top, gh-proxy.com, ghproxy.net, gh.ddlc.top) and downloads through the fastest. Set `GH_PROXY` to choose yourself (empty means GitHub directly). 脚本会先测速，自动选择直连 GitHub 或最快的公共代理来下载；也可以用 `GH_PROXY` 自己指定（留空表示直连）。

Then you need to reboot your GameShell：

```bash
sudo reboot
```

**Change apt source:**

目前支持中国大陆用户，一键更换apt源为清华源：

```bash
bash <(curl -sL https://cdn.jsdelivr.net/gh/zzxzzk115/GameShell-Scripts@main/scripts/apt_source/tsinghua.sh)
```

## License

The project is under the [MIT](./LICENSE) License.
