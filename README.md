# dde-custom-config
My custom config for DDE Desktop

Tested and work in Asus Zenbook UX410. Deepin Community 20.2.3

### Touchpad gesture path

```/usr/share/dde-daemon/gesture.json```

### VSCode open folders!

Add this line to $HOME/.config/mimeapps.list

```inode/directory = dde-file-manager.desktop;code.desktop;```

### Disable Tapping draw

```xinput set-prop 13 343 0```

### Fix low rates Wifi

Show current Bit Rate:
```bash
iwconfig wlp2s0 | grep Rate
          Bit Rate=54 Mb/s   Tx-Power=22 dBm 
```

If 54 Mb/s is MAX, mod this file:

```bash
sudo nano /etc/modprobe.d/iwlwifi.conf 
```

This content file works for me:

```
options iwlwifi 11n_disable=8
options iwlwifi swcrypto=1
options iwlwifi power_save=0
options iwlwifi d0i3_disable=0
options iwlwifi uapsd_disable=0
options iwlwifi auto_agg = 0
```

Save and reboot!

```bash
iwconfig wlp2s0 | grep Rate
          Bit Rate=400 Mb/s   Tx-Power=22 dBm 
```

Better!
