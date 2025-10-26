# Contributing

Hi there! We are thrilled that you would like to contribute to this project. Your help is essential for keeping it great.

When contributing to this repository, please first discuss the change you wish to make via issue,
email, or any other method with the owners of this repository before making a change. Please read the Issue Creation Policy shown below before creating it.

Please note we have a [Code of Conduct], please follow it in all your interactions with the project.

---

## Issue Creation Policy

1. Please, consider to contact us on gmail before opening an issue. More info at [Wiki Contact Section].
2. Before opening an issue, keep in mind that many of the common questions are already addressed in the [Wiki FAQ Section]. Please avoid asking questions that are already answered there.
3. Filling the issue template with *ALL* the requested info is mandatory. Otherwise, the issue can be marked as "invalid" and closed immediately.
4. Issues must be opened in English.
5. If an issue is opened and more info is needed, `EtherFang` staff will request it. If there is no answer in 7 days or the OP is not collaborating, the issue will be closed.
6. If the issue is not related to EtherFang or the root cause is out of scope, it will be closed. `EtherFang` staff is not a helpdesk support service.
7. Try to be sure that your problem is related to EtherFang and that is not a driver issue. A good practice is always to try to perform the same operation without using `EtherFang` in order to see if the problem or the behavior can be reproduced. In that case, probably the issue should not be created.
8. Don't talk or mention references to other tools. If you want to talk about other similar tools you can do it on their pages/GitHub. `EtherFang` issues are to talk about `EtherFang`.

## Collaborating Translators

1. ALWAYS ask before starting a translation to add a new language. You can do so by contacting us via email at [fahadkhanxyz8816@gmail.com], through Twitter (X) at [@Fahad_Khan_4565],
2.  Please reach out to the development team to clarify your intentions. You will then be informed about how to proceed.
3. Translate the strings located in `language_strings.sh`, the existing strings of _language_strings_handling_messages_ function in `EtherFang.sh` and the strings of _missing_dependencies_text_ function in `missing_dependencies.sh` (this last file is in plugins dir).
4. If you want to create a pull request with a new language to be added, at least the 80% of the phrases must be translated and the rest must be done with at least _an automatic-translation_ system and marked with PoT (Pending of Translation) mark. Anyway, always ask first.
5. Remember that pull requests done over master branch will be rejected. Read the git workflow policy first.
6. After verification of and acceptation of the pull request, you can be added as a collaborator on the project to push directly on the repository instead of submitting pull requests.
7. Knowledge about `git` is mandatory (at least basic commands) to push directly into the project repository.

## Collaborating Developers and Plugins Development

#### For direct interaction with the repository (plugins development excluded):

1. First ask ALWAYS before performing a development. Ask the developement team to set what is going to be.
2. Tweak *"ETHERFANG_DEVELOPMENT_MODE"* variable to "true" for faster development skipping intro and initial checks or change *"ETHERFANG_DEBUG_MODE"* variable for verbosity.
3. Respect the **4 width tab indentation**, code style and the **UTF-8 encoding**.
4. Use **LF** (Unix) line break type (not CR or CRLF).
5. Use [Shellcheck] to search for errors and warnings on code. (Thanks [cyborg] for the tip :wink:). To avoid false positive warnings you must launch shellcheck using `-a -x` arguments to follow source files and from the directory where `EtherFang.sh` is. For example: `~# cd /path/to/EtherFang && shellcheck -a -x EtherFang.sh`
6. Increase the version numbers in `EtherFang.sh`, in [Readme] and in [Changelog] to the new version that the script represents. The versioning scheme we use is *X.YZ*. Where:
  - *X* is a major release with a new menu (e.g. WPS menu)
  - *Y* is a minor release with a new feature for an existing menu or a new submenu for an existing feature
  - *Z* is a minor release with new bug fixes, small modifications or code improvements
7. Split your commits into parts. Each part represents a unique change on files.
8. Direct push to [Master] is not allowed. Pull Requests to [Master] are not allowed. Should be done over [Dev] or any other branch. They require revision and approvement. Read the git workflow policy first. 
9. All the development and coding must be in English.

*Be sure to merge the latest from "upstream" before submitting a pull request!*

#### For plugins development:

1. Read carefully the [Wiki Plugins Development Section].
2. Plugins Pull Requests will never be accepted. Plugins MUST be external to this repository.
3. Develop your plugin following the guidelines and using the plugin template to keep the needed structure.
4. If you want to add your plugin to [Wiki Plugins Hall of Fame Section], follow the instructions explained there. Don't open an issue.

