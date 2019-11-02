# Redmine Issue Templates Plugin

[![Plugin info at redmine.org](https://img.shields.io/badge/Redmine-plugin-green.svg?)](http://www.redmine.org/plugins/redmine_issue_templates)
[![CircleCI](https://circleci.com/gh/akiko-pusu/redmine_issue_templates/tree/master.svg?style=shield)](https://circleci.com/gh/akiko-pusu/redmine_issue_templates/tree/master)
[![Sider](https://img.shields.io/badge/Special%20Thanks!-Sider-blue.svg?)](https://sider.review/features)

Plugin to generate and use issue templates for each project to assist issue
creation. For Redmine 2.1.x or higher, please use version 0.0.4 or higher. For
Redmine 2.0, please use version 0.0.3 or higher.

## Repository

* <https://github.com/akiko-pusu/redmine_issue_templates>

## Plugin installation

1. Copy the plugin directory into the $REDMINE_ROOT/plugins directory. Please
    note that plugin's folder name should be "redmine_issue_templates". If
    changed, some migration task will be failed.
2. Do migration task.

    e.g. rails redmine:plugins:migrate RAILS_ENV=production

3. (Re)Start Redmine.

## Uninstall

Try this:

* rails redmine:plugins:migrate NAME=redmine_issue_templates VERSION=0
    RAILS_ENV=production

See also:
<http://www.r-labs.org/projects/issue-template/wiki/About_en#Uninstall-plugin>

## Required Settings

1. Login to your Redmine install as an Administrator
2. Enable the permissions for your Roles:

    * Show issue templates: User can show issue templates and use templates when creating/updating issues.
    * Edit issue templates: User can create/update/activate templates for each project.
    * Manage issue templates: User can edit help message of templates for each project.

3. Enable the module "Issue Template" on the project setting page.
4. The link to the plugin should appear on that project's navigation.

## Note

This plugin aims to assist contributor's feedback by using template if the
project has some format for issues.

## Troubleshoot for bundle intall and startup problem

This plugin repository includes some test code and gem settiing. If you have
some trouble related "bundle intall", please try --without option.

    Exp. bundle install --without test

## WebPage

* <https://www.redmine.org/plugins/redmine_issue_templates> (Redmine Plugin List)
* <http://www.r-labs.org/projects/issue-template> (Project Page)
* <https://github.com/akiko-pusu/redmine_issue_templates> (Repository & Issues)

If you have any requests, bug reports, please use GitHub issues. <https://github.com/akiko-pusu/redmine_issue_templates>

## Description and usage info

* <http://www.r-labs.org/projects/issue-template/wiki/About_en>

## Changelog

### 0.3.5

NOTE: This version requires migration command to enhance note template's feature.
``Note Template visibility per role`` feature is still a prototype, so feedback highly appreciate!

* Design: PR / Mrliptontea theme compatibility #266 (by mrliptontea)
* Bugfix: #270 / Apply polyfill code for IE11. (reported by yui-har)
* Feature: Note Template visibility per role. #267
* Bugfix: Fix the request URL for accessing note_templates/load #261 (by ishikawa999)
* Bugfix: Note Template does not work on CKEDitor. #275
* Update README for contribution #273

### 0.3.4

This is bugfix release against v0.3.3.

* Add navigation link between issue template and note template.
* Refactor: Change to use let / const instead of var.
* Update test environment, especially E2E. (Follow up Redmine4.1)
* Bugfix #256 / Related to checklists.

### 0.3.3

This is bugfix release against v0.3.2.
Updating to 0.3.3 is highly recommended!

* Revert and Bugfix #230
  * Merge pull request #252 from ishikawa999/fix/248 by @ishikawa999
* Bugfix: #234 / Enable to save checklists when updating a template.

### 0.3.2

* Bugfix: Adding issue templates with checklists occurs internal error.(#243)
* Merge PR commit: bca2fe481 by @two-pack, restored missing newline. (Related: #242)
* Feature: Add clear subject/body option when tracker changed which has no template. (#230)
* Code refactoring.

### 0.3.1

* Basic feature implemented of note template.
* Enabled to use issue templates when updating issue.
  * Go to global template admin setting, and turn on "apply_template_when_edit_issue" flag.
* Bugfix: Prevent conflict against issue controller helper. (#217)
* Update readme: Merged PR #219. Thanks Arnaud Venturi!

NOTE: This version requires migration command to use note template feature.

```
$ rails redmine:plugins:migrate RAILS_ENV=production
```

### 0.3.0

* Support Redmine 4.x.
  * Now master branch unsupports Redmine 3.x.
  * Please use ver **0.2.x** or ``v0.2.x-support-Redmine3`` branch
    in case using Redmine3.x.
* Follow Redmine's preview option to the wiki toolbar.
* Show additional navigation message when plugin is applied to Redmine 3.x.

NOTE: Mainly, maintenance, bugfix and refactoring only. There is no additional feature, translation in this release.
Thank you for creating patch, Mizuki Ishikawa!

### 0.2.1

Mainly, bugfix and refactoring release.
Updating to 0.2.1 is highly recommended in case using CKEditor or MySQL replication.
NOTE: Migration is required, especially using MySQL replication.

* Bugfix: Fix "Page not found" error when try to create project template from project setting. (GitHub: #192, #199)
* Bugfix: Add composite unique index to support MySQL group replication. (GitHub: #197)
* Workaround: Wait fot 200 msec until CKE Editor's ajax callback done. (GitHub: #193)
* Add feature to hide confirmation dialog when overwritten issue subject and description, with using user cookie. (GitHub: #190)
* Refactoring: Minitest and so on.

A cookie named "issue_template_confirm_to_replace_hide_dialog" is stored from this release. (Related: #190)

### 0.2.0

Bugfix and refactoring release.
Updating from v0.1.9 to 0.2.0 is highly recommended.
In this release, some methods which implemented on Redmine v3.3 are ported
for plugin's compatibility. (To support Redmine 3.0 - 3.4)

* Bugfix: Prevent to call unimplemened methods prior to Redmine3.2. (GitHub: #180)
* Refactoring: Code format. (JS, CSS) / Update config for E2E test.
* Updated Simplified Chinese translation, thanks Steven.W. (GitHub PR: #179)
* Applied responsive layout against template list (index) page.

Thank you for reviewing, Tatsuya Saito!

For release notes before v0.2.0, please see: [RELEASE-NOTES.md](RELEASE-NOTES.md)

### Contributing

Pull requests, reporting issues, stars are always welcome!

I'm always thrilled to receive pull requests, and do my best to process them as fast as possible.
Not sure if that typo is worth a pull request? Do it! I will appreciate it.

* Fork it!
* Create your feature branch: git checkout -b my-new-feature
* Commit your changes: git commit -am 'Add some feature'
* Push to the branch: git push origin my-new-feature
* Submit a pull request :D

### Language and I18n contributors

* Brazilian: Adriano Ceccarelli / Pedro Moritz de Carvalho Neto
* Korean: Jaebok Oh
* Chinese: Steven Wong
* Bulgarian: Ivan Cenov
* Russian: Denny Brain, danaivehr
* German: Terence Miller and anonymous contributor
* French: Anonymous one
* Serbian: Miodrag Milic
* Polish: Paweł Budikom and Krzysztof Wosinski
* Spanish: Andres Arias
* Italian: Luca Lesinigo
* Danish: AThomsen

### Rake Tasks

You can see rake task, with (bundle exec) rake -T, related to this plugin.

Exp.

```bash
# Apply inhelit template setting to child projects
$ rake redmine_issue_templates:apply_inhelit_template_to_child_projects[project_id]

# Run test for redmine_issue_template plugin
$ rake redmine_issue_templates:default

# Run spec for redmine_issue_template plugin
$ rake redmine_issue_templates:spec

# Run tests
$ rake redmine_issue_templates:test

# Unapply inhelit template setting from child projects
$ rake redmine_issue_templates:unapply_inhelit_template_from_child_projects[project_id]

# Generate YARD Documentation for redmine_issue_template plugin
$ rake redmine_issue_templates:yardoc
```

You can apply/unapply inherit templates for all the hild projects.

```bash
rake redmine_issue_templates:apply_inhelit_template_to_child_projects[project_id]      # Apply inhelit template setting to child projects
rake redmine_issue_templates:unapply_inhelit_template_from_child_projects[project_id]  # Unapply inhelit template setting from child projects
```

If you want to apply inherit templates setting all the child project of project_id: 1 (as parent project), please run rake command like this:

rake redmine_issue_templates:apply_inhelit_template_to_child_projects[1]

### Run test

Please see wercker.yml for more details.

```bash
% cd REDMINE_ROOT_DIR
% cp plugins/redmine_issue_templates/Gemfile.local plugins/redmine_issue_templates/Gemfile
% bundle install --with test
% export RAILS_ENV=test
% bundle exec ruby -I"lib:test" -I plugins/redmine_issue_templates/test plugins/redmine_issue_templates/test/functional/issue_templates_controller_test.rb
```

or

```bash
% bundle exec rails redmine_issue_templates:test
```

#### Run spec

Please see wercker.yml for more details.

```bash
% cd REDMINE_ROOT_DIR
% cp plugins/redmine_issue_templates/Gemfile.local plugins/redmine_issue_templates/Gemfile
% bundle install --with test
% export RAILS_ENV=test
% bundle exec rspec -I plugins/redmine_issue_templates/spec --format documentation plugins/redmine_issue_templates/spec/
```

By default, use chrome as a webdriver. If you set environment variable
'DRIVER' to 'headless', headless_chrome is used.

```bash
% bundle exec rspec -I plugins/redmine_issue_templates/spec --format documentation plugins/redmine_issue_templates/spec/ DRIVER='headless'
```

### License

This software is licensed under the GNU GPL v2.
