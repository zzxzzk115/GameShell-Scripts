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

GameShell 的系统是 Debian buster，Debian 已经把它移进归档，大多数镜像（包括清华、中科大）都不再提供，所以原来的源和清华源都用不了了。这个脚本会在仍然保留 buster 归档的镜像（阿里云、华为云、Debian 官方 archive.debian.org）里测速，换成最快的那个，然后 `apt-get update` 和 `upgrade`。原来的 `sources.list` 会备份为 `sources.list.bak`。

GameShell's OS is Debian buster, which Debian has archived; most mirrors no longer carry it. This picks the fastest mirror that still does and switches apt to it.

```bash
bash <(curl -sL https://raw.githubusercontent.com/zzxzzk115/GameShell-Scripts/main/scripts/apt_source/debian_archive.sh)
```

在中国大陆可以改用 jsDelivr 获取脚本：

```bash
bash <(curl -sL https://cdn.jsdelivr.net/gh/zzxzzk115/GameShell-Scripts@main/scripts/apt_source/debian_archive.sh)
```

想自己指定镜像，可以设置 `APT_MIRROR`，例如 `APT_MIRROR=mirrors.aliyun.com/debian-archive`。旧的 `tsinghua.sh` 链接仍然可用，会转去运行这个脚本。

## License

The project is under the [MIT](./LICENSE) License.