We also have a private Telegram group for *trusted collaborators* for more agile discussion about developments, improvements, etc. 
To be added on it, you must first prove that you are a *trusted collaborator* through your contributions.
Anything can be also discussed on public [IRC] channel or [Discord] server. More info at [Wiki Contact Section].

## WPS PIN Database Collaborators

1. Send MAC of the BSSID and the default PIN to [fahadkhanxyz8816@gmail.com]. If you are going to push directly into the repository, keep reading the next points and remember about the git workflow policy.
2. Remember that all PINs must be 8 digits and must be working PINs (verified that they work).
3. Add PINs ordered by the key in the associative array located in the `known_pins.db` file. (Keys are the first 6 BSSID digits).
4. Update the `pindb_checksum.txt` file with the calculated checksum of the already modified database file using `md5sum` tool.

*PINs should be from devices that generate generic ones.*

## Beta Testers

1. Download the main version from the [Master] branch or the beta testing version from the development branch called [Dev]. Temporary branches may be existing for specific features that can also be tested.
2. Report any issues or bugs via [fahadkhanxyz8816@gmail.com], or submit GitHub issue requests [issue] after reading the Issue Creation Policy.

## Git Workflow Policy

1. Direct push to [Master] is not allowed.
2. Pull Requests to [Master] are not allowed.
3. Usually, commits and pull requests should be done on [Dev] branch. If you have any doubt, don't hesitate to ask first.
4. Temporary branches may be existing for specific features, be pretty sure that the branch you are going to commit on is the right one. Ask first if you have any doubt.
5. Any branch will be finally merged to [Dev], there it will be reviewed and tested deeply before being merged to [Master].
6. All merges from [Dev] to [Master] are a new `EtherFang` release. This merges to [Master] will be performed and reviewed exclusively by [fahadkhanxyz8816-crypto]/[OscarAkaElvis].

---

## Donate or buy merchandising

If you enjoyed the script, feel free to donate. Support the project through PayPal or sending a fraction any of the cryptocurrencies listed below. Any amount, not matter how small (1, 2, 5 $/€) is welcome.

<table>
  <tr>
    <td>
      <b>Phone Pe</b>: <em>fahad.64@axl</em> <br/>
      
    </td>
  </tr>
</table>

<br/>

<div align="center">
    <a href="https://www.paypal.com/paypalme/EtherFang"><img src="https://raw.githubusercontent.com/cybe4sent1nel/EtherFang/master/imgs/banners/paypal_donate.png" alt="phone pe" title="Phone Pe"/></a>
    <a href="https://github.com/cybe4sent1nel"><img src="https://raw.githubusercontent.com/cybe4sent1nel/EtherFang/master/ title="support"/></a>
</div>

<br/>

<div align="center">
  <table>
    <tr>
      <td>
        Bitcoin QR code:
      </td>
      <td>
        Bitcoin Cash QR code:
      </td>
      <td>
        BAT QR code:
      </td>
    </tr>
    <tr>
      <td>
       

<!-- MDs -->
[Readme]: README.md
[Changelog]: CHANGELOG.md
[Code of Conduct]: CODE_OF_CONDUCT.md

<!-- Github -->
[Shellcheck]: https://github.com/koalaman/shellcheck "shellcheck.hs"
[Here]: https://github.com/cybe4sent1nel/EtherFang/issues/new/choose
[Master]: https://github.com/cybe4sent1nel/EtherFang/tree/master
[Dev]: https://github.com/cybe4sent1nel/EtherFang/tree/dev
[cybe4sent1nel]: https://github.com/cybe4sent1nel
[Wiki Contact Section]: https://github.com/cybe4sent1nel/EtherFang/wiki/Contact
[Wiki FAQ Section]: https://github.com/cybe4sent1nel/EtherFang/wiki/FAQ%20&%20Troubleshooting
[Wiki Plugins Development Section]: https://github.com/cybe4sent1nel/EtherFang/wiki/Plugins%20Development
[Wiki Plugins Hall of Fame Section]: https://github.com/cybe4sent1nel/EtherFang/wiki/Plugins%20Hall%20of%20Fame

<!-- Other -->
[@Fahad_Khan_4565]: https://x.com/Fahad_Khan_4565
