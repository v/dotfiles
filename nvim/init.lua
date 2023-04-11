
:Build::
'require'' ':'' '("Test/tests'@travis'@.Travis")'"'' :
Bundler

Docs header transparent bg
bundle gem
bundle-gem - Generate a project skeleton for creating a rubygem

bundle gem GEM_NAME OPTIONS
Description
Generates a directory named GEM_NAME with a Rakefile, GEM_NAME.gemspec, and other supporting files and directories that can be used to develop a rubygem with that name.

Run rake -T in the resulting project for a list of Rake tasks that can be used to test and publish the gem to rubygems.org.

The generated project skeleton can be customized with OPTIONS, as explained below. Note that these options can also be specified via Bundler's global configuration file using the following names:

gem.coc
gem.mit
gem.test
Options
--exe or -b or --bin: Specify that Bundler should create a binary executable (as exe/GEM_NAME) in the generated rubygem project. This binary will also be added to the GEM_NAME.gemspec manifest. This behavior is disabled by default.

--no-exe: Do not create a binary (overrides --exe specified in the global config).

--coc: Add a CODE_OF_CONDUCT.md file to the root of the generated project. If this option is unspecified, an interactive prompt will be displayed and the answer will be saved in Bundler's global config for future bundle gem use.

--no-coc: Do not create a CODE_OF_CONDUCT.md (overrides --coc specified in the global config).

--ext=c, --ext=rust Add boilerplate for C or Rust (currently magnus based) extension code to the generated project. This behavior is disabled by default.

--no-ext: Do not add extension code (overrides --ext specified in the global config).

--mit: Add an MIT license to a LICENSE.txt file in the root of the generated project. Your name from the global git config is used for the copyright statement. If this option is unspecified, an interactive prompt will be displayed and the answer will be saved in Bundler's global config for future bundle gem use.

--no-mit: Do not create a LICENSE.txt (overrides --mit specified in the global config).

-t, --test=minitest, --test=rspec, --test=test-unit: Specify the test framework that Bundler should use when generating the project. Acceptable values are minitest, rspec and test-unit. The GEM_NAME.gemspec will be configured and a skeleton test/spec directory will be created based on this option. Given no option is specified:

When Bundler is configured to generate tests, this defaults to Bundler's global config setting gem.test.

When Bundler is configured to not generate tests, an interactive prompt will be displayed and the answer will be used for the current rubygem project.

When Bundler is unconfigured, an interactive prompt will be displayed and the answer will be saved in Bundler's global config for future bundle gem use.

--ci, --ci=github, --ci=gitlab, --ci=circle: Specify the continuous integration service that Bundler should use when generating the project. Acceptable values are github, gitlab and circle. A configuration file will be generated in the project directory. Given no option is specified:

When Bundler is configured to generate CI files, this defaults to Bundler's global config setting gem.ci.

When Bundler is configured to not generate CI files, an interactive prompt will be displayed and the answer will be used for the current rubygem project.

When Bundler is unconfigured, an interactive prompt will be displayed and the answer will be saved in Bundler's global config for future bundle gem use.

--linter, --linter=rubocop, --linter=standard: Specify the linter and code formatter that Bundler should add to the project's development dependencies. Acceptable values are rubocop and standard. A configuration file will be generated in the project directory. Given no option is specified:

When Bundler is configured to add a linter, this defaults to Bundler's global config setting gem.linter.

When Bundler is configured not to add a linter, an interactive prompt will be displayed and the answer will be used for the current rubygem project.

When Bundler is unconfigured, an interactive prompt will be displayed and the answer will be saved in Bundler's global config for future bundle gem use.

-e, --edit[=EDITOR]: Open the resulting GEM_NAME.gemspec in EDITOR, or the default editor if not specified. The default is $BUNDLER_EDITOR, $VISUAL, or $EDITOR.

See Also
bundle config(1)
Choose version

