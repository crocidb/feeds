+++
title = "Super ultrawide Niri"
description = '<img width="1600" height="450" alt="" src="/images/wide-niri-screen.jpg"A Niri workspace with 7 visible columns.After having used practically the same xmonad configuration for a decade and'
date = "2026-09-11T14:38:26Z"
url = "http://jonashietala.se/blog/2026/09/11/super_ultrawide_niri/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2026-09-21T09:42:47.087819912Z"
seen = false
+++

[<img width="1600" height="450" alt="" src="/images/wide-niri-screen.jpg">](/images/wide-niri-screen.jpg) A [Niri](https://github.com/niri-wm/niri) workspace with 7 visible columns.

After having used practically the same [xmonad](https://xmonad.org/) configuration for a decade and a half I’ve now modernized my setup with the [scrollable-tiling Wayland compositor Niri](https://github.com/niri-wm/niri). It’s been a bit of a struggle to unlearn my old workflow but I’m really growing to love [Niri](https://github.com/niri-wm/niri)’s scrollable workflow, especially on my new super ultrawide display.

[Samsung Odyssey Neo G9 G95NC 57”](#Samsung-Odyssey-Neo-G9-G95NC-57)
----------

<img loading="lazy" decoding="async" width="1600" height="912" alt="" src="/images/g9_photo.jpg"> My new 57” single monitor setup.

What kicked off my [Niri](https://github.com/niri-wm/niri) journey was the purchase of a new super ultrawide monitor.

I bought the [57” Odyssey Neo G9](https://www.samsung.com/se/monitors/gaming/odyssey-neo-g9-g95nc-57-inch-240hz-curved-dual-uhd-ls57cg952nuxen/) as it was the largest monitor I could find. (It’s marketed as a “gaming” display but it’s really an amazing productivity display.)

It replaced my old 3-monitor setup:

<img loading="lazy" decoding="async" width="1600" height="1200" alt="" src="/images/uses/workstation.jpg"> My old 3-monitor setup.

The new display is wider so I had to move the speakers around 10–15cm further apart.

I was debating whether to replace the center 31.5” monitor or replace all monitors with a single one but I think I made the right choice with the ultrawide. The curvature wasn’t an issue (I’ve come to prefer it) and the extra vertical space the portrait side monitors provided wasn’t as crucial as I thought.

I think an ultrawide is worth it just to get rid of the annoying bezels. Small things can be a big thing sometimes.

[A more dynamic workflow](#A-more-dynamic-workflow)
----------

[xmonad](https://xmonad.org/) and [Niri](https://github.com/niri-wm/niri) are similar yet different. Both automatically lay out windows as you spawn them but [xmonad](https://xmonad.org/) (at least the way I used it) follows a layout algorithm that re-flows using a “master” window and combines the rest of the windows into one space, while [Niri](https://github.com/niri-wm/niri) lays out windows in columns.

The change is subtle but it implies that a *new window won’t change the size of other windows*. This is very nice if you spawn a lot of short-lived terminals or web browsers like I do and it reduces the amount of manual reshuffling I spend time on.

My [xmonad](https://xmonad.org/) workflow was more static than my [Niri](https://github.com/niri-wm/niri) one. In [xmonad](https://xmonad.org/) I made heavy use of workspaces, mapping ten workspaces mentally to different programs, such as `0` Firefox and `1` terminal logs on the left monitor; `3`, `4` and `5` for different Neovim instances on the center monitor; `8` as chat and `9` for music or video on the right monitor. I had no rules to enforce this; it’s an emergent behaviour that served me well for years.

With [Niri](https://github.com/niri-wm/niri) it’s more dynamic. I still use workspaces but they no longer have direct shortcuts, I simply go up/down in the workspace list. Maybe I’ll add them in the future but with 3–4 workspaces that’s not as necessary. I spawn workspaces/windows when I need them and remove them when I’m done.

Usually it’s one workspace per project (yes, I’m now one of those who have multiple up at once) with all the related things such as editor, terminals, and browser with docs. I don’t typically utilize the full screen width and I try to keep the things I’m working on in the center, often leaving 10–30% gaps on the sides. Even though I don’t normally use the “endless scrolling” feature of [Niri](https://github.com/niri-wm/niri) I re-center selected windows all the time so I can look straight ahead as much as possible.

[Keyboard shortcuts](#Keyboard-shortcuts)
----------

As a fan of [keyboard layouts](/blog/tags/keyboard_layouts/) of course I have to spend some time tinkering with good keyboard shortcuts (especially as Niri’s recommended keybinds don’t map well with [my custom keyboard](/blog/2024/11/26/building_my_ultimate_keyboard) or [custom layout](/blog/2024/11/26/the_current_cybershard_layout)).

### [Navigation layer](#Navigation-layer) ###

![](/images/niri/_NIRI.svg)

What I did was add a new navigation layer that’s enabled by holding `Tab` (ring + middle + index on the left-hand side) with all [Niri](https://github.com/niri-wm/niri) related movement and layout keybinds.

In the graphics above, all green-colored keys emit `Gui` (which gates all window manager commands) and you can see:

* [Long press](/blog/2024/11/26/the_current_cybershard_layout#Long-press) on `Close Window` to close a window.

  The long press requirement prevents accidentally closing windows.

* Arrows move through columns/windows.

  [Long press](/blog/2024/11/26/the_current_cybershard_layout#Long-press) resizes them.

* `Workspace` `Up`/`Down` focuses a different workspace.

* `Center` a column.

* `Consume`/`Expel` to combine windows into one column.

  (`consume-or-expel-window-left`/`consume-or-expel-window-right`)

* `Expand Column` makes a column take up all remaining space.

  (`expand-column-to-available-width`)

* Audio controls.

  To press them I release the index finger (keeping the ring and middle finger pressed to keep the layer active) and use the index to press the audio buttons.

* Mouse buttons.

  In Niri you can move floating windows with `Gui` + `Left Mouse` and `Gui` + `Right Mouse` to resize them. As my main mouse is a [trackball integrated into the keyboard](/blog/2024/11/26/building_my_ultimate_keyboard#Remove-mouse-keys) I had to add them to the left-hand side.

  I ended up using QMK’s [customizable key repress](https://docs.qmk.fm/features/combo#customizable-key-repress) feature that allows me to:

  1. Press the `Tab` combo with my three fingers (layer is active)
  2. Release only the index (layer is still active, same as with the audio controls)
  3. Press the index again (now detects the press `Gui` + `Left Mouse` key down)
  4. Use the trackball to move the window

  And similarly for the right mouse button to resize with the middle finger. Works great!

Because there are so many commands I want to send I placed `Ctrl` on the thumb that provides movement-related commands like so:

![](/images/niri/_NIRI_CTRL.svg)

For example:

* Arrows move columns/windows in the four directions.

* Move columns to the neighboring workspaces.

* Center visible columns.

  (`center-visible-columns`)

* Slightly different consume/expel semantics.

  (`consume-window-into-column`/`expel-window-from-column`)

### [Regular keymaps](#Regular-keymaps) ###

These are triggered in the “normal” way by first pressing the [`Super` combo](/blog/2024/11/26/the_current_cybershard_layout#Neighbour-combos) and then another key on the [base layer](/blog/2024/11/26/the_current_cybershard_layout/#Base) (I use [autoshift](/blog/2024/11/26/the_current_cybershard_layout#Long-press) so I shift with a [long press](/blog/2024/11/26/the_current_cybershard_layout#Long-press)).

#### [Window management](#Window-management) ####

* `Super` + `F` toggle windowed fullscreen (keep column width)
* `Super` + `Shift` + `F` fullscreen window (over the entire display)
* `Super` + `M` maximize column (moves other columns)

#### [Run stuff](#Run-stuff) ####

* `Super` + `Enter` terminal
* `Super` + `E` Noctalia’s launcher (also exists on the [navigation layer](#Navigation-layer) as `Launch`)
* `Super` + `S` show Noctalia control center
* `Super` + `Shift` + `S` show Noctalia settings
* `Super` + `Q` power off monitors (they wake on input)
* `Super` + `Shift` + `Q` show Noctalia session menu (reboot etc)
* `Super` + `Shift` + `L` lock screen

#### [Misc](#Misc) ####

* `Super` + `H` show hotkey overlay
* `Super` + `P` interactive screenshot
* `Super` + `Shift` + `P` screenshot selected window

[Tweaks to the standard CachyOS setup](#Tweaks-to-the-standard-CachyOS-setup)
----------

In the process of moving from [xmonad](https://xmonad.org/) to [Niri](https://github.com/niri-wm/niri) I also moved from [Void Linux](https://voidlinux.org/) to [CachyOS](https://cachyos.org/) and I let the installer install [Niri](https://github.com/niri-wm/niri) and give me a basic configuration together with [Noctalia](https://github.com/noctalia-dev/noctalia-shell) (that provides a statusbar, notifications, and a bunch of things you apparently need).

### [Center the status bar and other Noctalia windows](#Center-the-status-bar-and-other-Noctalia-windows) ###

<img loading="lazy" decoding="async" width="982" height="26" alt="" src="/images/noctalia_bar.png"> My centered [Noctalia](https://github.com/noctalia-dev/noctalia-shell) status bar.

Feels absolutely required on this screen otherwise things end up in the corners.

### [Firefox on XWayland](#Firefox-on-XWayland) ###

Force Firefox onto XWayland as the [Wayland popup manager is broken](https://bugzilla.mozilla.org/show_bug.cgi?id=2036213):

```
environment {
  MOZ_ENABLE_WAYLAND "0"
}

```

### [Dead keys for Ghostty](#Dead-keys-for-Ghostty) ###

For some reason dead keys were broken in Ghostty. This is bad for me as the OS keyboard is set to Swedish and it uses them to type `~` (quite a crucial character for a programmer).

The fix:

```
environment {
  GTK_IM_MODULE "ibus"
  QT_IM_MODULE "ibus"
  XMODIFIERS "@im=ibus"
}

```

This needs ibus installed and running.

### [Melange colorscheme](#Melange-colorscheme) ###

[Noctalia](https://github.com/noctalia-dev/noctalia-shell) discovers custom color schemes under `~/.config/noctalia/colorschemes/<Name>/<Name>.json`, so I dropped in my trusty [Melange](https://github.com/savq/melange-nvim) colorscheme there:

```
{
  "dark": {
    "mPrimary": "#EBC06D",
    "mOnPrimary": "#292522",
    "mSecondary": "#A3A9CE",
    "mOnSecondary": "#292522",
    "mTertiary": "#85B695",
    "mOnTertiary": "#292522",
    "mError": "#D47766",
    "mOnError": "#292522",
    "mSurface": "#292522",
    "mOnSurface": "#ECE1D7",
    "mSurfaceVariant": "#34302C",
    "mOnSurfaceVariant": "#C1A78E",
    "mOutline": "#867462",
    "mShadow": "#1a1816",
    "mHover": "#E49B5D",
    "mOnHover": "#292522",
    "terminal": {
      "normal": {
        "black": "#867462",
        "red": "#D47766",
        "green": "#85B695",
        "yellow": "#EBC06D",
        "blue": "#A3A9CE",
        "magenta": "#CF9BC2",
        "cyan": "#89B3B6",
        "white": "#ECE1D7"
      },
      "bright": {
        "black": "#34302C",
        "red": "#BD8183",
        "green": "#78997A",
        "yellow": "#E49B5D",
        "blue": "#7F91B2",
        "magenta": "#B380B0",
        "cyan": "#7B9695",
        "white": "#C1A78E"
      },
      "foreground": "#ECE1D7",
      "background": "#292522",
      "selectionFg": "#C1A78E",
      "selectionBg": "#403A36",
      "cursorText": "#292522",
      "cursor": "#EBC06D"
    }
  }
}

```

Then pick the colorscheme:

```
"colorSchemes": {
    "darkMode": true,
    "predefinedScheme": "Melange",
    "useWallpaperColors": false
}

```

### [Layout appearance](#Layout-appearance) ###

The default appearance was pretty I admit but way too much blank space and weirdness. Some tweaks:

```
layout {
    // Required for noctalia-shell to set wallpaper
    background-color "transparent"

    // Never auto-center focused columns (too much movement)
    center-focused-column "never"
    // But do center a single window
    always-center-single-column

    // No extra space around it all
    struts {}
    // No gaps between windows
    gaps 0
    // The focus ring was annoying
    focus-ring {
        off
    }
    // Use a border with consistent width for all windows instead
    border {
        on
        width 2
        active-color "#ebc06d"
        inactive-color "#403a36"
    }

    // Setting widths is important with such a large screen
    preset-column-widths {
        proportion 0.15
        proportion 0.3
        proportion 0.4
    }
    default-column-width { proportion 0.15; }

    // Heights too, why not?
    preset-window-heights {
        proportion 0.15
        proportion 0.5
        proportion 1.0
    }
}

```

```
// Prevent the mouse from opening the overview in the corners
gestures {
    hot-corners {
        off
    }
}

```

### [Keep windows centered](#Keep-windows-centered) ###

Niri has the `always-center-single-column` option, which is nice as I want to keep as much as possible in the center of the monitor when I’m working. But I very frequently use 2–3 smaller windows and with my frequent opening and closing I’d like them centered too.

Luckily, Niri has an [IPC](https://github.com/niri-wm/niri/wiki/IPC) you can use to make a small program that reacts to events and does this for you. I made a small rust project using the [niri-ipc](https://niri-wm.github.io/niri/niri_ipc/) crate that does this for me:

<details class="details"><summary>The autocenter implementation</summary>

```
[dependencies]
niri-ipc = "26.4.0"

```

```
use std::collections::HashMap;
use std::io;

use niri_ipc::socket::Socket;
use niri_ipc::{Action, Event, Request, Response, Window, Workspace};

#[derive(Clone, Copy, PartialEq, Eq, Hash)]
struct WindowId(u64);

#[derive(Clone, Copy, PartialEq, Eq)]
struct WorkspaceId(u64);

struct OutputName<'a>(&'a str);

struct WindowState {
    workspace: Option<WorkspaceId>,
    width: f64,
}

fn main() -> io::Result<()> {
    let mut socket = Socket::connect()?;
    if !matches!(socket.send(Request::EventStream)?, Ok(Response::Handled)) {
        eprintln!("niri rejected event stream");
        std::process::exit(1);
    }

    let mut known: HashMap<WindowId, WindowState> = HashMap::new();
    let mut read_event = socket.read_events();
    loop {
        let result = match read_event()? {
            // A full snapshot of the current state. Just refresh our state.
            Event::WindowsChanged { windows } => {
                known = windows
                    .into_iter()
                    .map(|w| {
                        (
                            WindowId(w.id),
                            WindowState {
                                workspace: w.workspace_id.map(WorkspaceId),
                                width: w.layout.tile_size.0,
                            },
                        )
                    })
                    .collect();
                Ok(())
            }
            Event::WindowOpenedOrChanged { window } => {
                let workspace = window.workspace_id.map(WorkspaceId);
                let entry = WindowState {
                    workspace,
                    width: window.layout.tile_size.0,
                };
                let prev = known.insert(WindowId(window.id), entry);
                match prev {
                    // Don't center floats.
                    _ if window.is_floating => Ok(()),
                    // New window, try to re-center.
                    None => maybe_center_new(&window),
                    // Window changed workspace, try to re-center.
                    Some(state) if state.workspace != workspace => center_focused_if_fits(),
                    // Skip other things.
                    Some(_) => Ok(()),
                }
            }
            Event::WindowClosed { id } => {
                if known.remove(&WindowId(id)).is_some() {
                    center_focused_if_fits()
                } else {
                    Ok(())
                }
            }
            Event::WindowLayoutsChanged { changes } => {
                // Only re-center if the width was changed, otherwise our re-center will
                // loop back indefinitely.
                let mut resized = false;
                for (id, layout) in changes {
                    if let Some(state) = known.get_mut(&WindowId(id)) {
                        if (state.width - layout.tile_size.0).abs() > 0.5 {
                            state.width = layout.tile_size.0;
                            resized = true;
                        }
                    }
                }
                if resized {
                    center_focused_if_fits()
                } else {
                    Ok(())
                }
            }
            _ => Ok(()),
        };

        if let Err(e) = result {
            eprintln!("autocenter: {e}");
        }
    }
}

/// Center a newly created window if the workspace is focused and if there's surrounding free space left.
fn maybe_center_new(window: &Window) -> io::Result<()> {
    let Some(workspace_id) = window.workspace_id.map(WorkspaceId) else {
        return Ok(());
    };
    let Some(focused) = focused_workspace()? else {
        return Ok(());
    };
    if WorkspaceId(focused.id) == workspace_id {
        center_if_fits(&focused)?;
    }
    Ok(())
}

/// Center windows in the focused workspace if there's surrounding free space left.
fn center_focused_if_fits() -> io::Result<()> {
    if let Some(focused) = focused_workspace()? {
        center_if_fits(&focused)?;
    }
    Ok(())
}

/// Center windows in the workspace if there's surrounding free space left.
fn center_if_fits(workspace: &Workspace) -> io::Result<()> {
    let Some(output) = workspace.output.as_deref().map(OutputName) else {
        return Ok(());
    };
    let Some(width) = output_width(output)? else {
        return Ok(());
    };
    if workspace_width(WorkspaceId(workspace.id))? < f64::from(width) {
        center_visible_columns()?;
    }
    Ok(())
}

/// Issue a one-shot query to Niri, wait, and return the response.
fn query(request: Request) -> io::Result<Response> {
    match Socket::connect()?.send(request)? {
        Ok(response) => Ok(response),
        Err(msg) => Err(io::Error::other(msg)),
    }
}

/// Get the focused workspace.
fn focused_workspace() -> io::Result<Option<Workspace>> {
    match query(Request::Workspaces)? {
        Response::Workspaces(ws) => Ok(ws.into_iter().find(|w| w.is_focused)),
        _ => Ok(None),
    }
}

/// Get the width of an output (monitor).
fn output_width(name: OutputName<'_>) -> io::Result<Option<u32>> {
    match query(Request::Outputs)? {
        Response::Outputs(outputs) => Ok(outputs
            .get(name.0)
            .and_then(|o| o.logical.as_ref())
            .map(|l| l.width)),
        _ => Ok(None),
    }
}

/// Calculates the width of all columns in the workspace.
fn workspace_width(workspace_id: WorkspaceId) -> io::Result<f64> {
    let Response::Windows(windows) = query(Request::Windows)? else {
        return Ok(0.0);
    };
    let mut columns: HashMap<usize, f64> = HashMap::new();
    for w in windows {
        if w.workspace_id.map(WorkspaceId) != Some(workspace_id) {
            continue;
        }
        if let Some((col, _)) = w.layout.pos_in_scrolling_layout {
            let width = columns.entry(col).or_insert(0.0);
            *width = width.max(w.layout.tile_size.0);
        }
    }
    Ok(columns.values().sum())
}

/// Send a command to center the visible columns.
fn center_visible_columns() -> io::Result<()> {
    if let Err(msg) = Socket::connect()?.send(Request::Action(Action::CenterVisibleColumns {}))? {
        eprintln!("center-visible-columns rejected: {msg}");
    }
    Ok(())
}

```

</details>

One catch is that if a new window overflows the monitor width, the script won’t center the columns even if there would be free space left afterwards. This is a little weird but it’s consistent with Niri’s `center-visible-columns` command. I had a small itch to try to hack around it but in the end I left it alone…

[Is ](#Is-Niri-worth-it)[Niri](https://github.com/niri-wm/niri) worth it?
----------

Yes, absolutely. [Niri](https://github.com/niri-wm/niri) has been a huge upgrade for me *in combination* with a single wide screen. My [xmonad](https://xmonad.org/) setup worked really well with three monitors—arguably a better fit in that context than [Niri](https://github.com/niri-wm/niri)—but for the big-screen use-case [Niri](https://github.com/niri-wm/niri) is superior.

I’m curious how it holds up on my laptop, once I gather enough energy to install [CachyOS](https://cachyos.org/) on it… But that’s a side quest. The big-screen setup I spend most of my days in is the best I’ve ever had, and I have no desire to go back.