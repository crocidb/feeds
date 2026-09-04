+++
title = "Steam"
description = "Steam is Valve’s game distribution platform, which became especially relevant to me when it started incorporating the [Proton](https://github.com/ValveSoftware/P"
date = "2010-05-10T20:00:00Z"
url = "https://taoofmac.com/space/apps/steam?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-06T21:59:30.634706034Z"
seen = false
+++

[Steam](https://store.steampowered.com?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is [Valve](com/valve)’s game distribution platform, which became especially relevant to me when it started incorporating the [Proton](https://github.com/ValveSoftware/Proton?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) [WINE](/space/emulation/wine)-based compatibility layer for running DirectX Windows games on [Linux](/space/os/linux).

[

Tools
----------

](/space/apps/steam#tools) [

### Switch Users ###

](/space/apps/steam#switch-users)

This is something I picked up [on github](https://github.com/SvineruS/steam-account-switcher?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) but modified to use `vdf`:

```
#!/bin/env python
import os
from pathlib import Path
import vdf

LOGIN_USERS = Path(Path.home() / ".local/share/Steam/config/loginusers.vdf")
REGISTRY = Path(Path.home() / ".steam/registry.vdf")

def main():
    print("Current account:", get_account())

    accounts = get_accounts()
    account = choose_account(accounts)
    set_account(account)

    if input("\nRestart steam? [Y/n]: ").lower() != "n":
        os.system("killall steam")

def get_accounts():
    with open(LOGIN_USERS, ‘r’) as f:
        user_registry = vdf.load(f)
    return user_registry[‘users’]

def choose_account(accounts):
    accounts_to_choose = {
        account[‘AccountName’]: [str(i), account[‘AccountName’], account[‘PersonaName’]]
        for i, account in enumerate(accounts.values())
    }
    while True:
        print("\nChoose an account:")
        for i, name, username in accounts_to_choose.values():
            print(f"{i}: {name} ({username})")
        acc = input()
        for account, names in accounts_to_choose.items():
            if acc in names:
                return account

def get_account():
    with open(REGISTRY, ‘r’) as f:
        registry = vdf.load(f)
    return registry[‘Registry’][‘HKCU’][‘Software’][‘Valve’][‘Steam’][‘AutoLoginUser’]

def set_account(account):
    with open(REGISTRY, ‘r’) as f:
        registry = vdf.load(f)
    registry[‘Registry’][‘HKCU’][‘Software’][‘Valve’][‘Steam’][‘AutoLoginUser’] = account
    with open(REGISTRY, ‘w’) as f:
        vdf.dump(registry, f, pretty=True)

if __name__ == "__main__":
    main()

```

[

### Manage Shortcuts ###

](/space/apps/steam#manage-shortcuts)

This is something I wrote to manage shortcuts for Linux emulators:

```
#!/bin/env python
from os import environ, remove
from os.path import join, exists, splitext
from pathlib import Path
from vdf import binary_load, binary_dump, dump, parse
from requests import Session
from requests.structures import CaseInsensitiveDict
from logging import getLogger, basicConfig, INFO, DEBUG, WARN
from zlib import crc32
from click import group, option, command, argument, secho as echo, pass_context, STRING
from shutil import copyfile
from shlex import quote

basicConfig(level=INFO, format='%(asctime)s %(levelname)s %(message)s')

log = getLogger(__name__)

STEAM_ID             = environ.get("STEAM_ID", "901194859")
STEAM_PATH           = environ.get("STEAM_PATH","/home/me/.steam/steam")
STEAM_USER_DATA_PATH = join(STEAM_PATH,"userdata",STEAM_ID,"config")
STEAMGRIDDB_API_KEY  = environ.get("STEAMGRIDDB_API_KEY","dc5b9820c178614336d7659eb7b64453")
GRID_FOLDER          = join(STEAM_USER_DATA_PATH,'grid')
CACHE_PATH           = join(environ.get("HOME"),".cache","steamgriddb")
SHORTCUTS_FILE       = join(STEAM_USER_DATA_PATH,'shortcuts.vdf')
LOCALCONFIG_FILE     = join(STEAM_USER_DATA_PATH,'localconfig.vdf')

for f in [GRID_FOLDER, CACHE_PATH]:
    if not exists(f):
        Path(f).mkdir(parents=True, exist_ok=True)

@group()
def tool():
    """A simple CLI utility to manage Steam shortcuts for Linux emulators"""
    pass

@tool.command()
def list_shortcuts():
    """List all existing shortcuts"""
    with open(SHORTCUTS_FILE, "rb") as h:
        data = binary_load(h)
    data = data[‘shortcuts’]
    headers = "appid AppName Exe LaunchOptions LastPlayTime".split()
    rows = []
    for i in range(len(data)):
        r = CaseInsensitiveDict(data[str(i)])
        rows.append([r[k] for k in headers])
    column_widths = {header: max(len(header), *(len(str(row[i])) for row in rows)) for i, header in enumerate(headers)}
    header_format = " | ".join(f"{{:{column_widths[header]}}}" for header in headers)
    row_format = header_format
    echo(header_format.format(*headers))
    echo("-+-".join(‘-’ * column_widths[header] for header in headers))
    for row in rows:
        echo(row_format.format(*row))

@tool.command()
def list_steam_input():
    """List Steam Input settings"""
    with open(SHORTCUTS_FILE, "rb") as h:
        data = binary_load(h)
    data = CaseInsensitiveDict(data[‘shortcuts’])
    apps = {}
    for k,v in data.items():
        apps[str(v[‘appid’])]=v[‘AppName’]
    with open(LOCALCONFIG_FILE, "r", encoding="utf8") as h:
        data = parse(h)
    if ‘UserLocalConfigStore’ not in data:
        return
    data = data[‘UserLocalConfigStore’][‘apps’]
    for k in data:
        data[k]["appid"] = k
        if k in apps:
            data[k]["AppName"] = apps[k]
        else:
            data[k]["AppName"] = "(Unknown)"

    headers = "appid AppName OverlayAppEnable UseSteamControllerConfig SteamControllerRumble SteamControllerRumbleIntensity".split()
    rows = []
    for r in data:
        rows.append([data[r][k] if k in data[r] else "" for k in headers])
    column_widths = {header: max(len(header), *(len(str(row[i])) for row in rows)) for i, header in enumerate(headers)}
    header_format = " | ".join(f"{{:{column_widths[header]}}}" for header in headers)
    row_format = header_format
    echo(header_format.format(*headers))
    echo("-+-".join(‘-’ * column_widths[header] for header in headers))
    for row in rows:
        echo(row_format.format(*row))

@tool.command()
@argument(‘appid’, type=STRING)
def disable_steam_input(appid):
    """Disable Steam Input for an appid"""
    if isinstance(appid, str):
        with open(SHORTCUTS_FILE, "rb") as h:
            data = binary_load(h)
        data = data[‘shortcuts’]
        apps = {}
        for k,v in data.items():
            apps[str(v[‘appid’])]=v[‘AppName’]
        if appid not in apps:
            log.error(f"invalid appid {appid}")
            return
        with open(LOCALCONFIG_FILE, "r", encoding="utf8") as h:
            data = parse(h)
        if ‘UserLocalConfigStore’ not in data:
            data[‘UserLocalConfigStore’] = {‘apps’:{}}
        apps = data[‘UserLocalConfigStore’][‘apps’]
        if appid not in apps:
            apps[appid]={}
        apps[appid]["OverlayAppEnable"] = "1"
        apps[appid]["UseSteamControllerConfig"] = "0"
        apps[appid]["SteamControllerRumble"] = "-1"
        apps[appid]["SteamControllerRumbleIntensity"] = "320"
        with open(LOCALCONFIG_FILE, "w", encoding="utf8") as h:
            dump(data, h)

@tool.command()
@argument(‘grid_id’)
def fetch(grid_id):
    """Fetch media for <grid_id> from SteamGridDB"""
    fetch_images(grid_id)

def find_id(name):
    headers={‘Authorization’: f’Bearer {STEAMGRIDDB_API_KEY}'}
    with Session() as s:
        response = s.get(f’https://www.steamgriddb.com/api/v2/search/autocomplete/{name}',
                         headers=headers)
        log.info(f"{name}:{response.status_code}")
        if response.status_code == 200:
            data = response.json()
            if data[‘success’]:
                return data[‘data’][0][‘id’] # take first result only

def fetch_images(game_id):
    headers={‘Authorization’: f’Bearer {STEAMGRIDDB_API_KEY}'}
    with Session() as s:
        for image_type in [‘banner’,'grid', ‘hero’, ‘logo’]:
            local_path = join(CACHE_PATH,f"{game_id}.{image_type}")
            have = False
            for ext in [".jpg", ".png"]:
                if exists(f"{local_path}{ext}"):
                    have = True
            if have:
                continue

            if image_type == ‘hero’:
                base_url = f’https://www.steamgriddb.com/api/v2/heroes/game/{game_id}'
            elif image_type == ‘banner’:
                base_url = f’https://www.steamgriddb.com/api/v2/grids/game/{game_id}?dimensions=920x430,460x215'
            else:
                base_url = f’https://www.steamgriddb.com/api/v2/{image_type}s/game/{game_id}'

            response = s.get(base_url, headers=headers)
            log.info(f"{game_id},{image_type},{response.status_code}")

            if response.status_code == 200:
                data = response.json()
                if data[‘success’] and data[‘data’]:
                    image_url = data[‘data’][0][‘url’]
                    ext = splitext(image_url)[1]
                    response = s.get(image_url)
                    if response.status_code == 200:
                        with open(f"{local_path}{ext}", ‘wb’) as f:
                            f.write(response.content)
                        log.info(f"{image_url}->{local_path}")

@tool.command()
@option("-e", "–emulator", default="org.retrodeck.RetroDECK", help="flatpak identifier")
@option("-a", "–args", multiple=True, help="arguments")
@option("-n", "–name", default="RetroDECK", help="shortcut name")
@option("-i", "–dbid", help="SteamGridDB ID to get images from")
def create(emulator, args, name, dbid):
    """Create a new shortcut entry"""

    if not dbid:
        dbid = find_id(name)
    fetch_images(dbid)

    if exists(SHORTCUTS_FILE):
        with open(SHORTCUTS_FILE, ‘rb’) as f:
            shortcuts = binary_load(f)
    else:
        shortcuts = {‘shortcuts’: {}}

    appid = str(crc32(name.encode(‘utf-8’)) | 0x80000000)
    new_entry = {
        "appid": appid,
        "AppName": name,
        "Exe": "flatpak",
        "StartDir": "",
        "LaunchOptions": f"run {emulator} {quote(" ".join(args))}",
        "IsHidden": 0,
        "AllowDesktopConfig": 1,
        "OpenVR": 0,
        "Devkit": 0,
        "DevkitGameID": "shortcuts",
        "LastPlayTime": 0,
        "tags": {}
    }
    log.debug(new_entry)
    shortcuts[‘shortcuts’][str(len(shortcuts[‘shortcuts’]))] = new_entry
    log.info(f"added {appid} {name}")

    for image_type in [‘grid’, ‘hero’, ‘logo’,'banner']:
        local_path = join(CACHE_PATH,f"{dbid}.{image_type}")
        for e in [".jpg", ".png"]:
            if image_type == ‘grid’:
                dest_path = join(GRID_FOLDER, f'{appid}p{e}')
            elif image_type == ‘hero’:
                dest_path = join(GRID_FOLDER, f'{appid}_hero{e}')
            elif image_type == ‘logo’:
                dest_path = join(GRID_FOLDER, f'{appid}_logo{e}')
            elif image_type == ‘banner’:
                dest_path = join(GRID_FOLDER, f'{appid}{e}')
            log.debug(f"{local_path+e}->{dest_path}")
            if exists(local_path + e):
                copyfile(local_path+e, dest_path)

    with open(SHORTCUTS_FILE, ‘wb’) as f:
        binary_dump(shortcuts, f)
        log.info("shortcuts updated.")

if __name__ == ‘__main__’:
    tool()

```

[

Resources
----------

](/space/apps/steam#resources)

| Category |Date|                                                                          Link                                                                          |                        Notes                        |
|----------|----|--------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
|Deployment|2025|[docker-steam-headless](https://github.com/Steam-Headless/docker-steam-headless?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)|  Docker image for running Steam in headless mode.   |
|  Tools   |2026|              [moondeck](https://github.com/FrogTheFrog/moondeck?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)               |Steam Deck companion for managing gamestream sessions|