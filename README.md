# GameShell-Scripts
Upgrade the functionalities of your GameShell.

## Quick Usage

If you are in China, please run this command on GameShell first:

```bash
sudo sh -c "sed -i \"/# GitHub520 Host Start/Q\" /etc/hosts && curl https://raw.hellogithub.com/hosts >> /etc/hosts"
```

If your kernel version > 5.3.6 then you need to switch to kernel 5.3.6. This is the most stable one.

Upgrade graphics:

```bash
bash <(curl -s https://raw.githubusercontent.com/zzxzzk115/GameShell-Scripts/main/upgrade_graphics.sh)
```

## License

The project is under the [MIT](./LICENSE) License.
