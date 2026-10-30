# hypr-palette

[![Check](https://github.com/kats76/hypr-palette/actions/workflows/check.yml/badge.svg)](https://github.com/kats76/hypr-palette/actions/workflows/check.yml)

[Leer en español](README.es.md)

A calm dark palette: deep navy backgrounds with muted purple and sage-teal accents, the same one my [Hyprland desktop](https://github.com/kats76/dotfiles) uses. Each color has one job everywhere: purple marks what is active, teal what is under the cursor. Here it is as a Firefox theme and Vimium styles.

![Firefox with the Hypr Palette theme](docs/img/firefox.webp)

![Palette](docs/img/palette.svg)

| Name | Color | Used for |
| --- | --- | --- |
| bg | `#1e1e2e` | Backgrounds |
| fg | `#cdd6f4` | Text |
| accent | `#8a63c7` | Selected tab, selection, focused items |
| accent2 | `#6f9f98` | Hover, focus border, loading |
| gray | `#a08f95` | Inactive tabs, borders |
| light | `#c7ced6` | Text on `accent` |

## Firefox theme

`firefox/manifest.json` is a Firefox theme: the window, toolbar, menus and sidebar in `bg`, the selected tab in `accent` (like the active workspace in waybar), the address bar one shade above `bg` with an `accent2` border when focused, and `accent2` on hover. Private windows keep Firefox's own purple design, so they still stand out.

**Install:** it is being reviewed on addons.mozilla.org. The install link will be here once it is approved.

**Try it without installing:** open `about:debugging#/runtime/this-firefox`, click *Load Temporary Add-on…* and pick `firefox/manifest.json`. It goes away when Firefox closes.

**Release a new version:**

1. Change the colors in `firefox/manifest.json` and raise `version`.
2. `./scripts/build-firefox.sh` writes `dist/hypr-palette-<version>.zip`.
3. Upload it as a new version on the add-on's page in the [Developer Hub](https://addons.mozilla.org/developers/).

CI runs `web-ext lint`, the same Mozilla linter that checks every submission.

## Vimium

`vimium/hypr-palette.css` styles [Vimium](https://github.com/philc/vimium), the extension to browse with the keyboard: link hints in `bg` with an `accent` border and the typed letters in `accent2`, the search bar (Vomnibar) with the selected result in `accent`, and the bottom messages (find, visual mode) to match. JetBrainsMono everywhere.

![Vimium link hints](docs/img/vimium-hints.webp)

![Vimium search bar](docs/img/vimium-vomnibar.webp)

**Apply:** Vimium options → *CSS for Vimium UI* (under advanced options) → paste the file and save. Press `f` on any page to see the hints and `o` for the search bar.

## Workflow

Same flow as my other repos: **`dev` is for testing, `main` is what gets published.** Every change starts as an issue, goes through a branch and a pull request to `dev` (Conventional Commits, squash merge), and `main` is fast-forwarded to `dev` once it is tested.

## License

[MIT](LICENSE). On addons.mozilla.org the theme is listed under Creative Commons Attribution 4.0, the closest option Mozilla offers for themes.