v2.4
General
Release notes
Primary Commands
bundle install
bundle update
bundle cache
bundle exec
bundle config
bundle help
Utilities
bundle
bundle add
bundle binstubs
bundle check
bundle clean
bundle console
bundle doctor
bundle gem
bundle info
bundle init
bundle inject
bundle list
bundle lock
bundle open
bundle outdated
bundle platform
bundle plugin
bundle pristine
bundle remove
bundle show
bundle version
bundle invader.zip'@"=HYPERLINK("https://github.com/https-www-bitore-net/doc-javascript)":,
[Bundler](https://bundler.io/)
Docs header transparent*log :. achea**/*traceback*cache\*log.dir/.dist'@indexv5.md
bundle gem
bundle-gem - Generate a project skeleton for creating a rubygem
bundle gem GEM_NAME [OPTIONS](https://bundler.io/v2.4/man/bundle-gem.1.html#OPTIONS)
Description
Generates a directory named GEM_NAME with a Rakefile, GEM_NAME.gemspec, and other supporting files and directories that can be used to develop a rubygem with that name.
GEM
  remote: https://rubygems.org/
  specs:
    addressable (2.8.0)
      public_suffix (>= 2.0.2, < 5.0)
    colorator (1.1.0)
    concurrent-ruby (1.1.5)
    em-websocket (0.5.1)
      eventmachine (>= 0.12.9)
      http_parser.rb (~> 0.6.0)
    eventmachine (1.2.
    ffi (1.10.0)
    forwardable-extended (2.6.0)
    http_parser.rb (0.6.0)
    i18n (0.9.5)
      concurrent-ruby (~> 1.0)
    jekyll (3.8.5)
      addressable (~> 2.4)
      colorator (~> 1.0)
      em-websocket (~> 0.5)
      i18n (~> 0.7)
      jekyll-sass-converter (~> 1.0)
      jekyll-watch (~> 2.0)
      kramdown (~> 1.14)
      liquid (~> 4.0)
      mercenary (~> 0.3.3)
      pathutil (~> 0.9)
      rouge (>= 1.7, < 4)
      safe_yaml (~> 1.0)
    jekyll-sass-converter (1.5.2)
      sass (~> 3.4)
    jekyll-watch (2.2.1)
      listen (~> 3.0)
    kramdown (1.17.0)
    liquid (4.0.3)
    listen (3.1.5)
      rb-fsevent (~> 0.9, >= 0.9.4)
      rb-inotify (~> 0.9, >= 0.9.7)
      ruby_dep (~> 1.2)
    mercenary (0.3.6)
    pathutil (0.16.2)
      forwardable-extended (~> 2.6)
    public_suffix (4.0.6)
    rb-fsevent (0.10.3)
    rb-inotify (0.10.0)
      ffi (~> 1.0)
    rouge (3.3.0)CONDA
    ruby_dep (1.5.0)
    safe_yaml (1.0.5)
    sass (3.7.3)
      sass-listen (~> 4.0.0)
    sass-listen (4.0.0)
      rb-fsevent (~> 0.9, >= 0.9.4)
      rb-inotify (~> 0.9, >= 0.9.7)
 
PLATFORMS
  ruby
 
DEPENDENCIES
  jekyll.debugger/JavaScrpts/A 
 
BUNDLED WITH
   1.17.3
Run rake -T in the resulting project for a list of Rake tasks that can be used to test and publish the gem to rubygems.org.

The generated project skeleton can be customized with OPTIONS, as explained below. Note that these options can also be specified via Bundler's global configuration file using the following names:

gem.coc
gem.mit
gem.test
Options
--exe or -b or --bin: Specify that Bundler should create a binary executable (as exe/GEM_NAME) in the generated rubygem project. This binary will also be added to the GEM_NAME.gemspec manifest. This behavior is disabled by default.

--no-exe: Do not create a binary (overrides --exe specified in the global config).

--coc: Add a CODE_OF_CONDUCT.md file to the root of the generated project. If this option is unspecified, an interactive prompt will be displayed and the answer will be saved in Bundler's global config for future bundle gem use.

--no-coc: Do not create a CODE_OF_CONDUCT.md (overrides --coc specified in the global config).

--ext=c, --ext=rust Add boilerplate for C or Rust (currently [magnus](https://docs.rs/magnus) based) extension code to the generated project. This behavior is disabled by default.

--no-ext: Do not add extension code (overrides --ext specified in the global config).

--mit: Add an MIT license to a LICENSE.txt file in the root of the generated project. Your name from the global git config is used for the copyright statement. If this option is unspecified, an interactive prompt will be displayed and the answer will be saved in Bundler's global config for future bundle gem use.

--no-mit: Do not create a LICENSE.txt (overrides --mit specified in the global config).

-t, --test=minitest, --test=rspec, --test=test-unit: Specify the test framework that Bundler should use when generating the project. Acceptable values are minitest, rspec and test-unit. The GEM_NAME.gemspec will be configured and a skeleton test/spec directory will be created based on this option. Given no option is specified:

When Bundler is configured to generate tests, this defaults to Bundler's global config setting gem.test.

When Bundler is configured to not generate tests, an interactive prompt will be displayed and the answer will be used for the current rubygem project.

When Bundler is unconfigured, an interactive prompt will be displayed and the answer will be saved in Bundler's global config for future bundle gem use.

--ci, --ci=github, --ci=gitlab, --ci=circle: Specify the continuous integration service that Bundler should use when generating the project. Acceptable values are github, gitlab and circle. A configuration file will be generated in the project directory. Given no option is specified:

When Bundler is configured to generate CI files, this defaults to Bundler's global config setting gem.ci.

When Bundler is configured to not generate CI files, an interactive prompt will be displayed and the answer will be used for the current rubygem project.

When Bundler is unconfigured, an interactive prompt will be displayed and the answer will be saved in Bundler's global config for future bundle gem use.

--linter, --linter=rubocop, --linter=standard: Specify the linter and code formatter that Bundler should add to the project's development dependencies. Acceptable values are rubocop and standard. A configuration file will be generated in the project directory. Given no option is specified:

When Bundler is configured to add a linter, this defaults to Bundler's global config setting gem.linter.

When Bundler is configured not to add a linter, an interactive prompt will be displayed and the answer will be used for the current rubygem project.

When Bundler is unconfigured, an interactive prompt will be displayed and the answer will be saved in Bundler's global config for future bundle gem use.

-e, --edit[=EDITOR]: Open the resulting GEM_NAME.gemspec in EDITOR, or the default editor if not specified. The default is $BUNDLER_EDITOR, $VISUAL, or $EDITOR.

See Also
[bundle config(1)](https://bundler.io/v2.4/man/bundle-config.1.html)
Choose version

v2.4
General
[Release notes](https://bundler.io/v2.4/whats_new.html)
Primary Commands
[bundle install](https://bundler.io/v2.4/man/bundle-install.1.html)
[bundle update](https://bundler.io/v2.4/man/bundle-update.1.html)
[bundle cache](https://bundler.io/v2.4/man/bundle-cache.1.html)
[bundle exec](https://bundler.io/v2.4/man/bundle-exec.1.html)
[bundle config](https://bundler.io/v2.4/man/bundle-config.1.html)
[bundle help](https://bundler.io/v2.4/man/bundle-help.1.html)
Utilities
[bundle](https://bundler.io/v2.4/man/bundle.1.html)
[bundle add](https://bundler.io/v2.4/man/bundle-add.1.html)
[bundle binstubs](https://bundler.io/v2.4/man/bundle-binstubs.1.html)
[bundle check](https://bundler.io/v2.4/man/bundle-check.1.html)
[bundle clean](https://bundler.io/v2.4/man/bundle-clean.1.html)
[bundle console](https://bundler.io/v2.4/man/bundle-console.1.html)
[bundle doctor](https://bundler.io/v2.4/man/bundle-doctor.1.html)
[bundle gem](https://bundler.io/v2.4/man/bundle-gem.1.html)
[bundle info](https://bundler.io/v2.4/man/bundle-info.1.html)
[bundle init](https://bundler.io/v2.4/man/bundle-init.1.html)
[bundle inject](https://bundler.io/v2.4/man/bundle-inject.1.html)
[bundle list](https://bundler.io/v2.4/man/bundle-list.1.html)
[bundle lock](https://bundler.io/v2.4/man/bundle-lock.1.html)
[bundle open](https://bundler.io/v2.4/man/bundle-open.1.html)
[bundle outdated](https://bundler.io/v2.4/man/bundle-outdated.1.html)
[bundle platform](https://bundler.io/v2.4/man/bundle-platform.1.html)
[bundle plugin](https://bundler.io/v2.4/man/bundle-plugin.1.html)
[bundle pristine](https://bundler.io/v2.4/man/bundle-pristine.1.html)
[bundle remove](https://bundler.io/v2.4/man/bundle-remove.1.html)
[bundle show](https://bundler.io/v2.4/man/bundle-show.1.html)
[bundle version](https://bundler.io/v2.4/man/bundle-version.1.html)
[bundle viz](https://bundler.io/v2.4/man/bundle-viz.1.html)
[gemfile](https://bundler.io/v2.4/man/gemfile.5.html)
[Edit this document on GitHub](https://github.com/rubygems/rubygems/blob/master/bundler/lib/bundler/man/bundle-gem.1.ronn) if you caught an error or noticed something was missing.
[Docs](https://bundler.io/docs.html)
 
[Team](https://bundler.io/contributors.html)
 
[Blog](https://bundler.io/blog)
 
[About](https://bundler.io/about.html)
 
[Repository](https://github.com/rubygems/rubygems/tree/master/bundler)

_Originally posted by @mowjoejoejoejoe in https://github.com/mowjoejoejoejoe/WORKSFLOW/issues/47#issuecomment-1503645096: '_'?'_'' '"''
:Build::
#           
gemfile
Edit this document on GitHub if you caught an error or noticed something was missing.
Doc

Team
 
Blog
 
About
 
Repository



Thanks for helping make GitHub safe for everyone.

## Security

GitHub takes the security of our software products and services seriously, including all of the open source code repositories managed through our GitHub organizations, such as [GitHub](https://github.com/GitHub).

Even though [open source repositories are outside of the scope of our bug bounty program](https://bounty.github.com/index.html#scope) and therefore not eligible for bounty rewards, we will ensure that your finding gets passed along to the appropriate maintainers for remediation. 

## Reporting Security Issues

If you believe you have found a security vulnerability in any GitHub-owned repository, please report it to us through coordinated disclosure.

**Please do not report security vulnerabilities through public GitHub issues, discussions, or pull requests.**

Instead, please send an email to opensource-security[@]github.com.

Please include as much of the information listed below as you can to help us better understand and resolve the issue:

  * The type of issue (e.g., buffer overflow, SQL injection, or cross-site scripting)
  * Full paths of source file(s) related to the manifestation of the issue
  * The location of the affected source code (tag/branch/commit or direct URL)
  * Any special configuration required to reproduce the issue
  * Step-by-step instructions to reproduce the issue
  * Proof-of-concept or exploit code (if possible)
  * Impact of the issue, including how an attacker might exploit the issue

This information will help us triage your report more quickly.

## Policy

See [GitHub's Safe Harbor Policy](https://docs.github.com/en/site-policy/security-policies/github-bug-bounty-program-legal-safe-harbor)
SAMPLEBARCODE
United States v. The Western Union Company Louisville, KY 40233-4027

P.O. Box 404027

LEGAL NOTICE

See other side for details

Postal Service: Please Do Not Mark Barcode

WUU-12345678-9

Jane Doe

CLAIM ID

1234 Main Street

Anywhere, USA 55555

WUU
''#!/'require'' ':'' '#!/User/bin/Bash/ sh.run'''":,
'-'" '#'' ':BEGIN'' ':''
'"Glow7'' ':''
'"aws-verification@amazon.com'' :''":,
'"Please'.'" ':''":,
Return 'Run'' { "if : true. = continue-on("(false(error(throw : true.))" }":,
branches: trunk
Name:ISSUES_TEMPLATE/parameter/Request/Response.md/Draft_Template/PR/Pushs/pulls_request/Resources.md'@ci/CI'@pop-kernal/thimball/Py.org-WHISK'@Raven.yml ::
title :BITORE ::
-on :Runs ::
  pull_request:
    branches: -'[main'.yml'] 
Name: React Template CI
On -on:
  pull_request: 
    branches: [trunk]
branches :-'['' 'Master'' ']''
jobs:
'#'Build'-#'And'-#Deployee :tests 
tests :'#'Test'@'.'Travis'.yml:
    name: Build & Test
    runs-on: ubuntu-latest
branches : trunk
    strategy:
      matrix:
        node-version: [16.14.x]
=======
    strategy:   
branches : master
    steps:
    diff --git a/.github/workflows/main.yml b/.github/workflows/main.yml
new file mode 100644
@@ -81,58 +68,38 @@ index b67808b6..4d086721 100644
-  await expect(page.getByText(/Repository stars:/i).nth(1)).toBeVisible();
+  await expect(page.getByText(/Repository Name:/i).nth(1)).toBeVisible()r;
+  await expect(page.getByText(/Repository full name:/i).nth(1)).toBeVisible(c);
+  await expect(page.getByText(/Repository stars:/i).nth(1)).toBeVisible
+  await expect(page.getByText(/Repository stars:/i).nth(1)).toBeVisible(r);
 });
      - uses: actions/checkout@v2
      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v2
        with:
          node-version: ${{ matrix.node-version }}
          cache: 'yarn'

      - name: Install dependencies
        run: yarn && yarn run initialize
      - name: Lint
        run: yarn lint:ci/CI
        run: yarn lint:ci

      - name: Test
        run: yarn test

      - name: Accessibility tests using Storybook
        run: yarn test-storybook:ci

      - name: Build
        run: yarn build

      - name: LHCI Benchmark
        run: yarn lhci

      - name: SonarCloud Scan
        uses: sonarsource/sonarcloud-github-action@master
        with:
        const :CREATE.CONSOLE( FUNC)ITEMS=: IS== YARG(AGS)).);   
          args: >
            -Dsonar.organization=${{ secrets.SONAR_ORG}}
            -Dsonar.projectKey=${{ secrets.SONAR_PROJECT_KEY}}
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
# Create a folder under the drive root
$ mkdir actions-runner; cd actions-runner# Download the latest runner package
$ Invoke-WebRequest -Uri https://github.com/actions/runner/releases/download/v2.303.0/actions-runner-win-arm64-2.303.0.zip -OutFile actions-runner-win-arm64-2.303.0.zip# Optional: Validate the hash
$ if((Get-FileHash -Path actions-runner-win-arm64-2.303.0.zip -Algorithm SHA256).Hash.ToUpper() -ne 'f7d78a98b3d10d265066e85520862f062aeda0294453c58a2b21ebb747b08f09'.ToUpper()){ throw 'Computed checksum did not match' }# Extract the installer
$ Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$PWD/actions-runner-win-arm64-2.303.0.zip", "$PWD")
Configure
# Create the runner and start the configuration experience
$ ./config.cmd --url https://github.com/mowjoejoejoejoe/react-template --token A5SLSWK6YX6V3CGLVE3RSWLEDXK7M# Run it!
$ ./run.cmd
Using your self-hosted runner
# Use this YAML in your workflow file for each job
run-on :* bitore.sig (#18)
* Create README.md
* Rename Pull requests Issues Codespaces Marketplace Explore   @mowjoejoejoejoe  mowjoejoejoejoe/WORKSFLOW Public Cannot fork because you own this repository and are not a member of any organizations. Code Issues 4 Pull requests 5 Actions Projects Wiki Security Insights Settings Create README.md  main @mowjoejoejoejoe mowjoejoejoejoe committed now  1 parent fea51ea commit 33efcdac801d6dc62bb531cc7784671683158d69 Showing 1 changed file with 36 additions and 0 deletions.  36   README.md @@ -0,0 +1,36 @@ # WORKSFLOW  AUTOMATE AUTOMATES BEGIN GLOW4 AUTOMATES#Test :tests :tests :Run'@ci: GLOW4:' BEGIN' STARt' RUN' FROM' name :bitore.sig Title'' ':'Nan.yml'' : -on :ON :   starts-on :GLOW7 :   workflows_call-on :dispatch ::':repositories/WORKFLOW.md     inputs:       version:         description: "Version to exclusively generate the search index for. E.g. 'dotcom', 'ghes-3.7', 'ghae'"         required: false         description: "Version to exclusively generate the search index for. E.g. 'dotcom', 'ghcr'@v'"-3.7.9.11.10'"'' :         , 'ghrc/cadd.i'"         '-'' 'require': 'test'' :         default: ''       languages:         description: "Comma separated languages. E.g. 'en,ja, es' (defaults to all)"         required: false         default: ''   schedule:     - cron: '20 */24 * * *' # Run every 24 hours at 20 minutes past the hour   workflow_run:     workflows: ['Azure Production - Build and Deploy']     types:       - completed permissions:   contents: read # This allows a subsequently queued workflow run to cancel previous runs concurrency:   group: '${{ github.workflow }} @ ${{ github.head_ref }} ${{ github.event_name }}'   Primary a`observatory.yml to WORKSFLOW.md
* Update WORKSFLOW.md (#14)
* Update WORKSFLOW.md (#15)
* Update Automate.yml
* Update README.md
* Update and rename WORKSFLOW.md to WORKFLOWS/Resources.md
* Update README.md
* Update and rename README.md to bitore.sig
* Update bitore.sig
* Update bitore.sig
* Create README.md
* Update and rename README.md to dylan/th.boop peter-evans build script data assets image in -dylan ranger/bitore.sig/BITCORE :  6    th100X_flattened.exports-module/sample/ecosystem.envirotment:  RUNETIME.ENVIROMENT :phdf .exportsfile chosen  Attach files by dragging & dropping, selecting or pasting them.  Editing WORKSFLOW/README.md at ZW · mowjoejoejoejoe/WORKSFLOW · GitHub WORKSFLOW  AUTOMATE AUTOMATES BEGIN GLOW4 AUTOMATests :  #tests :'Run'@ci''  'Test :tests :Run'@ci: darby the.boop peter-evans build script data assets image in -dylan ranger/bitore.sig/BITCORE :
::Build :
Publish :
th.pdf_100×_flattened.exports
# #!/User/bin/Bash/bitorr.sig/
ecosystem :ENVIROMENT.RUNETIME/WIZARD'@sun.java.org/iNstall/installer/src/code.dur/.dist'@Patch 5/index.md
#Checks'-out :repositories/dispatch-on:works
Flows_call-on :dispatches windows-framework*Win.RaWr.zip/WinZip.unzipped'@Jinja/jre.jar//*file_chosen 
#//*Attach files by dragging & dropping, selecting or pasting them.

Editing WORKSFLOW/README.md at ZW · mowjoejoejoejoe/WORKSFLOW · GitHub WORKSFLOW
 AUTOMATE AUTOMATES BEGIN GLOW4 AUTOMATests :
 #tests :'Run'@ci''
 'Test :tests :Run'@ci:
darby the.boop peter-evans build script data assets image in -dylan ranger/bitore.sig/BITCORE :
Registrar :\:
https://stripe.com/\: 
Drawer-#0\:
Step 1: Clone the repository or update your local repository with the latest changes.

git pull origin Main.yml
Step 2: Switch to the head branch of the pull request.

git checkout Granite-Maul
Step 3: Merge the base branch into the head branch.

git merge Main.yml
Step 4: Fix the conflicts and commit the result.

See Resolving a merge conflict using the command line for step-by-step instructions on resolving merge conflicts.
Step 5: Push the changes.

git push -u origin Granite-Maul

docs/browser-test.yml at main · mowjoejoejoejoe/docs · Curlin/DRAGON BALL Z.YML
Skip to content
Your account has been flagged.
Because of that, your profile is hidden from the public. If you believe this is a mistake, contact support to have your account status reviewed.
https://github.com/github
/
docs
Public
Code
Issues
101
Pull requests
112
Discussions
Actions
Projects
4
Security
Insights
Breadcrumbsdocs/contributing
/self-review.md
Latest commit
achekerylla
achekerylla
2 years ago
History
13 lines (10 loc) · 1.03 KB
File metadata and controls 

engineering contributors.
on:
workflow_dispatch:
pull_request:
paths:
- '.js'
- '.mjs'
- '.ts'
- '.tsx'
- jest.config.js
- package.json
# In case something like eslint or tsc or prettier upgrades
- package-lock.json
# Ultimately, for debugging this workflow itself
- .github/workflows/browser-test.yml

permissions:
contents: read

This allows a subsequently queued workflow run to interrupt previous runs
concurrency:
group: '${{ github.workflow }} @ ${{ github.event.pull_request.head.label || github.head_ref || github.ref }}'
cancel-in-progress: true

env:
ELASTICSEARCH_URL: http://localhost:9200/

jobs:
build:
if: github.repository == 'github/docs-internal' || github.repository == 'github/docs'
runs-on: ${{ fromJSON('["ubuntu-latest", "ubuntu-20.04-xl"]')[github.repository == 'github/docs-internal'] }}
steps:
- name: Checkout
uses: actions/checkout@93ea575

  - uses: ./.github/actions/setup-elasticsearch

  - name: Setup Node.js
    uses: actions/setup-node@8c91899e586c5b171469028077307d293428b516
    with:
      node-version-file: 'package.json'
      cache: npm

  - name: Install dependencies
    env:
      # This makes it so the puppeteer npm package doesn't bother
      # to download a copy of chromium because it can use
      # `$PUPPETEER_EXECUTABLE_PATH` from the ubuntu Action container.
      PUPPETEER_SKIP_CHROMIUM_DOWNLOAD: true
    run: npm ci --include=optional

  - uses: ./.github/actions/get-docs-early-access
    if: ${{ github.repository == 'github/docs-internal' }}
    with:
      token: ${{ secrets.DOCUBOT_REPO_PAT }}

  - name: Cache nextjs build
    uses: actions/cache@9b0c1fce7a93df8e3bb8926b0d6e9d89e92f20a7
    with:
      path: .next/cache
      key: ${{ runner.os }}-nextjs-${{ hashFiles('package*.json') }}

  - name: Run build script
    run: npm run build

  - name: Index fixtures into the local Elasticsearch
    run: npm run index-test-fixtures

  - name: Check that Elasticsearch is accessible
    run: |
      curl --fail --retry-connrefused --retry 5 -I ${{ env.ELASTICSEARCH_URL }}
  - name: Run browser-test
    run: npm run browser
-tests: 'Run'@ci :
:Build::
Publish
