# Wine SteamCMD Image

A Container with the Wine compatability layer & SteamCMD used for hosting Windows based dedicated servers on linux hosts.

## Includes

* Debian (Buster)
* Wine7
* SteamCMD

## General info

* Size (Compressed): ~700 MB
* Size (Uncompressed): ~2 GB

## Usage

This image is used as a base image for some of my projects, you are free to use this for yours as well.

### SteamCMD

You can use the steamcmd by using the steamcmd command as follows:

```bash
/steamcmd +login anonymous +force_install_dir /some/install/path +app_update <app_id> +quit
```

### Wine

You can use Wine by using the following command:

```bash
wine someexe.exe
```
