# dotfiles
MacBook config for jslatko_uhg. Uses [GNU stow](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) to manage dotfiles.

## Instructions
0. Install ansible.
1. Clone this repo to home directory. You should have `~/dotfiles` and its contents.
2. `cd dotfiles/homeroot` and run `ansible-playbook --ask-become-pass bootstrap.yml`.

### TODO
- Create a script or cron to autosave config when it changes.
- Automate git push for personal non-UHG config outside of UHG git orgs.
  - Use ansible playbook to install apps and setup dotfiles via stow.
