# Personal repository

Company-owned configurations, scripts, projects and work notes. Move projects to a team repository when they need shared ownership.

```text
dotfiles/                  Git, shell and readline preferences
```

Review dotfile fragments before enabling them.

Both variants have private GitHub visibility:

- Private: `personal-<login>`, accessible to the owner and company administrators.
- Internal: `personal-<login>-shared`, also readable by engineers.

Terraform enrollment manages names and access. Personal repository reviews are optional.

The template keeps `.github/CODEOWNERS` for infra review of shared starter changes; you can edit or remove it in your personal repository.

With an approved pre-commit installation, run `pre-commit run --all-files` for hygiene, private-key and spelling checks. Its gitleaks hook scans staged changes only. Local Git hooks are optional (`pre-commit install`); keep credentials out of Git.

Native creation copies workflows and Dependabot configuration. Every workflow job is restricted to `magicproduct/repo-template-personal`; checks cover workflow safety and code review, without CI secret-detection coverage. Actions remain disabled for generated repositories.

[General template reference](https://github.com/magicproduct/repo-template). Template maintainers review upstream changes; existing personal repositories receive no automatic updates.
